package com.yjwh.crm.manage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.yangjiawenhua.utils.CommonUtils;
import com.yjwh.crm.mapper.RoleMapper;
import com.yjwh.crm.mapper.UserRoleMapper;
import com.yjwh.crm.model.UserRole;
import com.yjwh.crm.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.yjwh.crm.manage.service.PrivilegeService;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;

/*
 * 用户资料管理
 */
@Controller
@RequestMapping("/1/11")
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PrivilegeService privilegeService;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private RoleMapper roleMapper;

    @RequestMapping("/userAddJsp")
    public String userAddJsp() {
        return "userAdd";
    }
    @RequestMapping("/userUpdateJsp")
    public String userUpdateJsp(Long id,Model model) {
        User user = userMapper.selectByPrimaryKey(id);
        UserPo userPo = JSON.parseObject(JSON.toJSONString(user), UserPo.class);
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userPo.setRoleId(userRoleMapper.selectOne(userRole).getRoleId());
        model.addAttribute("user",userPo);
        return "userUpdate";
    }

    @RequestMapping("/userListJsp")
    public String userListJsp() {
        return "userList";
    }
    @RequestMapping("/selectUser")
    @ResponseBody
    public Object selectUser(){
        List<User> users = userMapper.selectAll();
        return new Response<>(users);
    }
    @RequestMapping("/deleteUser")
    @Transactional
    public String deleteUser(String ids) {
        String[] split = ids.split(",");
        List<Long> users = JSON.parseArray(JSON.toJSONString(split), Long.class);
        users.forEach(id -> {
            userMapper.deleteByPrimaryKey(id);
            UserRole userRole = new UserRole();
            userRole.setUserId(id);
            userRole = userRoleMapper.selectOne(userRole);
            userRoleMapper.deleteByPrimaryKey(userRole.getId());
        });
        return "redirect:/1/11/userListJsp";
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    @Transactional
    public String updateUser(@RequestBody UserPo user) {
        User user1 = new User();
        user1.setId(user.getId());
        user.setId(userMapper.selectOne(user1).getId());
        user.setPosition(roleMapper.selectByPrimaryKey(user.getRoleId()).getRoleName());
        userMapper.updateByPrimaryKeySelective(user);

        UserRole userRole = new UserRole();
        userRole.setUserId(user1.getId());
        userRole = userRoleMapper.selectOne(userRole);
        userRole.setRoleId(user.getRoleId());
        userRoleMapper.updateByPrimaryKeySelective(userRole);
        return "更新成功";
    }
    @RequestMapping("/addUser")
    @ResponseBody
    @Transactional
    public String addUser(@RequestBody UserPo user) {
        User user1 = new User();
        user1.setUsername(user.getUsername());
        if (userMapper.selectOne(user1)!=null)
            throw new RuntimeException("用户名已经存在");
        user1 = new User();
        user1.setUserNo(user.getUserNo());
        if (userMapper.selectOne(user1)!=null)
            throw new RuntimeException("员工编号已使用");
        user.setPosition(roleMapper.selectByPrimaryKey(user.getRoleId()).getRoleName());
        userMapper.insert(user);

        user1 = userMapper.selectOne(user);
        UserRole userRole = new UserRole();
        userRole.setUserId(user1.getId());
        userRole.setRoleId(user.getRoleId());
        userRoleMapper.insert(userRole);
        return "添加成功";
    }
    
}
