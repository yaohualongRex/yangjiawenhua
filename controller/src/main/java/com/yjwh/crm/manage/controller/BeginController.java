package com.yjwh.crm.manage.controller;

import com.yangjiawenhua.utils.CommonUtils;
import com.yjwh.crm.manage.service.PrivilegeService;
import com.yjwh.crm.mapper.RoleMapper;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;
import com.yjwh.crm.po.PrivilegeModoule;
import com.yjwh.crm.po.UserDate;
import com.yjwh.crm.po.UserModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.util.StringUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class BeginController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PrivilegeService privilegeService;
	@Autowired
	private RoleMapper roleMapper;

	@RequestMapping("/")
	public String login(Model model, String msg) {
		return "login";
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session, HttpServletRequest request , HttpServletResponse response) {
		Cookie cookie = CommonUtils.getCookieByName("JSESSIONID",request);
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		session.setMaxInactiveInterval(1);
		return "redirect:/";
	}

	@PostMapping("/login")
	@ResponseBody
	public String login(@RequestBody User user, HttpSession session, HttpServletResponse response) {
		if (StringUtil.isEmpty(user.getPassword()) || StringUtil.isEmpty(user.getUsername()))
			throw new RuntimeException("用户名和密码不匹配");

		User loginUser = userMapper.selectOne(user);
		if (loginUser != null) {
			Cookie cookie = new Cookie("JSESSIONID", session.getId());
			cookie.setMaxAge(60_000 * 60 * 2);
			cookie.setPath("/");
			response.addCookie(cookie);

			// 根据用户获取该用户的权限
			List<PrivilegeModoule> privilegeModoules = privilegeService.getUsersAllPrivileges(loginUser);
			session.setAttribute("privileges", privilegeModoules);
			UserModule userModule = privilegeService.getUserModule(loginUser);
			session.setAttribute("currentUser", userModule);
			return "";
		} else {
			throw new RuntimeException("用户名和密码不匹配");
		}
	}

	@RequestMapping("/userData")
	public String intoUserData(Model model,HttpSession session, HttpServletRequest request ,HttpServletResponse response) {
		return "userData";
	}
	@RequestMapping("/updateUserData")
	@ResponseBody
	public String updateUserData(@RequestBody UserDate user, Model model, HttpSession session, HttpServletRequest request , HttpServletResponse response) {
		if (StringUtil.isEmpty(user.getPassword()) || StringUtil.isEmpty(user.getUsername()))
			throw new RuntimeException("用户名和密码不匹配");
		User user1 = new User();
		user1.setUsername(((User)session.getAttribute("currentUser")).getUsername());
		user1.setPassword(user.getPassword());
		user1 = userMapper.selectOne(user1);
		if (user1 == null)
			throw new RuntimeException("旧密码与账号不匹配");

		user1.setChinaName(user.getChinaName());
		user1.setSex(user.getSex());
		user1.setPassword(user.getPassword1());
		userMapper.updateByPrimaryKeySelective(user1);
		return "修改密码成功，请重新登录";
	}
}

