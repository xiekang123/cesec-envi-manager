package cc.envi.common.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1088596452642571601L;
    /**
     * 创建人
     */
    protected Long createBy;

    /**
     * 创建时间
     */
    protected Date createTime;

    /**
     * 修改人
     */
    protected Long updateBy;

    /**
     * 修改时间
     */
    protected Date updateTime;
}
