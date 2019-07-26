package cc.envi.system.service;

import cc.envi.system.entity.MenuEntity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface MenuService extends IService<MenuEntity>{
    List<MenuEntity> findUserPermissions(String userName);
}
