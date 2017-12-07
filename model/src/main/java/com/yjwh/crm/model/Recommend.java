package com.yjwh.crm.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "recommend")
public class Recommend {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "type")
    private String type;
	@Column(name = "phone_no")
    private String phoneNo;
	@Column(name = "custom_phone_no")
    private String customPhoneNo;
	@Column(name = "bcustom_phone_no")
    private String bcustomPhoneNo;
	@Column(name = "custom_name")
    private String customName;
	@Column(name = "bcustom_name")
    private String bcustomName;
	@Column(name = "custom_company")
    private String customCompany;
	@Column(name = "bcustom_company")
    private String bcustomCompany;
	@Column(name = "bcustom_book_id")
    private Long bcustomBookId;
	@Column(name = "bcustom_place")
    private String bcustomPlace;
	@Column(name = "bcustom_amount")
    private Long bcustomAmount;
	@Column(name = "bank_name")
    private String bankName;
	@Column(name = "bank_no")
    private String bankNo;
	@Column(name = "recommend_amount")
    private Long recommendAmount;
	@Column(name = "recommend_remark")
    private String recommendRemark;
	@Column(name = "user_id")
    private Long userId;
	@Column(name = "user_name")
    private String userName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo == null ? null : phoneNo.trim();
    }

    public String getCustomPhoneNo() {
        return customPhoneNo;
    }

    public void setCustomPhoneNo(String customPhoneNo) {
        this.customPhoneNo = customPhoneNo == null ? null : customPhoneNo.trim();
    }

    public String getBcustomPhoneNo() {
        return bcustomPhoneNo;
    }

    public void setBcustomPhoneNo(String bcustomPhoneNo) {
        this.bcustomPhoneNo = bcustomPhoneNo == null ? null : bcustomPhoneNo.trim();
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName == null ? null : customName.trim();
    }

    public String getBcustomName() {
        return bcustomName;
    }

    public void setBcustomName(String bcustomName) {
        this.bcustomName = bcustomName == null ? null : bcustomName.trim();
    }

    public String getCustomCompany() {
        return customCompany;
    }

    public void setCustomCompany(String customCompany) {
        this.customCompany = customCompany == null ? null : customCompany.trim();
    }

    public String getBcustomCompany() {
        return bcustomCompany;
    }

    public void setBcustomCompany(String bcustomCompany) {
        this.bcustomCompany = bcustomCompany == null ? null : bcustomCompany.trim();
    }

    public Long getBcustomBookId() {
        return bcustomBookId;
    }

    public void setBcustomBookId(Long bcustomBookId) {
        this.bcustomBookId = bcustomBookId;
    }

    public String getBcustomPlace() {
        return bcustomPlace;
    }

    public void setBcustomPlace(String bcustomPlace) {
        this.bcustomPlace = bcustomPlace == null ? null : bcustomPlace.trim();
    }

    public Long getBcustomAmount() {
        return bcustomAmount;
    }

    public void setBcustomAmount(Long bcustomAmount) {
        this.bcustomAmount = bcustomAmount;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    public String getBankNo() {
        return bankNo;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo == null ? null : bankNo.trim();
    }

    public Long getRecommendAmount() {
        return recommendAmount;
    }

    public void setRecommendAmount(Long recommendAmount) {
        this.recommendAmount = recommendAmount;
    }

    public String getRecommendRemark() {
        return recommendRemark;
    }

    public void setRecommendRemark(String recommendRemark) {
        this.recommendRemark = recommendRemark == null ? null : recommendRemark.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}