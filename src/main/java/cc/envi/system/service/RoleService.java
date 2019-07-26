package cc.envi.system.service;

import cc.envi.system.entity.RoleEntity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface RoleService extends IService<RoleEntity> {
    List<RoleEntity> findUserRole(String userName);
}
