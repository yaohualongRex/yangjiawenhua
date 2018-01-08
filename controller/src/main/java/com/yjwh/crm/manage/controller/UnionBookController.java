package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yjwh.crm.mapper.BookMapper;
import com.yjwh.crm.model.Book;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 合作图书管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/3/31")
public class UnionBookController {
    @Autowired
    private BookMapper bookMapper;

    @RequestMapping("/unionBookListJsp")
    public String unionBookListJsp(){
        return "unionBookList";
    }

    @RequestMapping("/selectUnionBook")
    @ResponseBody
    public Object selectUnionBook(PageInfo page){
        PageHelper.startPage(page.getPage(),page.getLimit());
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("type",1);
        List<Book> books = bookMapper.selectByExample(example);
        Response<Book> response = new Response<>(books);
        response.setCount(bookMapper.selectCountByExample(example));
        //TODO 通过a1保存的订单id，查询订单，确定状态

        return JSON.toJSONString(response);
    }

    @RequestMapping("/selectUnionBookInfo")
    public Object selectUnionBookInfo(Long bookId, Model model){
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("id",bookId);
        Book book = bookMapper.selectByExample(example).get(0);
        model.addAttribute("book",book);
        return "unionBookInfo";
    }
}
