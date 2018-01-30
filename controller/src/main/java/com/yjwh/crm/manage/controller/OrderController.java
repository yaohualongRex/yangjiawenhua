package com.yjwh.crm.manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yangjiawenhua.utils.CommonUtils;
import com.yjwh.crm.enums.BookStatusEnum;
import com.yjwh.crm.enums.OrderStatusEnum;
import com.yjwh.crm.mapper.*;
import com.yjwh.crm.model.*;
import com.yjwh.crm.po.OrderPo;
import com.yjwh.crm.po.OrderVo;
import com.yjwh.crm.po.PageInfo;
import com.yjwh.crm.po.Response;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 订单管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/4")
public class OrderController {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private UnionBookMapper unionBookMapper;
	@Autowired
	private SelfBookMapper selfBookMapper;
	@Autowired
	private CustomMapper customMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;

	
	@RequestMapping("/42/selectOrderPartJsp")
    public String userAddJsp(HttpSession session, Model model) {
        return "orderPartList";
    }
	
	@RequestMapping("/42/selectOrderOwnJsp")
	public String selectCustomerjsp(HttpSession session, Model model) {
		return "orderOwnList";
	}

	@RequestMapping("/orderAddJsp")
	public String orderAddJsp(String orderInfo,HttpSession session,  Model model) {
		User user = CommonUtils.getUser(session);
		String[] strs = orderInfo.split(",");
		OrderPo orderPo = new OrderPo();
		orderPo.setType(Integer.valueOf(strs[0]));
		orderPo.setBookId(Long.valueOf(strs[1]));
		if(strs[0].equals("1")){//合作图书订单
			UnionBook unionBook = unionBookMapper.selectByPrimaryKey(Long.valueOf(strs[1]));
			orderPo.setBookName(unionBook.getBookName());
			orderPo.setPlaceField(strs[2]);
			orderPo.setCustomPlace(strs[3]);
		}else {//自费图书
			SelfBook selfBook = selfBookMapper.selectByPrimaryKey(Long.valueOf(strs[1]));
			orderPo.setBookName(selfBook.getBookName());
		}
		model.addAttribute("model",orderPo);
		return "orderAdd";
	}
	@RequestMapping("/orderDataJsp")
	public String orderDataJsp(Long orderId,HttpSession session,  Model model) {
		Order order = orderMapper.selectByPrimaryKey(orderId);
		Custom custom = customMapper.selectByPrimaryKey(order.getCustomerId());

		String createTime = CommonUtils.dateToStr(order.getCreateTime());
		String sendDate = CommonUtils.dateToStr(order.getContractSendDate());
		String returnDate = CommonUtils.dateToStr(order.getReturnDate());
		String cancelDate = CommonUtils.dateToStr(order.getCancelDate());
		String status = OrderStatusEnum.getStatusNameByStatus(order.getStatus());
		model.addAttribute("order",order);
		model.addAttribute("customer",custom);
		model.addAttribute("createTime",createTime);
		model.addAttribute("sendDate",sendDate);
		model.addAttribute("status",status);
		model.addAttribute("returnDate",returnDate);
		model.addAttribute("cancelDate",cancelDate);
		model.addAttribute("userName",CommonUtils.getUser(session).getChinaName());
		return "orderData";
	}

	@RequestMapping("/addOrder")
	@ResponseBody
	@Transactional
	public String addOrder(HttpSession session,@RequestBody OrderVo orderVo) throws NoSuchFieldException, IllegalAccessException {
		User user = CommonUtils.getUser(session);
		Order order = new Order();

		order.setOrderNo(orderVo.getType().equals(1)? "h"+orderVo.getBookId()+orderVo.getPlaceField():"z"+orderVo.getBookId());
		order.setRemark(orderVo.getRemark());
		order.setType(orderVo.getType());
		order.setAmount(orderVo.getAmount());
		order.setUserId(user.getId());
		order.setUserName(user.getChinaName());
		order.setCustomPlace(orderVo.getCustomPlace());
		order.setBookId(orderVo.getBookId());
		order.setBookName(orderVo.getBookName());
		order.setWords(orderVo.getWords());
		order.setPhoneNo(orderVo.getPhoneNo());
		order.setCustomName(orderVo.getCustomName());
		order.setStatus(OrderStatusEnum.PRE_VERSION.getStatus());
		order.setCreateTime(new Date());

		Custom custom = new Custom();
		custom.setChinaName(order.getPhoneNo());
		custom.setPhoneNo(order.getPhoneNo());
		custom = customMapper.selectOne(custom);
		if (custom == null)
			throw new RuntimeException("该客户在系统中不存在，请核实或添加该客户。");
		order.setCustomerId(custom.getId());

		if (orderVo.getType().equals(1)){//合作图书
			UnionBook unionBook = unionBookMapper.selectByPrimaryKey(orderVo.getBookId());

			order.setBookInfoId(unionBook.getBookInfoId());
			orderMapper.insert(order);
			Order temp = new Order();
			temp.setOrderNo(order.getOrderNo());
			order = orderMapper.selectOne(temp);

			Field field = UnionBook.class.getDeclaredField(orderVo.getPlaceField());
			field.setAccessible(true);
			field.set(unionBook, order.getId());

			Field field1 = UnionBook.class.getDeclaredField(orderVo.getPlaceField()+"s");
			field1.setAccessible(true);
			field1.set(unionBook, BookStatusEnum.IS_ORDER.getColor());
			unionBookMapper.updateByPrimaryKeySelective(unionBook);
		}else {//自费图书
			SelfBook selfBook = selfBookMapper.selectByPrimaryKey(orderVo.getBookId());
			order.setBookInfoId(selfBook.getBookInfoId());
			orderMapper.insert(order);
			Order temp = new Order();
			temp.setOrderNo(order.getOrderNo());
			order = orderMapper.selectOne(temp);
			selfBook.setOrderId(order.getId());
			selfBook.setStatus(BookStatusEnum.NO_ORDER.getStatus()+"");
			selfBookMapper.updateByPrimaryKeySelective(selfBook);
		}
		return "添加订单成功";
	}
	@RequestMapping("/{type}/selectFinishOrder")//查询已完成订单
	@ResponseBody
	public String selectFinishOrder(HttpSession session,  Model model, PageInfo page, @PathVariable("type") Long type) {
		PageHelper.startPage(page.getPage(),page.getLimit());
		Example example = new Example(Order.class);
		example.orderBy("id");
		example.createCriteria()
				.andEqualTo("type",type)
				.andEqualTo("status",OrderStatusEnum.FINISH.getStatus());
		List<Order> orders = orderMapper.selectByExample(example);
		this.formatOrders(orders);

		Response<Order> body = new Response<>(orders);
		body.setCount(orderMapper.selectCountByExample(example));
		return JSON.toJSONString(body);
	}

