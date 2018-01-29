package com.yjwh.crm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name = "book_info")
public class BookInfo {
	@Id
	@Column(name = "id")
    private Long id;
	@Column(name = "book_name")
    private String bookName;
	@Column(name = "publicer")
    private String publicer;
	@Column(name = "public_time")
    private Date publicTime;
	@Column(name = "bwh")
    private String bwh;
	@Column(name = "fix_type")
    private String fixType;
	@Column(name = "words")
    private String words;
	@Column(name = "size")
    private String size;
	@Column(name = "product_size")
    private String productSize;
	@Column(name = "volumes")
    private String volumes;

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

    public String getPublicer() {
        return publicer;
    }

    public void setPublicer(String publicer) {
        this.publicer = publicer == null ? null : publicer.trim();
    }

    public Date getPublicTime() {
        return publicTime;
    }

    public void setPublicTime(Date publicTime) {
        this.publicTime = publicTime;
    }

    public String getBwh() {
        return bwh;
    }

    public void setBwh(String bwh) {
        this.bwh = bwh;
    }

    public String getFixType() {
        return fixType;
    }

    public void setFixType(String fixType) {
        this.fixType = fixType;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words == null ? null : words.trim();
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize == null ? null : productSize.trim();
    }

    public String getVolumes() {
        return volumes;
    }

    public void setVolumes(String volumes) {
        this.volumes = volumes == null ? null : volumes.trim();
    }
}