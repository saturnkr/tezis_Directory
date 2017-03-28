import com.haulmont.bali.datastruct.Pair
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.workflow.ThesisWorkflowMigrationAPI

postUpdate.add({
    ThesisWorkflowMigrationAPI workflowMigrationAPI = AppBeans.get(ThesisWorkflowMigrationAPI.NAME)

    List<Pair<String, String>> changing = workflowMigrationAPI.getNotificationMigratePairs3_6();
    workflowMigrationAPI.renameInAllDesignsNotificationMatrix(changing);
});