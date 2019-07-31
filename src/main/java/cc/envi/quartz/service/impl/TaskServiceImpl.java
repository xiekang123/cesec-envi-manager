package cc.envi.quartz.service.impl;

import cc.envi.common.annotation.CronTag;
import cc.envi.common.utils.DateUtil;
import cc.envi.quartz.common.ScheduleUtils;
import cc.envi.quartz.mapper.TaskMapper;
import cc.envi.quartz.entity.TaskEntity;
import cc.envi.quartz.service.TaskService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.reflections.Reflections;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class TaskServiceImpl extends ServiceImpl<TaskMapper,TaskEntity> implements TaskService{

    private static final Logger logger = LoggerFactory.getLogger(TaskServiceImpl.class);

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private TaskMapper taskMapper;

    /**
     * 项目启动时，初始化定时器
     */
    @PostConstruct
    public void init(){
        List<TaskEntity> scheduleJobList = this.taskMapper.selectList(null);
        logger.info("========初始化任务列表{init}======="+scheduleJobList);
        // 如果不存在，则创建
        scheduleJobList.forEach(scheduleJob -> {
            CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getTaskId(),scheduleJob.getGroupName());
            if (cronTrigger == null) {
                ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
            } else {
                ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
            }
        });
    }

    @Override
    @Transactional
    public void addTask(TaskEntity taskEntity) {
        taskEntity.setCreateTime(DateUtil.now());
        taskEntity.setStatus(TaskEntity.ScheduleStatus.PAUSE.getValue());
        this.save(taskEntity);
        ScheduleUtils.createScheduleJob(scheduler, taskEntity);
    }

    @Override
    @Transactional
    public void deleteBatch(TaskEntity taskEntity) {
        this.removeById(taskEntity.getTaskId());
        ScheduleUtils.deleteScheduleJob(scheduler,taskEntity.getTaskId(),taskEntity.getGroupName());
    }

    @Override
    @Transactional
    public void updateJob(TaskEntity taskEntity) {
        taskEntity.setUpdateTime(DateUtil.now());
        ScheduleUtils.updateScheduleJob(scheduler, taskEntity);
    }

    @Override
    public void run(String taskId) {
        ScheduleUtils.run(scheduler,this.getById(Long.valueOf(taskId)));
    }

    @Override
    public void pause(String jobId) {
        TaskEntity taskEntity = taskMapper.selectById(jobId);
        ScheduleUtils.pauseJob(scheduler, Long.valueOf(jobId),taskEntity.getGroupName());
        taskEntity.setStatus(TaskEntity.ScheduleStatus.PAUSE.getValue());
        taskMapper.updateById(taskEntity);
    }

    @Override
    public void resume(String jobId) {
        TaskEntity taskEntity = taskMapper.selectById(jobId);
        ScheduleUtils.resumeJob(scheduler, Long.valueOf(jobId),taskEntity.getGroupName());
        taskEntity.setStatus(TaskEntity.ScheduleStatus.NORMAL.getValue());
        taskMapper.updateById(taskEntity);
    }

    @Override
    public List<TaskEntity> getSysCronClazz(TaskEntity taskEntity) {
        Reflections reflections = new Reflections("cc.envi.quartz.task");
        List<TaskEntity> jobList = new ArrayList<>();
        Set<Class<?>> annotated = reflections.getTypesAnnotatedWith(CronTag.class);
        for (Class cls : annotated) {
            String clsSimpleName = cls.getSimpleName();
            Method[] methods = cls.getDeclaredMethods();
            for (Method method : methods) {
                TaskEntity job1 = new TaskEntity();
                String methodName = method.getName();
                Parameter[] methodParameters = method.getParameters();
                String params = String.format("%s(%s)", methodName, Arrays.stream(methodParameters).map(item -> item.getType().getSimpleName() + " " + item.getName()).collect(Collectors.joining(", ")));

                job1.setBeanName(StringUtils.uncapitalize(clsSimpleName));
                job1.setMethodName(methodName);
                job1.setParams(params);
                jobList.add(job1);
            }
        }
        return jobList;
    }
}
