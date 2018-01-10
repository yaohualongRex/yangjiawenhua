package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yjwh.crm.mapper.UnionBookMapper;
import com.yjwh.crm.mapper.OrderMapper;
import com.yjwh.crm.model.UnionBook;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private UnionBookMapper unionBookMapper;
    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("/unionBookListJsp")
    public String unionBookListJsp(){
        return "unionBookList";
    }

    @RequestMapping("/selectUnionBook")
    @ResponseBody
    public Object selectUnionBook(PageInfo page){
        PageHelper.startPage(page.getPage(),page.getLimit());
        Example example = new Example(UnionBook.class);
        example.createCriteria();
        List<UnionBook> books = unionBookMapper.selectByExample(example);
        Response<UnionBook> response = new Response<>(books);
        response.setCount(unionBookMapper.selectCountByExample(example));

        String format = "<font color='%s'>█<font>";
        for (UnionBook book : books) {
            book.setA1s(String.format(format,book.getA1s()));
            book.setA2s(String.format(format,book.getA2s()));
            book.setA3s(String.format(format,book.getA3s()));
            book.setA4s(String.format(format,book.getA4s()));
            book.setA5s(String.format(format,book.getA5s()));
            book.setA6s(String.format(format,book.getA6s()));
            book.setB1s(String.format(format,book.getB1s()));
            book.setB2s(String.format(format,book.getB2s()));
            book.setB3s(String.format(format,book.getB3s()));
            book.setB4s(String.format(format,book.getB4s()));
            book.setB5s(String.format(format,book.getB5s()));
            book.setB6s(String.format(format,book.getB6s()));
            book.setB7s(String.format(format,book.getB7s()));
            book.setB8s(String.format(format,book.getB8s()));
            book.setC1s(String.format(format,book.getC1s()));
            book.setC2s(String.format(format,book.getC2s()));
            book.setC3s(String.format(format,book.getC3s()));
            book.setC4s(String.format(format,book.getC4s()));
            book.setC5s(String.format(format,book.getC5s()));
            book.setC6s(String.format(format,book.getC6s()));
            book.setC7s(String.format(format,book.getC7s()));
            book.setC8s(String.format(format,book.getC8s()));
            book.setC9s(String.format(format,book.getC9s()));
            book.setC10s(String.format(format,book.getC10s()));
            book.setC11s(String.format(format,book.getC11s()));
            book.setC12s(String.format(format,book.getC12s()));
            book.setC13s(String.format(format,book.getC13s()));
            book.setC14s(String.format(format,book.getC14s()));
            book.setC15s(String.format(format,book.getC15s()));
        }
        return JSON.toJSONString(response);
    }

    @RequestMapping("/selectUnionBookInfo")
    public Object selectUnionBookInfo(Long bookId, Model model){
        Example example = new Example(UnionBook.class);
        example.createCriteria().andEqualTo("id",bookId);
        UnionBook book = unionBookMapper.selectByExample(example).get(0);
        model.addAttribute("book",book);
        return "unionBookInfo";
    }
}
