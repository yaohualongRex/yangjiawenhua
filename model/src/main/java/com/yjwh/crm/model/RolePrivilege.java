package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "role_privilege")
public class RolePrivilege {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "role_id")
    private Long roleId;
    @Column(name = "privilege_id")
    private Long privilegeId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Long privilegeId) {
        this.privilegeId = privilegeId;
    }
}
