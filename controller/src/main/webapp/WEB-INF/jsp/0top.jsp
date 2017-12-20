<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="0base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 头部区域（可配合layui已有的水平导航） -->
<ul class="layui-nav layui-layout-left">

	<li class="layui-nav-item">欢迎您,<B>${session.user.chinaName}</B>进入阳夏图书管理系统!您当前所在用户组:<B>${session.user.roleName}</B></li>
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
	<li class="layui-nav-item"><a href="javascript:;"> <img
			src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${session.user.chinaName}
	</a>
		<dl class="layui-nav-child">
			<dd>
				<a href="1/11/userData?id=${currentUser.id}">基本资料</a>
			</dd>
		</dl></li>
	<li class="layui-nav-item"><a href="1/11/loginOut">退了</a></li>
</ul>
</div>


