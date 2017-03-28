/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */


import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Configuration
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.cuba.core.sys.listener.EntityListenerManager
import com.haulmont.cuba.security.entity.User
import com.haulmont.thesis.core.app.FormatTools
import com.haulmont.thesis.core.config.DefaultEntityConfig
import com.haulmont.thesis.core.entity.*
import com.haulmont.thesis.core.listener.MeetingDocEntityListener
import com.haulmont.thesis.core.listener.MeetingParticipantEntityListener
import com.haulmont.workflow.core.entity.CardAttachment
import org.apache.commons.collections.CollectionUtils
import org.apache.commons.lang.BooleanUtils
import org.apache.commons.lang.StringUtils

/**
 * @author hasanov
 * @version $Id: 150507-1233-migrateTaskGroupProtocolToMeetingDoc.groovy 22054 2015-10-07 10:25:49Z timokhov $
 */

postUpdate.add({
    EntityListenerManager listenerManager = AppBeans.get(EntityListenerManager.class);
    FormatTools formatTools = AppBeans.get(FormatTools.class);
    Metadata metadata = AppBeans.get(Metadata.class);
    Persistence persistence = AppBeans.get(Persistence.class);
    MeetingParticipantEntityListener participantEntityListener = AppBeans.get(MeetingParticipantEntityListener.class);
    MeetingDocEntityListener meetingDocEntityListener = AppBeans.get(MeetingDocEntityListener.class);
    Transaction tx = persistence.createTransaction();
    EntityManager em = persistence.getEntityManager();
    em.setSoftDeletion(false);
    List<TaskGroup> taskGroups = new ArrayList<>();
    List<TaskGroupTask> taskGroupTasks = new ArrayList<>();
    listenerManager.enable(false);
    try {
        DocKind meetingDocKind = (DocKind) em.createQuery("select d from df\$DocKind d where d.id=:id").setParameter("id", UUID.fromString("9415792f-c473-cbeb-d150-8ae687c4dcd2")).setView(DocKind.class, "_minimal").getFirstResult();
        if (meetingDocKind == null)
            return
        Configuration configuration = AppBeans.get(Configuration.NAME);
        Organization defaultOrganization = configuration.getConfig(DefaultEntityConfig.class).getOrganizationDefault();
        taskGroups.addAll(em.createQuery("select t from tm\$TaskGroup t where t.taskGroupType =:type").setParameter("type", "Protocol").setView(TaskGroup.class, "edit").getResultList());
        if (CollectionUtils.isNotEmpty(taskGroups)) {
            taskGroups.each { taskGroup ->
                MeetingDoc meetingDoc = metadata.create(MeetingDoc.class);
                meetingDoc.setNumber(taskGroup.getNumber());
                meetingDoc.setParentCard(taskGroup.getParentCard());
                meetingDoc.setOrganization(taskGroup.getOrganization() == null ? defaultOrganization : taskGroup.getOrganization());
                meetingDoc.setDateTime(taskGroup.getDateMeet());
                meetingDoc.setTarget(taskGroup.getGoal());
                meetingDoc.setTheme(StringUtils.isEmpty(taskGroup.getName()) ? "" : (taskGroup.getName() + ". ") + (taskGroup.getName().equals(taskGroup.getTheme()) ? "" : StringUtils.defaultIfEmpty(taskGroup.getTheme(), "")));
                meetingDoc.setInitiator(taskGroup.getInitiator());
                meetingDoc.setChairman(taskGroup.getChairman());
                meetingDoc.setSecretary(taskGroup.getSecretary());
                meetingDoc.setDocKind(meetingDocKind);
                meetingDoc.setComment(taskGroup.getDiscussed());
                meetingDoc.setStatus(MeetingTypes.PROTOCOL);
                meetingDoc.setState(",New,");
                meetingDoc.setTemplate(BooleanUtils.isTrue(taskGroup.getTemplate()));
                meetingDoc.setTemplateName(taskGroup.getTemplateName());
                meetingDoc.setGlobal(BooleanUtils.isTrue(taskGroup.global))
                meetingDoc.setDeleteTs(taskGroup.getDeleteTs());
                meetingDoc.setDeletedBy(taskGroup.getDeletedBy());
                meetingDoc.setSubstitutedCreator(taskGroup.getSubCreator())
                meetingDoc.setCreator(em.createQuery("select u from sec\$User u where u.login=:userLogin order by u.deleteTs asc")
                        .setParameter("userLogin", taskGroup.getCreatedBy()).getFirstResult() as User)
                em.persist(meetingDoc)
                meetingDocEntityListener.onBeforeInsert(meetingDoc);

                List<Solution> solutions = new ArrayList<>();
                taskGroup.getTaskGroupTasks().each { tgt ->
                    if (tgt.task != null || StringUtils.isNotEmpty(tgt.fullDescr) || StringUtils.isNotEmpty(tgt.descr)
                            || tgt.getUser() != null || tgt.getFinishDate() != null || tgt.getController() != null
                            || tgt.getInitiator() != null || tgt.getObserver() != null
                            || tgt.project != null || tgt.taskType != null || tgt.priority != null) {
                        Solution solution = metadata.create(Solution.class);
                        solution.setTask(tgt.getTask());
                        solution.setFinishDatePlan(tgt.getFinishDate());
                        solution.setController(tgt.getController())
                        solution.setExecutor(tgt.getUser())
                        solution.setInitiator(tgt.getInitiator())
                        solution.setObserver(tgt.getObserver())
                        solution.setMeetingDoc(meetingDoc);
                        solution.setSolution(tgt.task == null ? tgt.descr : tgt.task.taskName);
                        solution.setComment(tgt.task == null ? tgt.fullDescr : tgt.task.fullDescr);
                        solution.setProject(tgt.task == null ? tgt.project : tgt.task.project)
                        solution.setTaskType(tgt.task == null ? tgt.taskType : tgt.task.taskType)
                        solution.setPriority(tgt.task == null ? tgt.priority : tgt.task.priority)
                        solutions.add(solution);
                        em.persist(solution)
                        if (tgt.task != null) {
                            tgt.getTask().setParentCard(meetingDoc)
                            em.merge(tgt.getTask());
                        }
                    }
                    em.remove(tgt);
                }
                meetingDoc.setSolutions(solutions);
                Set<MeetingParticipant> participants = new HashSet<>();
                taskGroup.getParticipants().each { user ->
                    MeetingParticipant participant = metadata.create(MeetingParticipant.class);
                    participant.setUser(user);
                    participant.setOuter(formatTools.formatOfficial(user, null));
                    participant.setEmail(user.getEmail());
                    participant.setMeetingDoc(meetingDoc);
                    participants.add(participant);
                    em.persist(participant)
                    participantEntityListener.onBeforeInsert(participant);
                }

                if (StringUtils.isNotEmpty(taskGroup.getTextParticipants())) {
                    MeetingParticipant participant = metadata.create(MeetingParticipant.class);
                    participant.setOuter(taskGroup.getTextParticipants());
                    participant.setMeetingDoc(meetingDoc);
                    participants.add(participant);
                    em.persist(participant)
                    participantEntityListener.onBeforeInsert(participant);
                }
                meetingDoc.setParticipants(participants);

                taskGroup.getAttachments().each { attachment ->
                    CardAttachment newAttachment = metadata.create(CardAttachment.class);
                    newAttachment.setFile(attachment.getFile());
                    newAttachment.setName(attachment.getName());
                    newAttachment.setAttachType(attachment.getAttachType());
                    meetingDoc.setHasAttachments(true);
                    newAttachment.setCard(meetingDoc);
                    //If substituted creator is null set it to admin-user to avoid invoking of
                    //com.haulmont.workflow.core.listeners.AttachmentEntityListener#onBeforeInsert()
                    if (attachment.getSubstitutedCreator() == null)
                        newAttachment.setSubstitutedCreator(em.find(User.class,
                                UUID.fromString("60885987-1B61-4247-94C7-DFF348347F93")))
                    else
                        newAttachment.setSubstitutedCreator(attachment.getSubstitutedCreator());
                    newAttachment.setComment(attachment.getComment());
                    em.persist(newAttachment);
                    em.remove(attachment);
                }
                em.remove(taskGroup);
            }
            tx.commit();
        }
    } finally {
        listenerManager.enable(true);
        tx.end();
    }
})