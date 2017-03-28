import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.fts.ThesisFtsManagerAPI

ThesisFtsManagerAPI ftsManagerAPI = AppBeans.get(ThesisFtsManagerAPI.NAME);
ftsManagerAPI.updateEntities("core\$FileDescriptor", "sys\$FileDescriptor");
ftsManagerAPI.updateEntities("ts\$CardAttachment", "wf\$CardAttachment");
ftsManagerAPI.updateEntities("df\$ContractorAttachment", "df\$CorrespondentAttachment");