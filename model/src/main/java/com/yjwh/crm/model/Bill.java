package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "bill")
public class Bill {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "frome")
    private String frome;
	@Column(name = "type")
    private String type;
	@Column(name = "head")
    private String head;
	@Column(name = "card")
    private String card;
	@Column(name = "name")
    private String name;
	@Column(name = "company")
    private String company;
	@Column(name = "project")
    private String project;
	@Column(name = "book_type")
    private String bookType;
	@Column(name = "book_id")
    private Long bookId;
	@Column(name = "publishing_house")
    private String publishingHouse;
	@Column(name = "bill_amount")
    private Long billAmount;
	@Column(name = "remark")
    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFrom() {
        return frome;
    }

    public void setFrom(String frome) {
        this.frome = frome == null ? null : frome.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head == null ? null : head.trim();
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card == null ? null : card.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project == null ? null : project.trim();
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType == null ? null : bookType.trim();
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getPublishingHouse() {
        return publishingHouse;
    }

    public void setPublishingHouse(String publishingHouse) {
        this.publishingHouse = publishingHouse == null ? null : publishingHouse.trim();
    }

    public Long getBillAmount() {
        return billAmount;
    }

    public void setBillAmount(Long billAmount) {
        this.billAmount = billAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}