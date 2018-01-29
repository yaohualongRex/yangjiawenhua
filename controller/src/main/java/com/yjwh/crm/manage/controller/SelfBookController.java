package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yjwh.crm.enums.BookStatusEnum;
import com.yjwh.crm.enums.OrderStatusEnum;
import com.yjwh.crm.mapper.BookInfoMapper;
import com.yjwh.crm.mapper.SelfBookMapper;
import com.yjwh.crm.mapper.UnionBookMapper;
import com.yjwh.crm.model.BookInfo;
import com.yjwh.crm.model.SelfBook;
import com.yjwh.crm.model.UnionBook;
import com.yjwh.crm.po.BookInfoPo;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * 自费图书管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/3")
public class SelfBookController {
    @Autowired
    private SelfBookMapper selfBookMapper;
    @Autowired
    private UnionBookMapper unionBookMapper;
    @Autowired
    private BookInfoMapper bookInfoMapper;

    @RequestMapping("/32/selfBookListJsp")
    public String selfBookListJsp(){

        return "selfBookList";
    }

    @RequestMapping("/bookAddJsp")
    public String bookAddJsp(Integer bookType, Model model) {
        model.addAttribute("bookType",bookType);
        return "bookAdd";
    }

    @RequestMapping("/addBook")
    @ResponseBody
    @Transactional
    public String addBook(@RequestBody BookInfoPo bookInfoPo) throws InvocationTargetException, IllegalAccessException {
        bookInfoMapper.insert(bookInfoPo);
        BookInfo bookInfo = bookInfoMapper.selectOne(bookInfoPo);

        if (bookInfoPo.getBookType() == 1){
            UnionBook book = new UnionBook();
            book.setBookInfoId(bookInfo.getId());
            book.setBookName(bookInfo.getBookName());
            book.setPublicTime(bookInfo.getPublicTime());
            book.setPublicer(bookInfo.getPublicer());
            this.inifiColor(book);
            unionBookMapper.insert(book);
        }else {
            SelfBook book = new SelfBook();
            book.setBookInfoId(bookInfo.getId());
            book.setBookName(bookInfo.getBookName());
            book.setPublicer(bookInfo.getPublicer());
            book.setPublicTime(bookInfo.getPublicTime());
            book.setStatus(OrderStatusEnum.PRE_VERSION.getStatusName());
            selfBookMapper.insert(book);
        }

        return "添加成功";
    }

    @RequestMapping("/32/selectSelfBook")
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
    private void inifiColor(UnionBook book) {
        book.setA1s(BookStatusEnum.NO_ORDER.getColor());
        book.setA2s(BookStatusEnum.NO_ORDER.getColor());
        book.setA3s(BookStatusEnum.NO_ORDER.getColor());
        book.setA4s(BookStatusEnum.NO_ORDER.getColor());
        book.setA5s(BookStatusEnum.NO_ORDER.getColor());
        book.setA6s(BookStatusEnum.NO_ORDER.getColor());
        book.setB1s(BookStatusEnum.NO_ORDER.getColor());
        book.setB2s(BookStatusEnum.NO_ORDER.getColor());
        book.setB3s(BookStatusEnum.NO_ORDER.getColor());
        book.setB4s(BookStatusEnum.NO_ORDER.getColor());
        book.setB5s(BookStatusEnum.NO_ORDER.getColor());
        book.setB6s(BookStatusEnum.NO_ORDER.getColor());
        book.setB7s(BookStatusEnum.NO_ORDER.getColor());
        book.setB8s(BookStatusEnum.NO_ORDER.getColor());
        book.setC1s(BookStatusEnum.NO_ORDER.getColor());
        book.setC2s(BookStatusEnum.NO_ORDER.getColor());
        book.setC3s(BookStatusEnum.NO_ORDER.getColor());
        book.setC4s(BookStatusEnum.NO_ORDER.getColor());
        book.setC5s(BookStatusEnum.NO_ORDER.getColor());
        book.setC6s(BookStatusEnum.NO_ORDER.getColor());
        book.setC7s(BookStatusEnum.NO_ORDER.getColor());
        book.setC8s(BookStatusEnum.NO_ORDER.getColor());
        book.setC9s(BookStatusEnum.NO_ORDER.getColor());
        book.setC10s(BookStatusEnum.NO_ORDER.getColor());
        book.setC11s(BookStatusEnum.NO_ORDER.getColor());
        book.setC12s(BookStatusEnum.NO_ORDER.getColor());
        book.setC13s(BookStatusEnum.NO_ORDER.getColor());
        book.setC14s(BookStatusEnum.NO_ORDER.getColor());
        book.setC15s(BookStatusEnum.NO_ORDER.getColor());
    }
}
