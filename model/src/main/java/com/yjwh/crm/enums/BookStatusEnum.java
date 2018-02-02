package com.yjwh.crm.enums;

public enum BookStatusEnum {

    NO_ORDER(0,"<font color='red'><b>×</b></font>","未订单"),
    IS_ORDER(1,"<font color='pink'><b>■</b></font>","已预订"),
    NO_MONEY(2,"<font color='blue'><b>●</b></font>","已订未回款"),
    FINISH(3,"<font color='green'><b>√</b></font>","订单完成"),

    // 自费图书状态
    FIRST_RETURN(4,"","已确认第一次回款"),
    SECOND_RETURN(5,"","已确认第二次回款"),
    THIRD_RETURN(6,"","已确认第三次回款")
    ;
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

    public static String getNameOfStatus(String status) {
        for (BookStatusEnum bookStatusEnum : BookStatusEnum.values()) {
            if (Integer.valueOf(status).equals(bookStatusEnum.getStatus()))
                return  bookStatusEnum.getStatusName();
        }
        return "";
    }
}
