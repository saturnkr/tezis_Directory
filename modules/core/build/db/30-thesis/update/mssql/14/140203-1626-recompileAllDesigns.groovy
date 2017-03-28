/**
 *
 * @author tsarevskiy
 * @version $Id: 140203-1626-recompileAllDesigns.groovy 16389 2014-06-20 12:33:14Z tsarevskiy $
 */
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.thesis.core.app.workflow.ThesisWorkflowMigrationAPI

postUpdate.add({
    ThesisWorkflowMigrationAPI workflowMigrationAPI = AppBeans.get(ThesisWorkflowMigrationAPI.NAME)

    workflowMigrationAPI.recompileAllDesigns();
});