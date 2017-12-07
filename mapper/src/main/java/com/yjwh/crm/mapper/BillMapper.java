package com.yjwh.crm.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yjwh.crm.base.BaseMapper;
import com.yjwh.crm.model.Bill;

public interface BillMapper  extends BaseMapper<Bill>{
	// 需注意这种方式查询出字段名不一致无法直接赋值
	 @Select("select * from bill where id=#{id}")
	 Bill useForDecode(@Param("id") Long id);
}