package cc.envi.quartz.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 后台任务日志记录
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
@TableName("sys_task_log")
public class TaskLogEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 任务日志id
     */
    @TableId(type = IdType.AUTO)
    private Long taskLogId;

    /**
     * 任务id
     */
    private Long taskId;

    /**
     * spring bean名称
     */
    private String beanName;

    /**
     * 方法名
     */
    private String methodName;

    /**
     * 参数
     */
    private String params;

    /**
     * 任务状态  0：成功  1：失败
     */
    private String status;

    /**
     * 失败信息
     */
    private String error;

    /**
     * 耗时(单位：毫秒)
     */
    private Long elapsedTime;

    /**
     * 创建时间
     */
    private Date createTime;
}
