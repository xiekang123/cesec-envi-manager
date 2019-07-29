package cc.envi;

import cc.envi.common.service.RedisService;
import cc.envi.common.utils.DateUtil;
import cc.envi.quartz.common.ScheduleUtils;
import cc.envi.quartz.dao.TaskMapper;
import cc.envi.quartz.entity.TaskEntity;
import cc.envi.system.dao.RoleMapper;
import cc.envi.system.entity.RoleEntity;
import cc.envi.system.entity.UserEntity;
import cc.envi.system.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CesecEnviManagerApplicationTests {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private TaskMapper taskMapper;

    @Autowired
    private Scheduler scheduler;

	@Test
	public void contextLoads() {
        // 通过用户名到数据库查询用户信息
        QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(true,"user_name","xiekang");
        UserEntity user = this.userService.getOne(queryWrapper);
        System.out.println(user);
    }

    @Test
    public void testLink(){
        List<RoleEntity> roleList = roleMapper.findUserRole("admin");
        System.out.println(roleList);
    }

    @Test
    public void testRedis(){
        redisService.set("wwwww","12345678");
    }

    @Test
    public void testTask() throws Exception{

    }

}
