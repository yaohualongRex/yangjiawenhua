package com.yjwh.crm.po;

import com.yjwh.crm.model.User;

public class UserModule extends User{
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
