package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.yjwh.crm.mapper.CompanyBillMapper;
import com.yjwh.crm.model.CompanyBill;
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
 * 公司发票管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/5/51")
public class CompanyBillController {
    @Autowired
    private CompanyBillMapper companyBillMapper;

    @RequestMapping("/companyBillAddJsp")
    public String companyBillAddJsp(){
        return "companyBillAdd";
    }
    @RequestMapping("/companyBillListJsp")
    public String companyBillListJsp(){
        return "companyBillList";
    }
    @RequestMapping("/selectCompanyBill")
    @ResponseBody
    public Object selectCompanyBill(){
        List<CompanyBill> list = companyBillMapper.selectAll();
        return JSON.toJSONString(new Response<CompanyBill>(list));
    }
    @RequestMapping("/addCompanyBill")
    public String addCompanyBill(CompanyBill companyBill, HttpSession session){
        User currentUser = (User) session.getAttribute("currentUser");
        companyBill.setUserId(currentUser.getId());
        companyBill.setUserName(currentUser.getChinaName());
        companyBill.setStatus("待审核");
        companyBill.setCreateTime(new Date());
        companyBillMapper.insert(companyBill);
        return "redirect:/5/51/companyBillListJsp";
    }
}
