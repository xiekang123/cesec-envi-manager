package cc.envi.monitor.controller;

import cc.envi.common.entity.FebsResponse;
import cc.envi.monitor.entity.ActiveUser;
import cc.envi.monitor.service.IOnlineService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("session")
public class OnlineController {
    @Autowired
    private IOnlineService onlineService;

    @GetMapping("list")
    @RequiresPermissions("online:view")
    public FebsResponse list(String username) {
        List<ActiveUser> list = onlineService.list(username);
        Map<String, Object> data = new HashMap<>();
        data.put("rows", list);
        data.put("total", CollectionUtils.size(list));
        return new FebsResponse().success().data(data);
    }

    @GetMapping("delete/{id}")
    @RequiresPermissions("user:kickout")
    public FebsResponse forceLogout(@PathVariable String id) {
        onlineService.forceLogout(id);
        return new FebsResponse().success();
    }
}
