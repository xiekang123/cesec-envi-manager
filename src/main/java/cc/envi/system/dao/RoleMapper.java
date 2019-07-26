package cc.envi.system.dao;

import cc.envi.system.entity.RoleEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper extends BaseMapper<RoleEntity> {

    List<RoleEntity> findUserRole(String userName);
}
