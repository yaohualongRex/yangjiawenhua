package com.yjwh.crm.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class BeginController {
	@RequestMapping("hello")
	public String hello() {
		return "hello";
	}
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("/")
	public String login(Model model, String msg) {
		if ("1".equalsIgnoreCase(msg))
			model.addAttribute("msg","用户名、密码不匹配");
		return "login";
	}
}
