package com.yjwh.crm.manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 推荐费管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("6")
public class RecommendController {

	@RequestMapping("62/addRecommendJsp")
    public String userAddJsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
        return "recommendAdd";
    }
	
	@RequestMapping("62/selectRecommendJsp")
	public String selectCustomerjsp(HttpSession session, HttpServletRequest request , HttpServletResponse response,Model model) {
		return "recommendList";
	}
}
