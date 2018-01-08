package com.yjwh.crm.model;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "book")
public class Book {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "book_name")
    private String bookName;
	@Column(name = "create_time")
    @JSONField(format="yyyy-MM-dd")
    private Date createTime;
    @Column(name = "status")
    private String status;
    @Column(name = "type")
    private Integer type;//图书类型：1合作图书，2自费图书
	@Column(name = "a_1")
    private Long a1;
	@Column(name = "a_2")
    private Long a2;
	@Column(name = "a_3")
    private Long a3;
	@Column(name = "a_4")
    private Long a4;
	@Column(name = "a_5")
    private Long a5;
	@Column(name = "a_6")
    private Long a6;
	@Column(name = "b_1")
    private Long b1;
	@Column(name = "b_2")
    private Long b2;
	@Column(name = "b_3")
    private Long b3;
	@Column(name = "b_4")
    private Long b4;
	@Column(name = "b_5")
    private Long b5;
	@Column(name = "b_6")
    private Long b6;
	@Column(name = "b_7")
    private Long b7;
	@Column(name = "b_8")
    private Long b8;
	@Column(name = "c_1")
    private Long c1;
	@Column(name = "c_2")
    private Long c2;
	@Column(name = "c_3")
    private Long c3;
	@Column(name = "c_4")
    private Long c4;
	@Column(name = "c_5")
    private Long c5;
	@Column(name = "c_6")
    private Long c6;
	@Column(name = "c_7")
    private Long c7;
    @Column(name = "c_8")
    private Long c8;
    @Column(name = "c_9")
    private Long c9;
    @Column(name = "c_10")
    private Long c10;
    @Column(name = "c_11")
    private Long c11;
    @Column(name = "c_12")
    private Long c12;
    @Column(name = "c_13")
    private Long c13;
    @Column(name = "c_14")
    private Long c14;
    @Column(name = "c_15")
    private Long c15;
    @Column(name = "book_info_id")
    private Long bookInfoId;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getA1() {
        return a1;
    }

    public void setA1(Long a1) {
        this.a1 = a1;
    }

    public Long getA2() {
        return a2;
    }

    public void setA2(Long a2) {
        this.a2 = a2;
    }

    public Long getA3() {
        return a3;
    }

    public void setA3(Long a3) {
        this.a3 = a3;
    }

    public Long getA4() {
        return a4;
    }

    public void setA4(Long a4) {
        this.a4 = a4;
    }

    public Long getA5() {
        return a5;
    }

    public void setA5(Long a5) {
        this.a5 = a5;
    }

    public Long getA6() {
        return a6;
    }

    public void setA6(Long a6) {
        this.a6 = a6;
    }

    public Long getB1() {
        return b1;
    }

    public void setB1(Long b1) {
        this.b1 = b1;
    }

    public Long getB2() {
        return b2;
    }

    public void setB2(Long b2) {
        this.b2 = b2;
    }

    public Long getB3() {
        return b3;
    }

    public void setB3(Long b3) {
        this.b3 = b3;
    }

    public Long getB4() {
        return b4;
    }

    public void setB4(Long b4) {
        this.b4 = b4;
    }

    public Long getB5() {
        return b5;
    }

    public void setB5(Long b5) {
        this.b5 = b5;
    }

    public Long getB6() {
        return b6;
    }

    public void setB6(Long b6) {
        this.b6 = b6;
    }

    public Long getB7() {
        return b7;
    }

    public void setB7(Long b7) {
        this.b7 = b7;
    }

    public Long getB8() {
        return b8;
    }

    public void setB8(Long b8) {
        this.b8 = b8;
    }

    public Long getC1() {
        return c1;
    }

    public void setC1(Long c1) {
        this.c1 = c1;
    }

    public Long getC2() {
        return c2;
    }

    public void setC2(Long c2) {
        this.c2 = c2;
    }

    public Long getC3() {
        return c3;
    }

    public void setC3(Long c3) {
        this.c3 = c3;
    }

    public Long getC4() {
        return c4;
    }

    public void setC4(Long c4) {
        this.c4 = c4;
    }

    public Long getC5() {
        return c5;
    }

    public void setC5(Long c5) {
        this.c5 = c5;
    }

    public Long getC6() {
        return c6;
    }

    public void setC6(Long c6) {
        this.c6 = c6;
    }

    public Long getC7() {
        return c7;
    }

    public void setC7(Long c7) {
        this.c7 = c7;
    }

    public Long getC8() {
        return c8;
    }

    public void setC8(Long c8) {
        this.c8 = c8;
    }

    public Long getC9() {
        return c9;
    }

    public void setC9(Long c9) {
        this.c9 = c9;
    }

    public Long getC10() {
        return c10;
    }

    public void setC10(Long c10) {
        this.c10 = c10;
    }

    public Long getC11() {
        return c11;
    }

    public void setC11(Long c11) {
        this.c11 = c11;
    }

    public Long getC12() {
        return c12;
    }

    public void setC12(Long c12) {
        this.c12 = c12;
    }

    public Long getC13() {
        return c13;
    }

    public void setC13(Long c13) {
        this.c13 = c13;
    }

    public Long getC14() {
        return c14;
    }

    public void setC14(Long c14) {
        this.c14 = c14;
    }

    public Long getC15() {
        return c15;
    }

    public void setC15(Long c15) {
        this.c15 = c15;
    }

    public Long getBookInfoId() {
        return bookInfoId;
    }

    public void setBookInfoId(Long bookInfoId) {
        this.bookInfoId = bookInfoId;
    }
}