package com.yjwh.crm.enums;

public enum BookStatusEnum {
    NO_ORDER(0,"red","未订单"),
    IS_ORDER(1,"pink","已预订"),
    NO_MONEY(2,"blue","已订未回款"),
    FINISH(3,"green","订单完成");
    private int status;
    private String color;
    private String statusName;

    BookStatusEnum(int status, String color, String statusName) {
        this.status = status;
        this.color = color;
        this.statusName = statusName;
    }

    public static String getColor(int status){
        for (BookStatusEnum statusEnum : BookStatusEnum.values()) {
            if (status == statusEnum.getStatus())
                return statusEnum.getColor();
        }
        return "";
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
