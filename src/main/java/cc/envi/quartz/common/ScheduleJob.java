package cc.envi.quartz.common;

import cc.envi.common.constant.SystemConstant;
import cc.envi.common.utils.DateUtil;
import cc.envi.common.utils.SpringContextUtil;
import cc.envi.quartz.entity.TaskEntity;
import cc.envi.quartz.entity.TaskLogEntity;
import cc.envi.quartz.service.TaskLogService;
import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.thymeleaf.spring5.context.SpringContextUtils;

import java.util.Date;
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
        // 获取spring bean
        TaskLogService scheduleJobLogService = (TaskLogService) SpringContextUtil.getBean("taskLogService");
        //保存任务日志
        TaskLogEntity log = new TaskLogEntity();
        log.setTaskId(scheduleJob.getTaskId());
        log.setBeanName(scheduleJob.getBeanName());
        log.setMethodName(scheduleJob.getMethodName());
        log.setParams(scheduleJob.getParams());
        log.setCreateTime(DateUtil.now());
        try {
            // 执行任务
            logger.info("任务准备执行，任务ID：{}", scheduleJob.getTaskId());
            ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(), scheduleJob.getMethodName(),
                    scheduleJob.getParams());
            Future<?> future = service.submit(task);
            future.get();
            long times = System.currentTimeMillis() - startTime;
            log.setElapsedTime(times);
            // 任务状态 0：成功 1：失败
            log.setStatus(SystemConstant.SystemStatus.SUCCESS.getValue());
            logger.info("任务执行完毕，任务ID：{} 总共耗时：{} 毫秒", scheduleJob.getTaskId(), times);
        } catch (Exception e) {
            logger.error("任务执行失败，任务ID：" + scheduleJob.getTaskId(), e);
            long times = System.currentTimeMillis() - startTime;
            log.setElapsedTime(times);
            log.setStatus(SystemConstant.SystemStatus.ERROR.getValue());
            log.setError(StringUtils.substring(e.toString(), 0, 2000));
        }finally {
            scheduleJobLogService.save(log);
        }
    }
}
