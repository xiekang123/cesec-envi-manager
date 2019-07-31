package cc.envi.system.mapper;

import cc.envi.system.entity.Dept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * @author MrBird
 */
@Repository
public interface DeptMapper extends BaseMapper<Dept> {
    /**
     * 递归删除部门
     *
     * @param deptId deptId
     */
    void deleteDepts(String deptId);
}
