import com.haulmont.bali.datastruct.Pair
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.workflow.ThesisWorkflowMigrationAPI

postUpdate.add({
    ThesisWorkflowMigrationAPI workflowMigrationAPI = AppBeans.get(ThesisWorkflowMigrationAPI.NAME)
    List<Pair<String, String>> changing = new ArrayList<>();
    changing.add(new Pair<>("com.haulmont.taskman.core.activity.StartActivity",
            "com.haulmont.thesis.core.activity.task.StartActivity"));
    changing.add(new Pair<>("com.haulmont.taskman.core.activity.EndActivity",
            "com.haulmont.thesis.core.activity.task.EndActivity"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.SigningAssigner",
            "com.haulmont.thesis.core.activity.doc.SigningAssigner"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.VersionCreator",
            "com.haulmont.thesis.core.activity.doc.VersionCreator"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.SigningUniversalAssigner",
            "com.haulmont.thesis.core.activity.doc.SigningUniversalAssigner"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.ScriptExecution",
            "com.haulmont.thesis.core.activity.doc.ScriptExecution"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.SigningSequentialAssigner",
            "com.haulmont.thesis.core.activity.doc.SigningSequentialAssigner"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.SignalProcessActivity",
            "com.haulmont.thesis.core.activity.doc.SignalProcessActivity"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.StartProcessActivity",
            "com.haulmont.thesis.core.activity.doc.StartProcessActivity"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.StoreCardActivity",
            "com.haulmont.thesis.core.activity.doc.StoreCardActivity"));

    changing.add(new Pair<>("com.haulmont.docflow.core.activity.UploadFilesActivity",
            "com.haulmont.thesis.core.activity.doc.UploadFilesActivity"));
    workflowMigrationAPI.renameActivityName(changing)
})