package cc.envi.quartz.mapper;

import cc.envi.quartz.entity.TaskLogEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * 任务日志持久层接口
 */
@Repository
public interface TaskLogMapper extends BaseMapper<TaskLogEntity>{
}
