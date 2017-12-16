package com.yangjiawenhua.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CommonUtils {

    public static Cookie getCookieByName(String name, HttpServletRequest request) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equalsIgnoreCase(name))
                return cookie;
        }
        return null;
    }
}
