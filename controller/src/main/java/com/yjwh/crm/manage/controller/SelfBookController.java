package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yjwh.crm.mapper.SelfBookMapper;
import com.yjwh.crm.mapper.UnionBookMapper;
import com.yjwh.crm.model.SelfBook;
import com.yjwh.crm.model.UnionBook;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 自费图书管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/3/32")
public class SelfBookController {
    @Autowired
    private SelfBookMapper selfBookMapper;

    @RequestMapping("/selfBookListJsp")
    public String selfBookListJsp(){
        return "selfBookList";
    }

    @RequestMapping("selectSelfBook")
    @ResponseBody
    public Object selectSelfBook(PageInfo page){
        PageHelper.startPage(page.getPage(),page.getLimit());
        Example example = new Example(SelfBook.class);
        example.createCriteria();
        List<SelfBook> books = selfBookMapper.selectByExample(example);
        Response<SelfBook> response = new Response<>(books);
        response.setCount(selfBookMapper.selectCountByExample(example));

        return JSON.toJSONString(response);
    }
}
