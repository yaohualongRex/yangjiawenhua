<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="0base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>阳夏文化图书管理系统</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <font size="4"><B>阳夏文化图书管理系统</B></font>
        </div>
        <%@include file="0top.jsp" %>

        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed"><a href="">公告栏</a></li>
                    <%@include file="0left.jsp" %>
                </ul>
            </div>
        </div>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">
                <font size="4"><B> 雅卓图书系统管理规章制度</B></font> <br> <br> <br>
                <%@include file="0buttons.jsp" %>
                <br> （1）本人账号严禁转借（转让）其他人使用。<br> （2）本人密码不得随意告知其他人。<br>
                （3）本系统的网址不得随意告知公司以外的其他人。<br> （4）本管理系统严禁在非公司电脑上登陆。<br>
                （5）本管理系统严禁在办公室以外的环境登陆。<br>
                （6）本管理系统内的所有文件、资料均属于公司机密，不准私自翻印、复制、摘录和 外传。<br>
                （7）违反以上任何一条，视情节轻重，给予一定的行政和经济处罚，造成公司严重损 失的直接除名，并送相关机关处理。
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © yangjiawenhua.com - 底部固定区域
        </div>
    </div>
    <script src="../../layui.js"></script>
    <script>
        //JavaScript代码区域
        layui.use('element', function () {
            var element = layui.element;

        });
    </script>
</body>
</html>
</html>