package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.yjwh.crm.mapper.CompanyBillMapper;
import com.yjwh.crm.mapper.PublicBillMapper;
import com.yjwh.crm.model.CompanyBill;
import com.yjwh.crm.model.PublicBill;
import com.yjwh.crm.model.User;
import com.yjwh.crm.po.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 出版社发票管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/5/52")
public class PublicBillController {
    @Autowired
    private PublicBillMapper publicBillMapper;
    @RequestMapping("/publicBillAddJsp")
    public String publicBillAddJsp(){
        return "publicBillAdd";
    }
    @RequestMapping("/publicBillListJsp")
    public String companyBillListJsp(){
        return "publicBillList";
    }
    @RequestMapping("/selectPublicBill")
    @ResponseBody
    public Object selectPublicBill(){
        List<PublicBill> list = publicBillMapper.selectAll();
        return JSON.toJSONString(new Response<>(list));
    }
    @RequestMapping("/addPublicBill")
    public String addCompanyBill(PublicBill publicBill, HttpSession session){
        User currentUser = (User) session.getAttribute("currentUser");
        publicBill.setUserId(currentUser.getId());
        publicBill.setUserName(currentUser.getChinaName());
        publicBill.setStatus("待审核");
        publicBill.setCreateTime(new Date());
        publicBillMapper.insert(publicBill);
        return "redirect:/5/51/publicBillListJsp";
    }
}
