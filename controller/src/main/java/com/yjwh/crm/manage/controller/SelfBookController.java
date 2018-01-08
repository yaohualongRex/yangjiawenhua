package com.yjwh.crm.manage.controller;

import com.yjwh.crm.mapper.BookMapper;
import com.yjwh.crm.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

/**
 * 自费图书管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/3/32")
public class SelfBookController {
    @Autowired
    private BookMapper bookMapper;

    @RequestMapping("/selfBookListJsp")
    public String selfBookListJsp(){
        return "selfBookList";
    }

    @RequestMapping("selectSelfBook")
    @ResponseBody
    public Object selectSelfBook(){
        Example example = new Example(Book.class);
        example.createCriteria()
                .andEqualTo("",11);
        return "";
    }
}
