package com.yjwh.crm.po;

import com.yjwh.crm.model.Order;

public class OrderVo extends Order{
    private String placeField;

    public String getPlaceField() {
        return placeField;
    }

    public void setPlaceField(String placeField) {
        this.placeField = placeField;
    }
}
