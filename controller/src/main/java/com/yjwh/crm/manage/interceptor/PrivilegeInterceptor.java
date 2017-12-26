package com.yjwh.crm.manage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yjwh.crm.manage.service.PrivilegeService;
import com.yjwh.crm.model.Privilege;
import com.yjwh.crm.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Component
public class PrivilegeInterceptor implements HandlerInterceptor {
	@Autowired
	private PrivilegeService privilegeService;
	@Autowired
	private ApplicationContext application;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// 解析url中当前使用的是哪部分权限，并根据当前权限尝试获取按钮
		this.parseCurrentPrivilege(request);
		this.parseUrl(request);

		// 添加无需验证的url、静态资源
		String path = request.getRequestURI().toString();
		if (path.equals("/login") || path.equals("/") || path.equals("/error")
				|| path.endsWith(".jpg") )
			return true;

		// 登录校验:session中没有保存该用户权限，重定向到登录界面
		HttpSession session = request.getSession();
		if (session.getAttribute("currentUser")==null) {//没有保存当前用户就是没有登陆
			response.sendRedirect("/");
			return false;
		}
		if (session.getAttribute("privileges")==null) // 有用户没权限，再查一遍权限
			session.setAttribute("privileges", privilegeService.getUsersAllPrivileges((User) session.getAttribute("currentUser")));

		return true;
	}

	private void parseUrl(HttpServletRequest request) {
		request.setAttribute("hostIp",request.getRequestURL().toString().split(request.getRequestURI())[0]);
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

	private void parseCurrentPrivilege(HttpServletRequest request) {
		String[] strs = request.getRequestURI().toString().substring(1).split("/");
		Long pid = null;
		if (strs.length >= 2){
			pid = Long.valueOf(strs[0]);
			request.setAttribute("currentFather", pid);
		}

		if (strs.length >= 3){
			pid = Long.valueOf(strs[1]);
			request.setAttribute("currentSon", pid);
		}
		pid = 11l;
		if (pid != null){// 尝试获取按钮
			List<Privilege> buttons = privilegeService.selectButtonsByPid(pid);
			if (!CollectionUtils.isEmpty(buttons))
				request.setAttribute("buttons",buttons);
		}
	}
}
