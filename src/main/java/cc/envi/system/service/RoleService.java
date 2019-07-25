package cc.envi.system.service;

import cc.envi.system.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface RoleService extends IService<Role> {
    List<Role> findUserRole(String userName);
}
