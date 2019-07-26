package cc.envi.system.dao;

import cc.envi.system.entity.MenuEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper extends BaseMapper<MenuEntity> {
    List<MenuEntity> findUserPermissions(String userName);
}
