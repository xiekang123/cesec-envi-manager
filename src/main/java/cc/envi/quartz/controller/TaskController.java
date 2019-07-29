package cc.envi.quartz.controller;

import cc.envi.common.controller.BaseController;
import cc.envi.common.domain.QueryRequest;
import cc.envi.common.domain.ResponseBo;
import cc.envi.quartz.entity.TaskEntity;
import cc.envi.quartz.service.TaskService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.checkerframework.checker.units.qual.A;
import org.quartz.CronExpression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class TaskController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;
    
    @RequestMapping("task")
    @RequiresPermissions("task:list")
    public String index() {
        return "job/job";
    }

    @RequestMapping("task/list")
    @RequiresPermissions("task:list")
    @ResponseBody
    public IPage<TaskEntity> taskEntityList(QueryRequest queryRequest) {
        Page<TaskEntity> page = new Page<>(queryRequest.getPageNum(),queryRequest.getPageSize());
        IPage<TaskEntity> taskEntityIPage = taskService.page(page);
        return taskEntityIPage;
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
        try {
            taskEntity.setCreateBy(getCurrentUser().getUserId());
            this.taskService.addTask(taskEntity);
            return ResponseBo.ok("新增任务成功！");
        } catch (Exception e) {
            logger.error("新增任务失败", e);
            return ResponseBo.error("新增任务失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("task:delete")
    @RequestMapping("task/delete")
    @ResponseBody
    public ResponseBo deleteTaskEntity(TaskEntity taskEntity) {
        try {

            this.taskService.deleteBatch(taskEntity);
            return ResponseBo.ok("删除任务成功！");
        } catch (Exception e) {
            logger.error("删除任务失败", e);
            return ResponseBo.error("删除任务失败，请联系网站管理员！");
        }
    }

    @RequestMapping("task/getTask")
    @ResponseBody
    public ResponseBo getTaskEntityById(Long taskEntityId) {
        try {
            TaskEntity TaskEntity = taskService.getById(taskEntityId);
            return ResponseBo.ok(TaskEntity);
        } catch (Exception e) {
            logger.error("获取任务信息失败", e);
            return ResponseBo.error("获取任务信息失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("task:update")
    @RequestMapping("task/update")
    @ResponseBody
    public ResponseBo updateTaskEntity(TaskEntity taskEntity) {
        try {
            taskEntity.setUpdateBy(getCurrentUser().getUserId());
            taskService.updateJob(taskEntity);
            return ResponseBo.ok("修改任务成功！");
        } catch (Exception e) {
            logger.error("修改任务失败", e);
            return ResponseBo.error("修改任务失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("task:run")
    @RequestMapping("task/run")
    @ResponseBody
    public ResponseBo runTaskEntity(String taskId) {
        try {
            taskService.run(taskId);
            return ResponseBo.ok("执行任务成功！");
        } catch (Exception e) {
            logger.error("执行任务失败", e);
            return ResponseBo.error("执行任务失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("task:pause")
    @RequestMapping("task/pause")
    @ResponseBody
    public ResponseBo pauseTaskEntity(String taskId) {
        try {
            taskService.pause(taskId);
            return ResponseBo.ok("暂停任务成功！");
        } catch (Exception e) {
            logger.error("暂停任务失败", e);
            return ResponseBo.error("暂停任务失败，请联系网站管理员！");
        }
    }

    @RequiresPermissions("task:resume")
    @RequestMapping("task/resume")
    @ResponseBody
    public ResponseBo resumeTaskEntity(String taskId) {
        try {
            taskService.resume(taskId);
            return ResponseBo.ok("恢复任务成功！");
        } catch (Exception e) {
            logger.error("恢复任务失败", e);
            return ResponseBo.error("恢复任务失败，请联系网站管理员！");
        }
    }

    /**
     * @param taskEntity 定时任务
     * @return ResponseBo
     */
    @RequestMapping("task/getSysCronClazz")
    @ResponseBody
    public ResponseBo getSysCronClazz(TaskEntity taskEntity) {
        List<TaskEntity> sysCronClazz = taskService.getSysCronClazz(taskEntity);
        return ResponseBo.ok(sysCronClazz);
    }
}
