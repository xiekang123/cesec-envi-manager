package cc.envi.system.entity;

import cc.envi.common.entity.BaseEntity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *  用户表
 * @author xiekang 2019-07-23
 */
@Data
@TableName("sys_user")
@AllArgsConstructor
@NoArgsConstructor
public class User extends BaseEntity {
    private static final long serialVersionUID = 1L;
    public static final String STATUS_LOCK = "0";

    /**
     * 编号
     */
    @TableId(type = IdType.AUTO)
    private Integer userId;

    /**
     * 真实名称
     */
    private String userName;

    /**
     * 用户类型 0:系统用户，1:临时用户
     */
    private Integer userType;

    /**
     * 部门编号
     */
    private Integer deptId;

    /**
     * 登录密码
     */
    private String userPwd;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 联系方式
     */
    private String phone;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 排序号
     */
    private Integer orderNum;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 删除标志
     */
    @TableLogic(value = "0",delval = "1")
    private Integer delFlg;

}
