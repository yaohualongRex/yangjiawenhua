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
	@Column(name = "create_time")
    private Date createTime;
	@Column(name = "eb")
    private String eb;
	@Column(name = "type")
    private String type;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getEb() {
        return eb;
    }

    public void setEb(String eb) {
        this.eb = eb == null ? null : eb.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
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