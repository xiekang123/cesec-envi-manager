package cc.envi.quartz.service.impl;

import cc.envi.quartz.mapper.TaskLogMapper;
import cc.envi.quartz.entity.TaskLogEntity;
import cc.envi.quartz.service.TaskLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("taskLogService")
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true,rollbackFor = Exception.class)
public class TaskLogServiceImpl extends ServiceImpl<TaskLogMapper,TaskLogEntity> implements TaskLogService{
}
