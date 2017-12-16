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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjwh.crm.manage.service.AccessService;
import com.yjwh.crm.mapper.UserMapper;
import com.yjwh.crm.model.User;
import com.yjwh.crm.po.AccessModoule;

/*
 * 用户资料管理
 */
@Controller
@RequestMapping("1/11")
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AccessService accessService;

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
            List<AccessModoule> accessModoules = accessService.getUsersAllAccesses(loginUser);
            session.setAttribute("accesses", accessModoules);

            UserModule userModule = accessService.getUserModule(loginUser);
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
}
