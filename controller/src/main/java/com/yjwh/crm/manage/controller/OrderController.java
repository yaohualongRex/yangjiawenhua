package com.yjwh.crm.manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 订单管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("4")
public class OrderController {
	
	@RequestMapping("42/selectOrderPartJsp")
    public String userAddJsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
        return "orderPartList";
    }
	
	@RequestMapping("42/selectOrderOwnJsp")
	public String selectCustomerjsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		return "orderOwnList";
	}
}
