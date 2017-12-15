package com.yjwh.crm.manage.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yangjiawenhua.utils.CommonUtils;

@Component
public class AccessInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// 解析url中当前使用的是哪部分权限
		this.parseCurrentAccess(request);

		// 取消拦截
//		if (true)
//			return true;

		// 添加无需验证的url
		String path = request.getRequestURI().toString();
		if (path.startsWith("/login") || path.startsWith("/index") || path.equals("/"))
			return true;

		// 登录校验
		// session不存在，或者session中没有保存该用户权限，重定向到登录界面
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute(session.getId())==null) {
			response.sendRedirect("/");
			return false;
		}
			
		// 获取cookie中保存的账号密码，尝试登录

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj,
			Exception exception) throws Exception {
		// TODO Auto-generated method stub
		if (exception != null) {

		}

	}

	private void parseCurrentAccess(HttpServletRequest request) {
		String[] strs = request.getRequestURI().toString().substring(1).split("/");
		if (strs.length >= 2)
			request.setAttribute("currentFather", Long.valueOf(strs[0]));
		if (strs.length >= 3)
			request.setAttribute("currentSon", Long.valueOf(strs[1]));
	}
}
