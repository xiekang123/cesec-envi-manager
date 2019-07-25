package cc.envi.system.service;

import cc.envi.system.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface MenuService extends IService<Menu>{
    List<Menu> findUserPermissions(String userName);
}
