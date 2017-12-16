package com.yjwh.crm.manage.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjwh.crm.manage.service.AccessService;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;
import com.yjwh.crm.po.AccessModoule;

/*
 * 用户资料管理
 */
@Controller
@RequestMapping("1/11")
public class UserController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AccessService accessService;

	@GetMapping("login")
	public String login(User user, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		User loginUser = null;
		try {
			loginUser = userMapper.selectOne(user);
		} catch (Exception e) {
			throw new RuntimeException("存在重复的用户，请检查系统");
		}

		// if (loginUser!=null) {
		if (true) {
			Cookie cookie = new Cookie("JSESSIONID", session.getId());
			cookie.setMaxAge(60 * 30);
			cookie.setPath("/");
			response.addCookie(cookie);

			List<AccessModoule> accessModoules = accessService.getUsersAllAccesses();
			session.setAttribute("accesses", accessModoules);

			return "index";
		} else {
			return "forward:/?msg=用户名、密码不匹配";
		}
	}

	@GetMapping("select")
	public String select(User user) {
		// List<User> select = userMapper.select(user);
		return "index";
	}
}
