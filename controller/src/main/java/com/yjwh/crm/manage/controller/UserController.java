package com.yjwh.crm.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;

@Controller
public class UserController {
	@Autowired
	private UserMapper userMapper;
	
	@GetMapping("login")
	@ResponseBody
	public String login(User user) {
		List<User> select = userMapper.select(user);
		return "index";
	}
}
