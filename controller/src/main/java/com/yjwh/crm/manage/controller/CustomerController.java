package com.yjwh.crm.manage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjwh.crm.mapper.CustomMapper;
import com.yjwh.crm.model.Custom;
import com.yjwh.crm.po.CustomModle;

/**
 * 客户信息
 * @author Administrator
 *
 */
@Controller
@RequestMapping("2")
public class CustomerController {
	
	 @Autowired
	 private CustomMapper customerMapper;
	 
	@RequestMapping("22/selectCustomJsp")
	public String selectCustomer(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		List<Custom> customList = customerMapper.selectAll();
		model.addAttribute("customList", customList);
		return "customList";
	}
	
	@RequestMapping("22/addCustomJsp")
    public String userAddJsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
        return "customAdd";
    }
	@RequestMapping("22/addCustom")
	public String addCustomer(CustomModle custom,HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		int insert = customerMapper.insert(custom);
		return "customList";
	}
}
