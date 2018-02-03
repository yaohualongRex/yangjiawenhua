package com.yjwh.crm.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "self_book")
public class SelfBook {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "book_name")
    private String bookName;
    @Column(name = "public_time")
    @JSONField(format="yyyy-MM-dd")
    private Date publicTime;
    @Column(name = "publicer")
    private String  publicer;
    @Column(name = "order_id")
    private Long orderId;
    @Column(name = "status")
    private String status;
    @Column(name = "book_info_id")
    private Long bookInfoId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Date getPublicTime() {
        return publicTime;
    }

    public void setPublicTime(Date publicTime) {
        this.publicTime = publicTime;
    }

    public String getPublicer() {
        return publicer;
    }

    public void setPublicer(String publicer) {
        this.publicer = publicer;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getBookInfoId() {
        return bookInfoId;
    }

    public void setBookInfoId(Long bookInfoId) {
        this.bookInfoId = bookInfoId;
    }
}
