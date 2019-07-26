package cc.envi.common.shiro;

import cc.envi.system.entity.MenuEntity;
import cc.envi.system.entity.RoleEntity;
import cc.envi.system.entity.UserEntity;
import cc.envi.system.service.MenuService;
import cc.envi.system.service.RoleService;
import cc.envi.system.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        UserEntity user = (UserEntity) SecurityUtils.getSubject().getPrincipal();
        String userName = user.getUserName();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        // 获取用户角色集
        List<RoleEntity> roleList = roleService.findUserRole(userName);
        Set<String> roleSet = roleList.stream().map(RoleEntity::getRoleName).collect(Collectors.toSet());
        simpleAuthorizationInfo.setRoles(roleSet);
        // 获取用户权限集
        List<MenuEntity> permissionList = this.menuService.findUserPermissions(userName);
        Set<String> permissionSet = permissionList.stream().map(MenuEntity::getPerms).collect(Collectors.toSet());
        simpleAuthorizationInfo.setStringPermissions(permissionSet);
        return simpleAuthorizationInfo;
    }

    /**
     * 用户认证
     *
     * @param  authenticationToken AuthenticationToken 身份认证 token
     * @return AuthenticationInfo 身份认证信息
     * @throws AuthenticationException 认证相关异常
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 获取用户输入的用户名和密码
        String userName = (String) authenticationToken.getPrincipal();
        String password = new String((char[]) authenticationToken.getCredentials());
        // 通过用户名到数据库查询用户信息
        QueryWrapper<UserEntity>  queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(true,"user_name",userName);
        UserEntity user = this.userService.getOne(queryWrapper);
        if (user == null)
            throw new UnknownAccountException("用户名或密码错误！");
        if (!password.equals(user.getUserPwd()))
            throw new IncorrectCredentialsException("用户名或密码错误！");
        if (UserEntity.STATUS_LOCK.equals(user.getStatus()))
            throw new LockedAccountException("账号已被锁定,请联系管理员！");
        return new SimpleAuthenticationInfo(user, password, getName());
    }
}
