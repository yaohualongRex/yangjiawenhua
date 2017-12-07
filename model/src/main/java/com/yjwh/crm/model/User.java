package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "user")
public class User {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "username")
    private String username;
	@Column(name = "sex")
    private String sex;
	@Column(name = "password")
    private String password;
	@Column(name = "position")
    private String position;
	@Column(name = "dto_id")
    private String dtoId;
	@Column(name = "china_name")
    private String chinaName;
	@Column(name = "user_no")
    private String userNo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getDtoId() {
        return dtoId;
    }

    public void setDtoId(String dtoId) {
        this.dtoId = dtoId == null ? null : dtoId.trim();
    }

    public String getChinaName() {
        return chinaName;
    }

    public void setChinaName(String chinaName) {
        this.chinaName = chinaName == null ? null : chinaName.trim();
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo == null ? null : userNo.trim();
    }
}