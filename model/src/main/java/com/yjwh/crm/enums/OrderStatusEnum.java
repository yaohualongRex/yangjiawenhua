package com.yjwh.crm.enums;

public enum OrderStatusEnum {
    CANCEL("0","订单取消"),
    FINISH("1","订单结束"),

    PRE_VERSION("2","订单创建（预订单）"),
    CONTRACT_SEND("3","订单合同已发送"),

    // 合作图书状态
    RETURN("4","已回款，财务总监确认"),

    // 自费图书状态
    FIRST_RETURN("5","财务总监确认第一次已回款"),
    SECOND_RETURN("6","财务总监确认第二次已回款"),
    THIRD_RETURN("7","财务总监确认第三次已回款"),
    ;

    private String status;
    private String statusName;

    OrderStatusEnum(String status, String statusName) {
        this.status = status;
        this.statusName = statusName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public static String getStatusNameByStatus(String status) {
        for (OrderStatusEnum enumn : OrderStatusEnum.values()) {
            if (enumn.getStatus().equals(status))
                return enumn.getStatusName();
        }
        return "";
    }
}
