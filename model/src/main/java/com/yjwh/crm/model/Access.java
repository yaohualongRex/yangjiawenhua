package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "access")
public class Access {
	@Id
	@Column(name = "id")
	private Long id;
	@Column(name = "url")
	private String url;
	@Column(name = "name")
	private String name;
	@Column(name = "type")
	private Integer type;// 1.左父节点，2.左子节点，3.右按钮
	@Column(name = "parrent_id")
	private Long parrentId;

	public Access(Long id, String url, String name, Integer type, Long parrentId) {
		super();
		this.id = id;
		this.url = url;
		this.name = name;
		this.type = type;
		this.parrentId = parrentId;
	}

	public Access() {
		super();
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getParrentId() {
		return parrentId;
	}

	public void setParrentId(Long parrentId) {
		this.parrentId = parrentId;
	}

}
