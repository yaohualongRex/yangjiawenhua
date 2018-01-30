package com.yjwh.crm.manage.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yangjiawenhua.utils.CommonUtils;
import com.yjwh.crm.mapper.BookInfoMapper;
import com.yjwh.crm.mapper.UnionBookMapper;
import com.yjwh.crm.mapper.OrderMapper;
import com.yjwh.crm.model.BookInfo;
import com.yjwh.crm.model.Order;
import com.yjwh.crm.model.UnionBook;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import com.yjwh.crm.po.UnionBookPosition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
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
    @Autowired
    private BookInfoMapper bookInfoMapper;

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
        return JSON.toJSONString(response);
    }

    @RequestMapping("/selectUnionBookInfo")
    public Object selectUnionBookInfo(Long bookId, Model model){
        Example example = new Example(UnionBook.class);
        example.createCriteria().andEqualTo("id",bookId);
        UnionBook book = unionBookMapper.selectByExample(example).get(0);

        example = new Example(BookInfo.class);
        example.createCriteria().andEqualTo("id",book.getBookInfoId());
        BookInfo bookInfo = bookInfoMapper.selectByExample(example).get(0);

        HashMap<Object, Object> position = new HashMap<>();
        if (book.getA1() != null)
            position.put("a1",orderMapper.selectByPrimaryKey(book.getA1()).getCustomName());
        if (book.getA2() != null)
            position.put("a2",orderMapper.selectByPrimaryKey(book.getA2()).getCustomName());
        if (book.getA3() != null)
            position.put("a3",orderMapper.selectByPrimaryKey(book.getA3()).getCustomName());
        if (book.getA4() != null)
            position.put("a4",orderMapper.selectByPrimaryKey(book.getA4()).getCustomName());
        if (book.getA5() != null)
            position.put("a5",orderMapper.selectByPrimaryKey(book.getA5()).getCustomName());
        if (book.getA6() != null)
            position.put("a6",orderMapper.selectByPrimaryKey(book.getA6()).getCustomName());

        model.addAttribute("publicTime", CommonUtils.getStringTime(bookInfo.getPublicTime()));
        model.addAttribute("book",bookInfo);
        model.addAttribute("bookId",bookId);
        model.addAttribute("position",position);
        return "unionBookInfo";
    }

    private static final String[] POSITION_PRE = {"主编","副主编","参编"};
    private static final String[] POSITION_AFT = {"","一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五"};

    @RequestMapping("/selectOrders")
    @ResponseBody
    public Object selectOrders(Long bookId, Model model) throws IllegalAccessException {
        UnionBook book = unionBookMapper.selectByPrimaryKey(bookId);
        List<UnionBookPosition> positions = new ArrayList<>();
        Field[] fields = UnionBook.class.getDeclaredFields();
        for (Field field : fields) {
            UnionBookPosition position = new UnionBookPosition();
            String fieldName = field.getName();
            String preStr = fieldName.substring(0, 1);
            Integer pre=null;
            Integer aft =null;
            try {
                aft= new Integer(fieldName.substring(1));
            } catch (NumberFormatException e) {
                continue;
            }
            switch (preStr){
                case "a": pre=0;break;
                case "b": pre=1;break;
                case "c": pre=2;break;
            }
            field.setAccessible(true);
            Long orderId = null;
            Order order = null;
            if (field.get(book) != null){
                orderId=(Long) field.get(book);
                order = orderMapper.selectByPrimaryKey(orderId);
            }else {
                order = new Order();
            }
            position.setPosition(POSITION_PRE[pre]+POSITION_AFT[aft]);
            position.setCustomerName(order.getCustomName());
            position.setUserName(order.getUserName());
            position.setRemark(order.getRemark());
            position.setDetail("");
            position.setRecommendInfo("");
            position.setOrderId("1,"+bookId+","+ fieldName +","+position.getPosition());
            positions.add(position);
        }
        return new Response<>(positions);
    }

    public static void main(String[] args) {
        Field[] fields = UnionBook.class.getDeclaredFields();
        for (Field field : fields) {
            System.out.println();;
        }
    }
}
