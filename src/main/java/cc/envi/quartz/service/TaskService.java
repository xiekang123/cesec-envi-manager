package cc.envi.quartz.service;

import cc.envi.quartz.entity.TaskEntity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface TaskService extends IService<TaskEntity> {
    /**
     * 新增任务
     * @param taskEntity
     */
    void addTask(TaskEntity taskEntity);

    /**
     * 删除任务
      * @param taskEntity
     */
    void deleteBatch(TaskEntity taskEntity);

    /**
     * 修改任务
     * @param taskEntity
     */
    void updateJob(TaskEntity taskEntity);

    /**
     *  立即执行
     * @param taskId
     */
    void run(String taskId);

    /**
     * 暂停任务
     * @param jobId
     */
    void pause(String jobId);

    /**
     * 恢复任务
     * @param jobId
     */
    void resume(String jobId);

    /**
     * 定时任务
     * @param taskEntity
     * @return
     */
    List<TaskEntity> getSysCronClazz(TaskEntity taskEntity);
}
