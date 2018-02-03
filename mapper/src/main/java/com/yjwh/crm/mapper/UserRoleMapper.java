package com.yjwh.crm.mapper;

import com.yjwh.crm.base.BaseMapper;
import com.yjwh.crm.model.UserRole;

public interface UserRoleMapper extends BaseMapper<UserRole>{
    Long[] SALE_MANAGERS = {6l,9l,11l,13l,15l};
    Long[] SALERS = {7l,10l,12l,14l,16l};
}