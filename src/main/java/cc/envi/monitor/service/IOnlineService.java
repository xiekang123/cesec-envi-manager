package cc.envi.monitor.service;

import cc.envi.monitor.entity.ActiveUser;

import java.util.List;
/**
 * 在线用户接口
 * @author xiekang
 */
public interface IOnlineService {
    /**
     * 获取在线用户列表
     *
     * @param username 用户名
     * @return List<ActiveUser>
     */
    List<ActiveUser> list(String username);

    /**
     * 踢出用户
     *
     * @param sessionId sessionId
     */
    void forceLogout(String sessionId);
}
