import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.workflow.core.app.design.DesignerWorkerAPI
import com.haulmont.workflow.core.entity.Design
import com.haulmont.workflow.core.entity.DesignScript
import com.haulmont.workflow.core.entity.Proc
import com.haulmont.workflow.core.exception.DesignCompilationException
import com.haulmont.workflow.core.exception.DesignDeploymentException
import org.apache.commons.lang.StringUtils
import org.json.JSONArray
import org.json.JSONObject

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author kozyaikin
 * @version $Id: 150203-1302-migrateScriptInDesigns.groovy 19100 2015-02-18 11:48:21Z kozyaikin $
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class);
    DesignerWorkerAPI designerWorkerAPI = AppBeans.get(DesignerWorkerAPI.class);
    List<Design> migratedDesign = new ArrayList<>();
    Transaction tx = persistence.getTransaction();
    try {
        EntityManager em = persistence.getEntityManager();

        TypedQuery<Design> q = em.createQuery("select d from wf\$Design d", Design.class);
        q.setView(Design.class, "_local");
        List<Design> designs = q.getResultList();
        for (Design design : designs) {
            Map<String, DesignScript> migratedDesignScripts = new HashMap<>();
            TypedQuery<DesignScript> qScripts = em.createQuery(
                    "select s from wf\$DesignScript s where s.design.id = ?1", DesignScript.class);
            qScripts.setParameter(1, design.getId());
            List<DesignScript> designScripts = qScripts.getResultList();
            JSONObject jsonObject = new JSONObject(design.getSrc());
            JSONArray modules = jsonObject.getJSONObject("working").optJSONArray("modules");
            if (modules != null) {
                for (int i = 0; i < modules.length(); i++) {
                    JSONObject moduleValue = ((JSONObject) modules.get(i)).getJSONObject("value");
                    if (moduleValue != null && StringUtils.isNotEmpty(moduleValue.optString("script"))) {
                        String scriptName = moduleValue.optString("script");
                        boolean isProjectScript = false;
                        for (DesignScript designScript : designScripts) {
                            if (scriptName.equals(designScript.getName())) {
                                isProjectScript = true;
                                break;
                            }
                        }
                        if (!isProjectScript) {
                            DesignScript designScript = migratedDesignScripts.get(scriptName);
                            if (designScript == null) {
                                String lastPartScriptName = scriptName.contains("/") ? scriptName.substring(scriptName.lastIndexOf("/") + 1) : scriptName.substring(scriptName.lastIndexOf("\\") + 1);
                                designScript = new DesignScript();
                                designScript.setDesign(design);
                                designScript.setName(lastPartScriptName.split("\\.")[0]);
                                designScript.setContent(scriptName);
                                migratedDesignScripts.put(scriptName, designScript);
                            }
                            moduleValue.put("script", designScript.getName());
                        }
                    }
                }
                if (!migratedDesignScripts.isEmpty()) {
                    migratedDesign.add(design);
                    design.setSrc(jsonObject.toString());
                    em.merge(design);
                    for (DesignScript designScript : migratedDesignScripts.values()) {
                        em.persist(designScript);
                    }
                }
            }
        }
        tx.commitRetaining();
        em = persistence.getEntityManager();
        for (Design design : migratedDesign)
            try {
                if (design.getCompileTs() != null) {
                    TypedQuery<Proc> qProc = em.createQuery("select p from wf\$Proc p where p.design.id=:designId", Proc.class);
                    qProc.setParameter("designId", design.getId());
                    Proc proc = qProc.getFirstResult();
                    if (proc != null) {
                        designerWorkerAPI.compileDesign(design.getId());
                        em.flush();
                        designerWorkerAPI.deployDesign(design.getId(), proc.getId(), proc.getAvailableRole());
                    }
                }
            } catch (DesignCompilationException | DesignDeploymentException e) {
                throw new RuntimeException(e);
            }
        tx.commit();
    } catch (Exception e) {
        throw new RuntimeException(e);
    } finally {
        tx.end();
    }
})