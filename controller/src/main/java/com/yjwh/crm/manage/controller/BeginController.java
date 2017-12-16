package com.yjwh.crm.manage.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
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
	public String login() {
		return "login";
	}
}
