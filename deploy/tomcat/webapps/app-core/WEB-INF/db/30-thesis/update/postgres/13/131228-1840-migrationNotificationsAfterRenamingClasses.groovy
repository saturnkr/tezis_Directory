import com.haulmont.bali.datastruct.Pair
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.workflow.ThesisWorkflowMigrationAPI

postUpdate.add({
    ThesisWorkflowMigrationAPI workflowMigrationAPI = AppBeans.get(ThesisWorkflowMigrationAPI.NAME)

    List<Pair<String, String>> changing = new ArrayList<>();
    changing.add(new Pair<>("com.haulmont.docflow.core.entity.Doc",
            "com.haulmont.thesis.core.entity.Doc"));

    changing.add(new Pair<>("com.haulmont.taskman.core.entity.Task",
            "com.haulmont.thesis.core.entity.Task"));

    changing.add(new Pair<>("com.haulmont.docflow.core.entity.Contract",
            "com.haulmont.thesis.core.entity.Contract"));

    changing.add(new Pair<>("com.haulmont.taskman.core.notification.NotificationUtils",
            "com.haulmont.thesis.core.notification.NotificationUtils"));

    changing.add(new Pair<>("com.haulmont.docflow.core.entity.Employee",
            "com.haulmont.thesis.core.entity.Employee"));


    changing.add(new Pair<>("SecurityProvider.currentUserSession()",
            "com.haulmont.cuba.core.global.AppBeans.get(com.haulmont.cuba.core.global.UserSessionSource.class).getUserSession()"));

    changing.add(new Pair<>("import com.haulmont.cuba.core.SecurityProvider", ""));

    changing.add(new Pair<>("ShortUrlWorker ", "com.haulmont.thesis.core.app.UrlWorker "));
    changing.add(new Pair<>("(ShortUrlWorker", "(com.haulmont.thesis.core.app.UrlWorker"));

    changing.add(new Pair<>("Locator.lookup", "com.haulmont.cuba.core.global.AppBeans.get"));

    workflowMigrationAPI.renameInProcessNotifications(changing);
})
