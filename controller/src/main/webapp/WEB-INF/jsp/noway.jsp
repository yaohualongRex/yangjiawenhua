<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局 - Layui</title>
  <link rel="stylesheet" href="../../css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"><font size="4"><B>阳夏文化图书管理系统</B></font></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
     
      <li class="layui-nav-item">欢迎您,<B>XXX</B>进入阳夏图书管理系统!您当前所在用户组:<B>XXX</B></li>
      <!-- <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li> -->
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      	<li class="layui-nav-item layui-nav-itemed"><a href="">公告栏</a></li>
        <li class="layui-nav-item">
          <a class="" href="javascript:;">系统管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">用户资料管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">客户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">客户信息查询</a></dd>
            <dd><a href="javascript:;">客户信息录入</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">图书管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">合作图书管理</a></dd>
            <dd><a href="javascript:;">自费图书管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">订单管理</a></li>
        <li class="layui-nav-item"><a href="">发票管理</a></li>
        <li class="layui-nav-item"><a href="">推荐费管理</a></li>
        <li class="layui-nav-item"><a href="">日志查询</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">内容主体区域</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="../../layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>
</html>