package cc.envi.common.listener;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.crazycake.shiro.RedisSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * 自定义会话监听器
 */
public class ShiroSessionListener implements SessionListener {

    private static final Logger logger = LoggerFactory.getLogger(ShiroSessionListener.class);
    /**
     * 统计在线人数
     */
    private final AtomicInteger sessionCount = new AtomicInteger(0);

    private RedisSessionDAO redisSessionDAO;
    public ShiroSessionListener(RedisSessionDAO redisSessionDAO) {
        this.redisSessionDAO = redisSessionDAO;
    }

    @Override
    public void onStart(Session session) {
        //会话创建，在线人数加一
        logger.info("会话创建，在线人数：" + sessionCount.incrementAndGet() + ", sessionID:" + session.getId());
    }

    @Override
    public void onStop(Session session) {
        logger.info("会话退出，在线人数：" + sessionCount.decrementAndGet() + ",sessionID" + session.getId());
        redisSessionDAO.delete(session);
    }

    @Override
    public void onExpiration(Session session) {
        logger.info("会话过期，在线人数： " + sessionCount.decrementAndGet() + ",sessionID " + session.getId());
        redisSessionDAO.delete(session);
    }
}
