package com.yjwh.crm.manage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yjwh.crm.manage.service.AccessService;
import com.yjwh.crm.model.Privilege;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Component
public class AccessInterceptor implements HandlerInterceptor {
	@Autowired
	private AccessService accessService;
	@Autowired
	private ApplicationContext application;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// 解析url中当前使用的是哪部分权限，并根据当前权限尝试获取按钮
		this.parseCurrentAccess(request);

		// 取消拦截
//		if (true)
//			return true;

		// 添加无需验证的url、静态资源
		String path = request.getRequestURI().toString();
		if (path.contains("/login") || path.equals("/") || path.endsWith(".jpg"))
			return true;

		// 登录校验
		// session中没有保存该用户权限，重定向到登录界面
		HttpSession session = request.getSession();
		if (session.getAttribute(session.getId())==null) {
			response.sendRedirect("/");
			return false;
		}
			
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
			WebApplicationContext  webApplicationContext
					= (WebApplicationContext) request.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			accessService = (AccessService) webApplicationContext .getBean("accessService");
			List<Privilege> buttons = accessService.selectButtonsByPid(pid);
			if (!CollectionUtils.isEmpty(buttons))
				request.setAttribute("buttons",buttons);
		}
	}
}
