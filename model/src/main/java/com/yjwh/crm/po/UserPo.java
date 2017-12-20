package com.yjwh.crm.po;

import com.yjwh.crm.model.User;

public class UserPo extends User{
    private Long roleId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