	@RequestMapping("/{type}/selectActiveOrder")//查询未完成订单
	@ResponseBody
	public String selectActiveOrder(HttpSession session, Model model, PageInfo page, @PathVariable("type") Long type) {
		PageHelper.startPage(page.getPage(),page.getLimit());
		Example example = new Example(Order.class);
		example.orderBy("id");
		String[] notActiveStatus = new String[]{OrderStatusEnum.FINISH.getStatus(), OrderStatusEnum.CANCEL.getStatus()};
		example.createCriteria()
				.andEqualTo("type",type)
				.andNotIn("status", Arrays.asList(notActiveStatus));
		List<Order> orders = orderMapper.selectByExample(example);
		this.formatOrders(orders);
		Response<Order> body = new Response<>(orders);
		body.setCount(orderMapper.selectCountByExample(example));
		return JSON.toJSONString(body);
	}

	@RequestMapping("/{type}/selectCancelOrder")//查询已取消订单
	@ResponseBody
	public String selectCancelOrder(HttpSession session, Model model, PageInfo page, @PathVariable("type") Long type) {
		PageHelper.startPage(page.getPage(),page.getLimit());
		Example example = new Example(Order.class);
		example.orderBy("id");
		example.createCriteria()
				.andEqualTo("type",type)
				.andEqualTo("status",OrderStatusEnum.CANCEL.getStatus());
		List<Order> orders = orderMapper.selectByExample(example);
		this.formatOrders(orders);
		Response<Order> body = new Response<>(orders);
		body.setCount(orderMapper.selectCountByExample(example));
		return JSON.toJSONString(body);
	}

	@RequestMapping("/{sonPri}/orderListJsp")//
	public String orderListJsp(HttpSession session,  Model model, PageInfo page, @PathVariable("sonPri") Long sonPri) {
		Long type = sonPri % 10;//1自费图书，2合作图书
		model.addAttribute("type",type);
		model.addAttribute("typeName",type.equals(1l) ? "合作图书":"自费图书");
		return "orderList";
	}
	@RequestMapping("/updateOrder")
	@ResponseBody
	public String updateOrder(HttpSession session, @RequestBody Order order) {
		Order temp = orderMapper.selectByPrimaryKey(order.getId());
		User user = CommonUtils.getUser(session);
		UserRole userRole = new UserRole();
		userRole.setUserId(user.getId());
		userRole = userRoleMapper.selectOne(userRole);
		if (userRole.getRoleId()!=1l && userRole.getRoleId()!=2l)
			throw new RuntimeException("您没有权限进行此操作");
		if (temp.getStatus().equals(OrderStatusEnum.PRE_VERSION.getStatus())){//进行合同发送确认
			temp = new Order();
			temp.setId(order.getId());
			temp.setContractSendDate(order.getContractSendDate());
			order.setStatus(OrderStatusEnum.CONTRACT_SEND.getStatus());
			orderMapper.updateByPrimaryKeySelective(order);
		}else if(temp.getStatus().equals(OrderStatusEnum.CONTRACT_SEND.getStatus())){//进行回款确认
			temp = new Order();
			temp.setId(order.getId());
			temp.setContractSendDate(order.getContractSendDate());
			order.setStatus(OrderStatusEnum.RETURN.getStatus());
			orderMapper.updateByPrimaryKeySelective(order);
		}else if (temp.getStatus().equals(OrderStatusEnum.RETURN.getStatus())){//订单结束
			temp = new Order();
			temp.setId(order.getId());
			order.setStatus(OrderStatusEnum.FINISH.getStatus());
			orderMapper.updateByPrimaryKeySelective(order);
		}

		return "更新状态成功";
	}

	@RequestMapping("/cancelOrder")
	@ResponseBody
	public String updateOrder(HttpSession session,Long id) {
		Order order = new Order();
		order.setId(id);
		order.setStatus(OrderStatusEnum.CANCEL.getStatus());
		orderMapper.updateByPrimaryKeySelective(order);
		return "取消订单成功";
	}

	private void formatOrders(List<Order> orders){
		for (Order order : orders) {
			order.setStatus(OrderStatusEnum.getStatusNameByStatus(order.getStatus()));
		}
	}

}
