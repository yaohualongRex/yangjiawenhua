package com.yjwh.crm.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yjwh.crm.mapper.BillMapper;
import com.yjwh.crm.model.Bill;

import tk.mybatis.mapper.entity.Example;

@Controller
public class BeginController {
	@GetMapping("hello")
	public String hello() {
		return "hello";
	}
	@GetMapping("index")
	public String index() {
		return "index";
	}
	@GetMapping("/")
	public String login() {
		return "login";
	}
}
