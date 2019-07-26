package cc.envi.quartz.controller;

import cc.envi.common.domain.ResponseBo;
import cc.envi.quartz.entity.TaskEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.CronExpression;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class TaskEntityController {
    
    @RequestMapping("task")
    @RequiresPermissions("task:list")
    public String index() {
        return "task";
    }

    @RequestMapping("task/list")
    @RequiresPermissions("task:list")
    @ResponseBody
    public Map<String, Object> taskEntityList( TaskEntity taskEntity) {
        //return super.selectByPageNumSize(request, () -> this.TaskEntityService.findAllTaskEntitys(TaskEntity));
        return null;
    }

    @RequestMapping("task/checkCron")
    @ResponseBody
    public boolean checkCron(String cron) {
        try {
            return CronExpression.isValidExpression(cron);
        } catch (Exception e) {
            return false;
        }
    }

    @RequiresPermissions("task:add")
    @RequestMapping("task/add")
    @ResponseBody
    public ResponseBo addTaskEntity(TaskEntity taskEntity) {
        /*try {
            TaskEntity.setCreateBy(getCurrentUser().getUserId());
            this.TaskEntityService.addTaskEntity(TaskEntity);
            return ResponseBo.ok("新增任务成功！");
        } catch (Exception e) {
            log.error("新增任务失败", e);
            return ResponseBo.error("新增任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequiresPermissions("task:delete")
    @RequestMapping("task/delete")
    @ResponseBody
    public ResponseBo deleteTaskEntity(TaskEntity taskEntity) {
        /*try {

            this.TaskEntityService.deleteBatch(TaskEntity);
            return ResponseBo.ok("删除任务成功！");
        } catch (Exception e) {
            log.error("删除任务失败", e);
            return ResponseBo.error("删除任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequestMapping("task/getTaskEntity")
    @ResponseBody
    public ResponseBo getTaskEntity(Long taskEntityId) {
        /*try {
            TaskEntity TaskEntity = this.TaskEntityService.findTaskEntity(TaskEntityId);
            return ResponseBo.ok(TaskEntity);
        } catch (Exception e) {
            log.error("获取任务信息失败", e);
            return ResponseBo.error("获取任务信息失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequiresPermissions("task:update")
    @RequestMapping("task/update")
    @ResponseBody
    public ResponseBo updateTaskEntity(TaskEntity taskEntity) {
       /* try {
            TaskEntity.setUpdateBy(getCurrentUser().getUserId());
            this.TaskEntityService.updateTaskEntity(TaskEntity);
            return ResponseBo.ok("修改任务成功！");
        } catch (Exception e) {
            log.error("修改任务失败", e);
            return ResponseBo.error("修改任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequiresPermissions("task:run")
    @RequestMapping("task/run")
    @ResponseBody
    public ResponseBo runTaskEntity(String taskEntityIds) {
        /*try {
            this.TaskEntityService.run(TaskEntityIds);
            return ResponseBo.ok("执行任务成功！");
        } catch (Exception e) {
            log.error("执行任务失败", e);
            return ResponseBo.error("执行任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequiresPermissions("task:pause")
    @RequestMapping("task/pause")
    @ResponseBody
    public ResponseBo pauseTaskEntity(String taskEntityIds) {
        /*try {
            this.TaskEntityService.pause(TaskEntityIds);
            return ResponseBo.ok("暂停任务成功！");
        } catch (Exception e) {
            log.error("暂停任务失败", e);
            return ResponseBo.error("暂停任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    @RequiresPermissions("task:resume")
    @RequestMapping("task/resume")
    @ResponseBody
    public ResponseBo resumeTaskEntity(String taskEntityIds) {
        /*try {
            this.TaskEntityService.resume(TaskEntityIds);
            return ResponseBo.ok("恢复任务成功！");
        } catch (Exception e) {
            log.error("恢复任务失败", e);
            return ResponseBo.error("恢复任务失败，请联系网站管理员！");
        }*/
        return null;
    }

    /**
     * @param taskEntity 定时任务
     * @return ResponseBo
     */
    @RequestMapping("task/getSysCronClazz")
    @ResponseBody
    public ResponseBo getSysCronClazz(TaskEntity taskEntity) {
        /*List<TaskEntity> sysCronClazz = this.TaskEntityService.getSysCronClazz(TaskEntity);
        return ResponseBo.ok(sysCronClazz);*/
        return null;
    }
}
