import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.workflow.core.entity.Design
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
 * @version $Id: 150204-1553-migrateScriptToOptionInDesign.groovy 18927 2015-02-04 13:02:11Z kozyaikin $
 */

postUpdate.add({
    Persistence persistence = AppBeans.get(Persistence.class);
    Transaction tx = persistence.getTransaction();
    try {
        EntityManager em = persistence.getEntityManager();

        TypedQuery<Design> q = em.createQuery("select d from wf\$Design d", Design.class);
        q.setView(Design.class, "_local");
        List<Design> designs = q.getResultList();
        for (Design design : designs) {
            JSONObject jsonObject = new JSONObject(design.getSrc());
            JSONArray modules = jsonObject.getJSONObject("working").optJSONArray("modules");
            if (modules != null) {
                for (int i = 0; i < modules.length(); i++) {
                    JSONObject moduleValue = ((JSONObject) modules.get(i)).getJSONObject("value");
                    if (moduleValue != null && StringUtils.isNotEmpty(moduleValue.optString("script"))) {
                        String scriptName = moduleValue.optString("script");
                        JSONObject JSONOptions = moduleValue.optJSONObject("options")
                        if (JSONOptions != null)
                            JSONOptions.put("script", scriptName);
                        moduleValue.remove("script");
                    }
                }
                design.setSrc(jsonObject.toString());
                em.merge(design);
            }
        }
        tx.commit();
    } catch (Exception e) {
        throw new RuntimeException(e);
    } finally {
        tx.end();
    }
})