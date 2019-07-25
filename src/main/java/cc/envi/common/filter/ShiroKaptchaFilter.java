package cc.envi.common.filter;

import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @Title: ShiroKaptchaFilter
 * @Author: xiekang
 * @Date: 2019-7-23 11:13:23
 * @Description: 验证码验证过滤器
 */
public class ShiroKaptchaFilter extends AccessControlFilter {

    // 页面提交的验证码参数
    private String LOGIN_KAPTCHA = "verifyCode";
    // 错误提示
    private String ERROR_KAPTCHA = "msg";
    // session中的验证码
    private String SHIRO_VERIFY_SESSION = "verify_session_Code";
    // 错误后的跳转地址
    private String ERROR_CODE_URL = "/login";


    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // 清除此提示，防止表单重复提示
        String uri = request.getRequestURI();
        String parameter = request.getParameter(ERROR_KAPTCHA);
        request.removeAttribute(ERROR_KAPTCHA);
        // 获取session中的验证码
        Subject subject = SecurityUtils.getSubject();
        String verCode = (String) subject.getSession().getAttribute(SHIRO_VERIFY_SESSION);
        // 获取提交的验证码
        String paramCode = request.getParameter(LOGIN_KAPTCHA);
        // 因为登录为表单提交登录，此处判断是否为表单提交
        if ("post".equalsIgnoreCase(request.getMethod())) {
            // 判断session中的验证码是否为空，为空则说明可能为第一次进入登录页面
            if (verCode != null) {
                // 判断提交的验证码是否为空
                if (StringUtils.isNotBlank(paramCode)) {
                    // 验证码不区分大小写
                    verCode = verCode.toLowerCase();
                    paramCode = paramCode.toLowerCase();
                    // 判断验证码是否一致
                    if (paramCode.equals(verCode)) {
                        return true;
                    }
                }
                return false;
            }
        }
        return true;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        // 重定向到登录页 ,并给出提示
        Map<String, String> map = Maps.newHashMap();
        map.put(ERROR_KAPTCHA, "验证码错误");
        WebUtils.issueRedirect(servletRequest, servletResponse, ERROR_CODE_URL, map);
        return false;
    }
}
