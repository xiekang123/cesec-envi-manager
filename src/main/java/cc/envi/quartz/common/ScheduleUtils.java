package cc.envi.quartz.common;

import cc.envi.quartz.entity.TaskEntity;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 定时任务工具类
 *
 * @author MrBird
 */
public class ScheduleUtils {

    private static Logger log = LoggerFactory.getLogger(ScheduleUtils.class);

    protected ScheduleUtils() {

    }

    private static final String JOB_NAME = "TASK_";

    /**
     * 获取触发器key
     */
    private static TriggerKey getTriggerKey(Long jobId,String groupName) {
        return TriggerKey.triggerKey(JOB_NAME + jobId,groupName);
    }

    /**
     * 获取jobKey
     */
    private static JobKey getJobKey(Long jobId,String groupName) {
        return JobKey.jobKey(JOB_NAME + jobId,groupName);
    }

    /**
     * 获取表达式触发器
     */
    public static CronTrigger getCronTrigger(Scheduler scheduler, Long jobId,String groupName) {
        try {
            return (CronTrigger) scheduler.getTrigger(getTriggerKey(jobId,groupName));
        } catch (SchedulerException e) {
            log.error("获取Cron表达式失败", e);
        }
        return null;
    }

    /**
     * 创建定时任务
     */
    public static void createScheduleJob(Scheduler scheduler, TaskEntity scheduleJob) {
        try {
            // 构建job信息
            JobDetail jobDetail = JobBuilder.newJob(ScheduleJob.class)
                    .withIdentity(getJobKey(scheduleJob.getTaskId(),scheduleJob.getGroupName()))
                    .build();

            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            // 按新的cronExpression表达式构建一个新的trigger
            CronTrigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(getTriggerKey(scheduleJob.getTaskId(),scheduleJob.getGroupName()))
                    .withSchedule(scheduleBuilder).build();

            // 放入参数，运行时的方法可以获取
            jobDetail.getJobDataMap().put(TaskEntity.JOB_PARAM_KEY, scheduleJob);

            scheduler.scheduleJob(jobDetail, trigger);

            // 暂停任务
            if (scheduleJob.getStatus().equals(TaskEntity.ScheduleStatus.PAUSE.getValue())) {
                pauseJob(scheduler, scheduleJob.getTaskId(),scheduleJob.getGroupName());
            }
        } catch (SchedulerException e) {
            log.error("创建定时任务失败", e);
        }
    }

    /**
     * 更新定时任务
     */
    public static void updateScheduleJob(Scheduler scheduler, TaskEntity scheduleJob) {
        try {
            TriggerKey triggerKey = getTriggerKey(scheduleJob.getTaskId(),scheduleJob.getGroupName());

            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            CronTrigger trigger = getCronTrigger(scheduler, scheduleJob.getTaskId(),scheduleJob.getGroupName());

            if (trigger == null) {
                throw new SchedulerException("获取Cron表达式失败");
            } else {
                // 按新的cronExpression表达式重新构建trigger
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
                // 参数
                trigger.getJobDataMap().put(TaskEntity.JOB_PARAM_KEY, scheduleJob);
            }

            scheduler.rescheduleJob(triggerKey, trigger);

            // 暂停任务
            if (scheduleJob.getStatus().equals(TaskEntity.ScheduleStatus.PAUSE.getValue())) {
                pauseJob(scheduler, scheduleJob.getTaskId(),scheduleJob.getGroupName());
            }

        } catch (SchedulerException e) {
            log.error("更新定时任务失败", e);
        }
    }

    /**
     * 立即执行任务
     */
    public static void run(Scheduler scheduler, TaskEntity scheduleJob) {
        try {
            // 参数
            JobDataMap dataMap = new JobDataMap();
            dataMap.put(TaskEntity.JOB_PARAM_KEY, scheduleJob);

            scheduler.triggerJob(getJobKey(scheduleJob.getTaskId(),scheduleJob.getGroupName()), dataMap);
        } catch (SchedulerException e) {
            log.error("执行定时任务失败", e);
        }
    }

    /**
     * 暂停任务
     */
    public static void pauseJob(Scheduler scheduler, Long jobId,String groupName) {
        try {
            scheduler.pauseJob(getJobKey(jobId,groupName));
        } catch (SchedulerException e) {
            log.error("暂停定时任务失败", e);
        }
    }

    /**
     * 恢复任务
     */
    public static void resumeJob(Scheduler scheduler, Long jobId,String groupName) {
        try {
            scheduler.resumeJob(getJobKey(jobId,groupName));
        } catch (SchedulerException e) {
            log.error("恢复定时任务失败", e);
        }
    }

    /**
     * 删除定时任务
     */
    public static void deleteScheduleJob(Scheduler scheduler, Long jobId,String groupName) {
        try {
            scheduler.deleteJob(getJobKey(jobId,groupName));
        } catch (SchedulerException e) {
            log.error("删除定时任务失败", e);
        }
    }
}
