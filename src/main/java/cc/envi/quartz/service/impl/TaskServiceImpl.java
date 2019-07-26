package cc.envi.quartz.service.impl;

import cc.envi.quartz.dao.TaskMapper;
import cc.envi.quartz.entity.TaskEntity;
import cc.envi.quartz.service.TaskService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class TaskServiceImpl extends ServiceImpl<TaskMapper,TaskEntity> implements TaskService{

}
