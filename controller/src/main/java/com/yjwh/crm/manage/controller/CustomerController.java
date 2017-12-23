package com.yjwh.crm.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
	public String selectCustomerjsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		return "customList";
	}
	
	@RequestMapping("22/selectCustom")
	public void selectCustomer(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		Map<Object,Object> map  = new HashMap<Object,Object>();
		List<Custom> customList = customerMapper.selectAll();
		 JSONArray jsonArray = new JSONArray();
		 for (Object object : customList) {
			 jsonArray.add(object);
		}
		 map.put("data", jsonArray);
		 String jsonObject = JSONObject.toJSONString(map);
		 model.addAttribute("idTest",jsonObject);
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
