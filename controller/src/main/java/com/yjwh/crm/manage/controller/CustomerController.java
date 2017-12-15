package com.yjwh.crm.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 客户信息
 * @author Administrator
 *
 */
@Controller
@RequestMapping("2")
public class CustomerController {
	@RequestMapping("21/select")
	public String selectCustomer() {
		return null;
	}
	@RequestMapping("22/add")
	public String addCustomer() {
		return null;
	}
}
