import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.DocflowDeployerMBean
import com.haulmont.thesis.core.entity.MeetingDoc
import com.haulmont.thesis.core.entity.MeetingQuestion

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author timokhov
 * @version $Id: 151015-1657-updateMeetingDocMeetingComment.groovy 22296 2015-10-23 09:47:32Z timokhov $
 */
postUpdate.add({
    AppBeans.get(DocflowDeployerMBean.class).initLogging()
    Transaction tx = AppBeans.get(Persistence.class).createTransaction();
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager();
    List<MeetingDoc> meetingDocs;
    try {
        em.setSoftDeletion(false);
        meetingDocs = em.createQuery("select md from df\$MeetingDoc md").getResultList();
        meetingDocs.each { MeetingDoc meetingDoc ->
            meetingDoc.setMeetingComment(meetingDoc.getComment());
            StringBuffer questions = new StringBuffer();
            if (meetingDoc.getMeetingQuestions() != null && !meetingDoc.getMeetingQuestions().isEmpty()){
                for(MeetingQuestion question : meetingDoc.getMeetingQuestions()){
                    questions.append(question.getNumber() + ". ").append(question.getQuestion()).append("\n");
                }
                if(questions.length() > 2) {
                    questions.delete(questions.length() - 1, questions.length());
                }
            }
            meetingDoc.setComment(questions.toString());
        }
        tx.commit();
    } finally {
        tx.end();
    }
})
