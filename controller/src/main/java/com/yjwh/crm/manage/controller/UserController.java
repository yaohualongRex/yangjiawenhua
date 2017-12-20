package com.yjwh.crm.manage.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yangjiawenhua.utils.CommonUtils;
import com.yjwh.crm.po.UserModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjwh.crm.manage.service.PrivilegeService;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;
import com.yjwh.crm.po.PrivilegeModoule;
import com.yjwh.crm.po.UserDate;

import org.springframework.web.bind.annotation.RequestParam;

/*
 * 用户资料管理
 */
@Controller
@RequestMapping("1/11")
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PrivilegeService privilegeService;

    @PostMapping("login")
    public String login(User user, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        User loginUser = null;
        try {
            loginUser = userMapper.selectOne(user);
        } catch (Exception e) {
            throw new RuntimeException("存在重复的用户，请检查系统");
        }

        if (loginUser != null) {
            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            cookie.setMaxAge(60 * 60 * 2);
            cookie.setPath("/");
            response.addCookie(cookie);

            // 根据用户获取该用户的权限
            List<PrivilegeModoule> privilegeModoules = privilegeService.getUsersAllPrivileges(loginUser);
            session.setAttribute("privileges", privilegeModoules);
            UserModule userModule = privilegeService.getUserModule(loginUser);
            session.setAttribute("currentUser", userModule);
            return "redirect:/index";
        } else {
            return "forward:/?msg=用户名、密码不匹配";
        }
    }

    @RequestMapping("loginOut")
    public String loginOut(HttpSession session, HttpServletRequest request ,HttpServletResponse response) {
        Cookie cookie = CommonUtils.getCookieByName("JSESSIONID",request);
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        session.setMaxInactiveInterval(1);
        return "redirect:/";
    }

    @RequestMapping("userAddJsp")
    public String userAddJsp(HttpSession session, HttpServletRequest request ,HttpServletResponse response) {
        return "userAdd";
    }
    @RequestMapping("addUser")
    public String addUser(HttpSession session, HttpServletRequest request ,HttpServletResponse response,User user) {
        User user1 = new User();
        user1.setUsername(user.getUsername());
        if (userMapper.selectOne(user1)!=null){
            return "forword:/userAddJsp?msg=用户名已经存在";
        }
        return "index";
    }
    
    @RequestMapping("userData")
    public String intoUserData(Model model,HttpSession session, HttpServletRequest request ,HttpServletResponse response) {
        return "userData";

    }
    @RequestMapping("updateUserData")
    public String updateUserData(UserDate user,Model model,HttpSession session, HttpServletRequest request ,HttpServletResponse response) {
    	User selectOne = userMapper.selectByPrimaryKey(user.getId());
    	selectOne.setChinaName(user.getChinaName());
    	selectOne.setSex(user.getSex());
    	selectOne.setPassword(user.getPassword1());
    	userMapper.updateByPrimaryKeySelective(selectOne);
    	UserModule userModule = privilegeService.getUserModule(selectOne);
    	session.setAttribute("currentUser", userModule);
        return "userData";

    }
}
