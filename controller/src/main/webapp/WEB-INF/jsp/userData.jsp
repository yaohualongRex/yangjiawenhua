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
    <div class="layui-header"  style="text-align:center">
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
            <div class="logo_box1">
            <form class="layui-form layui-form-pane" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">编号:</label>
    <div class="layui-input-inline">
      <input type="text" name="userNo" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${userdata.userNo }">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">姓名:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input"value="${userdata.chinaName }">
    </div>
  </div>
  <div class="layui-form-item" pane="">
    <label class="layui-form-label">性别:</label>
    <div class="layui-input-inline">
      <input type="radio" name="sex" value="男" title="男" checked="">
      <input type="radio" name="sex" value="女" title="女">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">职位:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${currentUser.roleName}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">部门:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${userdata.dtoId}">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">旧密码:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">新密码:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码:</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-inline">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
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