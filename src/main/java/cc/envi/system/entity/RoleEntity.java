package cc.envi.system.entity;

import cc.envi.common.entity.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 *  role
 * @author xiekang 2019-07-23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_role")
public class RoleEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 角色id
     */
    @TableId(type = IdType.AUTO)
    private Long roleId;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String remark;

    /**
     * 删除标识（0：正常；1：删除）
     */
    @TableLogic(value = "0",delval = "1")
    private Integer delFlag;

}
