package com.yjwh.crm.po;

import com.yjwh.crm.model.BookInfo;

public class BookInfoPo extends BookInfo{
    private Integer bookType;

    public Integer getBookType() {
        return bookType;
    }

    public void setBookType(Integer bookType) {
        this.bookType = bookType;
    }
}
