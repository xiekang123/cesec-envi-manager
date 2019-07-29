package cc.envi.quartz.common;

import cc.envi.quartz.entity.TaskEntity;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * 定时任务
 *
 * @author xiekang
 */
public class ScheduleJob extends QuartzJobBean {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private ExecutorService service = Executors.newSingleThreadExecutor();

    @Override
    protected void executeInternal(JobExecutionContext context) {
        TaskEntity scheduleJob = (TaskEntity) context.getMergedJobDataMap().get(TaskEntity.JOB_PARAM_KEY);
        long startTime = System.currentTimeMillis();
        try {
            // 执行任务
            logger.info("任务准备执行，任务ID：{}", scheduleJob.getTaskId());
            ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(), scheduleJob.getMethodName(),
                    scheduleJob.getParams());
            Future<?> future = service.submit(task);
            future.get();
            long times = System.currentTimeMillis() - startTime;
            logger.info("任务执行完毕，任务ID：{} 总共耗时：{} 毫秒", scheduleJob.getTaskId(), times);
        } catch (Exception e) {
            logger.error("任务执行失败，任务ID：" + scheduleJob.getTaskId(), e);
            //long times = System.currentTimeMillis() - startTime;
        }
    }
}
