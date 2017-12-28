package com.yjwh.crm.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yjwh.crm.po.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yjwh.crm.manage.service.PrivilegeService;
import com.yjwh.crm.mapper.CustomMapper;
import com.yjwh.crm.mapper.RoleMapper;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.mapper.UserRoleMapper;
import com.yjwh.crm.model.Custom;
import com.yjwh.crm.model.User;
import com.yjwh.crm.model.UserRole;
import com.yjwh.crm.po.CustomModle;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 客户信息
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/2")
public class CustomerController {
	
	 @Autowired
	 private CustomMapper customerMapper;
	 @Autowired
	 private UserMapper userMapper;
	 @Autowired
	 private PrivilegeService privilegeService;
	 @Autowired
	 private UserRoleMapper userRoleMapper;
	 @Autowired
	 private RoleMapper roleMapper;
	 
	@RequestMapping("/22/selectCustomJsp")
	public String selectCustomerjsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		return "customList";
	}
	
	@RequestMapping("/22/selectCustom")
	@ResponseBody
	public Object selectCustomer(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		Map<Object,Object> map  = new HashMap<Object,Object>();
		List<Custom> customList = customerMapper.selectAll();
		List<CustomModle> customLists = new ArrayList<CustomModle>();
		for (Custom custom : customList) {
			CustomModle customM = new CustomModle();
			customM.setChinaName(custom.getChinaName());
			customM.setId(custom.getId());
			customM.setPhoneNo(custom.getPhoneNo());
			customM.setProfession(custom.getProfession());
			customM.setUnitName(custom.getUnitName());
			customM.setUserChinaName(userMapper.selectByPrimaryKey(custom.getUserId()).getChinaName());
			customM.setUserId(custom.getUserId());
			customLists.add(customM);
		}
		return new Response<CustomModle>(customLists);
	}
	
	@RequestMapping("/22/addCustomJsp")
    public String userAddJsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
        return "customAdd";
    }
	@RequestMapping("/22/addCustom")
	public String addCustomer(CustomModle custom,HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		int insert = customerMapper.insert(custom);
		return "customList";
	}
	
	@RequestMapping("/22/delCustom")
	@Transactional
	public String delCustomer(String ids) {
		 String[] split = ids.split(",");
	        List<Long> customs = JSON.parseArray(JSON.toJSONString(split), Long.class);
	        customs.forEach(id -> {
	        	customerMapper.deleteByPrimaryKey(id);
//	            UserRole userRole = new UserRole();
//	            userRole.setUserId(id);
//	            userRole = userRoleMapper.selectOne(userRole);
//	            userRoleMapper.deleteByPrimaryKey(userRole.getId());
	        });
	        return "redirect:/2/22/userListJsp";
	}
	
	@RequestMapping("/22/updateCustom")
	public String updateCustomer(CustomModle custom,HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		int insert = customerMapper.insert(custom);
		return "customList";
	}
}
