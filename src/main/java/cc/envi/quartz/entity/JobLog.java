package cc.envi.quartz.entity;


import cc.envi.common.converter.TimeConverter;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.Excel;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * @author MrBird
 */
@Data
@TableName("sys_job_log")
@Excel("调度日志信息表")
@ToString
public class JobLog implements Serializable {

    private static final long serialVersionUID = -7114915445674333148L;

    @TableId(value = "JOB_LOG_ID", type = IdType.AUTO)
    private Long logId;

    @TableField("job_id")
    private Long jobId;

    @TableField("bean_name")
    @ExcelField(value = "Bean名称")
    private String beanName;

    @TableField("method_name")
    @ExcelField(value = "方法名称")
    private String methodName;

    @TableField("params")
    @ExcelField(value = "方法参数")
    private String params;

    @TableField("status")
    @ExcelField(value = "状态", writeConverterExp = "0=成功,1=失败")
    private String status;

    @TableField("error")
    @ExcelField(value = "异常信息")
    private String error;

    @TableField("elapsed_time")
    @ExcelField(value = "耗时（毫秒）")
    private Long times;

    @TableField("create_time")
    @ExcelField(value = "执行时间", writeConverter = TimeConverter.class)
    private Date createTime;

    private transient String createTimeFrom;
    private transient String createTimeTo;

}
