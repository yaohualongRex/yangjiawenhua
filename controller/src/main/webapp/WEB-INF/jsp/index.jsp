<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>阳夏文化图书管理系统</title>
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
    <div style="padding: 15px;">
   <font size="4"><B> 雅卓图书系统管理规章制度</B></font>
   <br>
   <br>
   <br>
   <br>
（1）本人账号严禁转借（转让）其他人使用。<br>
（2）本人密码不得随意告知其他人。<br>
（3）本系统的网址不得随意告知公司以外的其他人。<br>
（4）本管理系统严禁在非公司电脑上登陆。<br>
（5）本管理系统严禁在办公室以外的环境登陆。<br>
（6）本管理系统内的所有文件、资料均属于公司机密，不准私自翻印、复制、摘录和
外传。<br>
（7）违反以上任何一条，视情节轻重，给予一定的行政和经济处罚，造成公司严重损
失的直接除名，并送相关机关处理。
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
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>
</html>