/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */



import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata
import com.haulmont.thesis.core.entity.MeetingDoc
import com.haulmont.thesis.core.entity.MeetingParticipant
import com.haulmont.thesis.core.entity.MeetingQuestion
import com.haulmont.thesis.core.entity.Solution
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

/**
 * Created by timokhov on 24.08.2015.
 */
postUpdate.add({
    ThesisFtsManagerAPI ftsManager = AppBeans.get(ThesisFtsManagerAPI.NAME);
    Metadata metadata = AppBeans.get(Metadata.NAME);
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(MeetingDoc.class).getName());
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(Solution.class).getName());
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(MeetingParticipant.class).getName());
    ftsManager.reindexEntity(metadata.getExtendedEntities().getEffectiveMetaClass(MeetingQuestion.class).getName());
    ftsManager.processQueue()
})
