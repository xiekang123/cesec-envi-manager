package cc.envi.quartz.entity;

import cc.envi.common.entity.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_task")
public class TaskEntity extends BaseEntity{

    /**
     * 任务调度参数key
     */
    public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

    /**
     * 任务id
     */
    @TableId(type = IdType.AUTO)
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
     * 任务分组
     */
    private String groupName;

    /**
     * 参数
     */
    private String params;

    /**
     * cron表达式
     */
    private String cronExpression;

    /**
     * 任务状态 0：正常 1：暂停
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标识（0：正常；1：删除）
     */
    @TableLogic(value = "0",delval = "1")
    private Integer delFlag;

    public enum ScheduleStatus {
        /**
         * 正常
         */
        NORMAL(0),
        /**
         * 暂停
         */
        PAUSE(1);

        private Integer value;

        private ScheduleStatus(Integer value) {
            this.value = value;
        }

        public Integer getValue() {
            return value;
        }
    }

}
