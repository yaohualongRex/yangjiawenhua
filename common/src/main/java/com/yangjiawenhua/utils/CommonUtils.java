package com.yangjiawenhua.utils;

import com.yjwh.crm.model.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {

    public static Cookie getCookieByName(String name, HttpServletRequest request) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equalsIgnoreCase(name))
                return cookie;
        }
        return null;
    }

    public static String getStringTime(Date date){
        if (date == null)
            date = new Date();
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }
    public static String getStringTime(){
        return getStringTime(null);
    }

    public static User getUser(HttpSession session) {
        return (User)session.getAttribute("currentUser");
    }

    public static String dateToStr(Date createTime) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd").format(createTime);
        }catch (Exception e){
            return "";
        }
    }
}
