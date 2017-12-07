package com.yjwh.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name = "order")
public class Order {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "phone_no")
    private String phoneNo;
	@Column(name = "custom_name")
    private String customName;
	@Column(name = "custom_place")
    private String customPlace;
	@Column(name = "book_id")
    private Long bookId;
	@Column(name = "amount")
    private Long amount;
	@Column(name = "words")
    private String words;
	@Column(name = "remark")
    private String remark;
	@Column(name = "contract_send_date")
    private Date contractSendDate;
	@Column(name = "return_amount")
    private Long returnAmount;
	@Column(name = "return_date")
    private Date returnDate;
	@Column(name = "status")
    private String status;
	@Column(name = "create_time")
    private Date createTime;
	@Column(name = "second_return_amount")
    private Long secondReturnAmount;
	@Column(name = "second_return_time")
    private Date secondReturnTime;
	@Column(name = "third_return_amount")
    private Long thirdReturnAmount;
	@Column(name = "third_return_time")
    private Date thirdReturnTime;
	
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo == null ? null : phoneNo.trim();
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName == null ? null : customName.trim();
    }

    public String getCustomPlace() {
        return customPlace;
    }

    public void setCustomPlace(String customPlace) {
        this.customPlace = customPlace == null ? null : customPlace.trim();
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words == null ? null : words.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getContractSendDate() {
        return contractSendDate;
    }

    public void setContractSendDate(Date contractSendDate) {
        this.contractSendDate = contractSendDate;
    }

    public Long getReturnAmount() {
        return returnAmount;
    }

    public void setReturnAmount(Long returnAmount) {
        this.returnAmount = returnAmount;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getSecondReturnAmount() {
        return secondReturnAmount;
    }

    public void setSecondReturnAmount(Long secondReturnAmount) {
        this.secondReturnAmount = secondReturnAmount;
    }

    public Date getSecondReturnTime() {
        return secondReturnTime;
    }

    public void setSecondReturnTime(Date secondReturnTime) {
        this.secondReturnTime = secondReturnTime;
    }

    public Long getThirdReturnAmount() {
        return thirdReturnAmount;
    }

    public void setThirdReturnAmount(Long thirdReturnAmount) {
        this.thirdReturnAmount = thirdReturnAmount;
    }

    public Date getThirdReturnTime() {
        return thirdReturnTime;
    }

    public void setThirdReturnTime(Date thirdReturnTime) {
        this.thirdReturnTime = thirdReturnTime;
    }
}