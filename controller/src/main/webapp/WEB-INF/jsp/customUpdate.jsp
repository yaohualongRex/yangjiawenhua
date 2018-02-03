<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="0base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>阳夏文化图书管理系统</title>
</head>
<body>
	<!-- start 内容主体区域 -->
	<div class="center">

		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>客户信息编辑</legend>
		</fieldset>

		<form class="layui-form layui-form-pane" action="/2/22/updateCustom"
			method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">客户姓名</label>
				<div class="layui-input-inline">
					<B><input name="chinaName" lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input"
						value="${custom.chinaName}" type="text"></B>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户联系电话</label>
				<div class="layui-input-inline">
					<B><input name="phoneNo" lay-verify="required"
						placeholder="请输入客户联系电话" autocomplete="off" class="layui-input"
						value="${custom.phoneNo}" type="text"></B>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户单位名称</label>
				<div class="layui-input-inline">
					<B><input name="unitName" lay-verify="required"
						placeholder="请输入客户单位名称" autocomplete="off" class="layui-input"
						value="${custom.unitName}" type="text"></B>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户专业</label>
				<div class="layui-input-inline">
					<B><input name="profession" lay-verify="required"
						placeholder="请输入客户专业" autocomplete="off" class="layui-input"
						value="${custom.profession}" type="text"></B>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">业务负责人</label>
				<div class="layui-input-inline">
					<B><input name="userChinaName" lay-verify="required"
						autocomplete="off"
						value="${custom.userChinaName}" class="layui-input" type="text"
						disabled="disabled"></B> <input name="userId"
						lay-verify="required" placeholder="请输入用户名" autocomplete="off"
						value="${custom.userId}" class="layui-input" type="hidden">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>