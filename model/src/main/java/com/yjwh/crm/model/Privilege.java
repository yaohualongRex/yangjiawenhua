package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "privilege")
public class Privilege {
	@Id
	@Column(name = "id")
	private Long id;
	@Column(name = "url")
	private String url;
	@Column(name = "privilege_name")
	private String privilegeName;
	@Column(name = "type")
	private Integer type;// 1.左父节点，2.左子节点，3.右按钮
	@Column(name = "pid")
	private Long pid;

	public Privilege(Long id, String url, String privilegeName, Integer type, Long pid) {
		this.id = id;
		this.url = url;
		this.privilegeName = privilegeName;
		this.type = type;
		this.pid = pid;
	}

	public Privilege() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPrivilegeName() {
		return privilegeName;
	}

	public void setPrivilegeName(String privilegeName) {
		this.privilegeName = privilegeName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}
}
