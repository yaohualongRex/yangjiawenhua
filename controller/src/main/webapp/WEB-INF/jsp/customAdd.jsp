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
    <!-- start 头部区域 -->
    <div class="layui-header">
        <%@include file="0top.jsp" %>
    </div>
    <!-- end 头部区域 -->

    <!-- start 左侧导航区域 -->
    <div class="layui-side layui-bg-black">
        <%@include file="0left.jsp" %>
    </div>
    <!-- end 左侧导航区域 -->

    <!-- start 内容主体区域 -->
    <div class="layui-body">

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>客户信息录入</legend>
        </fieldset>

        <div class="logo_box1">
            <form class="layui-form layui-form-pane" action="/2/21/addCustom" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">客户姓名</label>
                    <div class="layui-input-inline">
                        <B><input name="chinaName" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                  class="layui-input" type="text"></B>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">客户联系电话</label>
                    <div class="layui-input-inline">
                        <B><input name="phoneNo" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                  class="layui-input" type="text"></B>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">客户单位名称</label>
                    <div class="layui-input-inline">
                        <B><input name="unitName" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                  class="layui-input" type="text"></B>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">客户专业</label>
                    <div class="layui-input-inline">
                        <B><input name="profession" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                  class="layui-input" type="text" disabled="disabled"></B>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">业务负责人</label>
                    <div class="layui-input-inline">
                        <B><input name="userChinaName" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                                  value="${currentUser.chinaName}"
                                  class="layui-input" type="text" disabled="disabled"></B>
                        <input name="userId" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                               value="${currentUser.id}"
                               class="layui-input" type="hidden">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
            </form>
        </div>

    </div>

    <div class="layui-footer">
        © yangjiawenhua.com - 底部固定区域
    </div>
</div>
</div>
</body>
</html>