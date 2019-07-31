package cc.envi.quartz.entity;

import cc.envi.common.annotation.IsCron;
import cc.envi.common.converter.TimeConverter;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * @author MrBird
 */
@Data
@TableName("sys_job")
@Excel("定时任务信息表")
@ToString
public class Job implements Serializable {

    private static final long serialVersionUID = 400066840871805700L;

    /**
     * 任务调度参数 key
     */
    public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

    @TableId(value = "JOB_ID", type = IdType.AUTO)
    private Long jobId;

    @TableField("bean_name")
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    @ExcelField(value = "Bean名称")
    private String beanName;

    @TableField("method_name")
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    @ExcelField(value = "方法名称")
    private String methodName;

    @TableField("group_name")
    @NotBlank(message = "{required}")
    @Size(max = 100, message = "{noMoreThan}")
    private String groupName;

    @TableField("params")
    @Size(max = 50, message = "{noMoreThan}")
    @ExcelField(value = "方法参数")
    private String params;

    @TableField("cron_expression")
    @NotBlank(message = "{required}")
    @IsCron(message = "{invalid}")
    @ExcelField(value = "Cron表达式")
    private String cronExpression;

    @TableField("status")
    @ExcelField(value = "状态", writeConverterExp = "0=正常,1=暂停")
    private String status;

    @TableField("remark")
    @Size(max = 100, message = "{noMoreThan}")
    @ExcelField(value = "备注")
    private String remark;

    @TableField("create_time")
    @ExcelField(value = "创建时间", writeConverter = TimeConverter.class)
    private Date createTime;

    @TableField("update_time")
    private Date updateTime;

    @TableField("create_by")
    private Long createBy;

    @TableField("update_by")
    private Long updateBy;

    @TableField("del_flag")
    private int delFlag;

    private transient String createTimeFrom;
    private transient String createTimeTo;

}
