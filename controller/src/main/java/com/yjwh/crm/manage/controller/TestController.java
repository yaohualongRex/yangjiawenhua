package com.yjwh.crm.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.yjwh.crm.mapper.BillMapper;
import com.yjwh.crm.model.Bill;

import tk.mybatis.mapper.entity.Example;

@Controller
public class TestController {
	@Autowired
	private BillMapper billMapper;
	
	@GetMapping("hello")
	public String hello() {
		return "hello";
	}
	@GetMapping("index")
	public String way() {
		return "index";
	}
	@GetMapping("/")
	public String login() {
		return "login";
	}
	
	@GetMapping("test")
	@ResponseBody
	public String test() {
		Example e = new Example(Bill.class);
		e.createCriteria().andEqualTo("id", 1);
		List<Bill> bills = billMapper.selectByExample(e);
		System.out.println(bills.size());
		bills = billMapper.selectAll();
		Bill bill = new Bill();
		bill.setId(1l);
		
		bill = billMapper.selectOne(bill);
		bill = billMapper.selectByPrimaryKey(1l);
		System.out.println(JSON.toJSONString(bill));
//		billMapper.insert(new Bill());
//		billMapper.updateByPrimaryKey(new Bill());
		
		return "success";
	}
	@GetMapping("testBill")
	@ResponseBody
	public String testBill() {
		Bill bill = new Bill();
		bill.setBookId((long) 1);
		billMapper.insert(bill);
		System.out.println(JSON.toJSONString(bill));
//		billMapper.insert(new Bill());
//		billMapper.updateByPrimaryKey(new Bill());
		
		return bill+"success";
	}
}
