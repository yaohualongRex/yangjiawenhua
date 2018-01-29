package com.yjwh.crm.po;

public class OrderPo {
    private Long bookId;
    private Integer type;//1合作，2自费
    private String customPlace;//参编位置
    private String placeField;
    private String bookName;

    public String getPlaceField() {
        return placeField;
    }

    public void setPlaceField(String placeField) {
        this.placeField = placeField;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getCustomPlace() {
        return customPlace;
    }

    public void setCustomPlace(String customPlace) {
        this.customPlace = customPlace;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
}
