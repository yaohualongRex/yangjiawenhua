package com.yjwh.crm.model;

import com.alibaba.fastjson.annotation.JSONField;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name = "order_x")
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
    private BigDecimal amount;
	@Column(name = "words")
    private String words;
	@Column(name = "remark")
    private String remark;
	@Column(name = "contract_send_date")
    private Date contractSendDate;
	@Column(name = "return_amount")
    private BigDecimal returnAmount;
	@Column(name = "return_date")
    private Date returnDate;
	@Column(name = "status")
    private String status;
	@Column(name = "create_time")
    @JSONField(format="yyyy-MM-dd")
    private Date createTime;
	@Column(name = "second_return_amount")
    private BigDecimal secondReturnAmount;
	@Column(name = "second_return_time")
    private Date secondReturnTime;
	@Column(name = "third_return_amount")
    private BigDecimal thirdReturnAmount;
	@Column(name = "third_return_time")
    private Date thirdReturnTime;
    @Column(name = "type")
    private Integer type;//1合作图书，2自费图书
    @Column(name = "book_name")
    private String bookName;
    @Column(name = "order_no")
    private String orderNo;
    @Column(name="user_name")
    private String userName;
    @Column(name="user_id")
    private Long userId;
    @Column(name="book_info_id")
    private Long bookInfoId;
    @Column(name="customer_id")
    private Long customerId;
    @Column(name="cancel_date")
    private Date cancelDate;
    @Column(name="union_book_position")
    private String unionBookPosition;

    public String getUnionBookPosition() {
        return unionBookPosition;
    }

    public void setUnionBookPosition(String unionBookPosition) {
        this.unionBookPosition = unionBookPosition;
    }

    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getBookInfoId() {
        return bookInfoId;
    }

    public void setBookInfoId(Long bookInfoId) {
        this.bookInfoId = bookInfoId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

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

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
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

    public BigDecimal getReturnAmount() {
        return returnAmount;
    }

    public void setReturnAmount(BigDecimal returnAmount) {
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

    public BigDecimal getSecondReturnAmount() {
        return secondReturnAmount;
    }

    public void setSecondReturnAmount(BigDecimal secondReturnAmount) {
        this.secondReturnAmount = secondReturnAmount;
    }

    public Date getSecondReturnTime() {
        return secondReturnTime;
    }

    public void setSecondReturnTime(Date secondReturnTime) {
        this.secondReturnTime = secondReturnTime;
    }

    public BigDecimal getThirdReturnAmount() {
        return thirdReturnAmount;
    }

    public void setThirdReturnAmount(BigDecimal thirdReturnAmount) {
        this.thirdReturnAmount = thirdReturnAmount;
    }

    public Date getThirdReturnTime() {
        return thirdReturnTime;
    }

    public void setThirdReturnTime(Date thirdReturnTime) {
        this.thirdReturnTime = thirdReturnTime;
    }
}