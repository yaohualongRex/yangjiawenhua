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
<body >

<!-- start 内容主体区域 -->
<div class="center">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>新增用户</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input" type="password">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input name="chinaName" lay-verify="required" placeholder="请输入姓名" autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input name="sex" value="男" title="男" type="radio" checked>
                <input name="sex" value="女" title="女" type="radio">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户角色</label>
            <div class="layui-input-inline">
                <select name="roleId" lay-verify="required">
                    <%@include file="0privilege.jsp" %>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属部门</label>
            <div class="layui-input-inline">
                <div class="layui-input-inline">
                <input name="dtoId" lay-verify="required" placeholder="请输入员工部门" autocomplete="off"
                       class="layui-input" type="text">
            </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工编号</label>
            <div class="layui-input-inline">
                <input name="userNo" lay-verify="required" placeholder="请输入员工编号" autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            var url = '/1/11/addUser'
            var json = JSON.stringify(data.field);
            $.ajax({
                type: 'POST',
                contentType: "application/json",
                url: url,
                data: json,
                success: callbackOpen,
                error: callbackError
            });
            return false;
        });
    });
</script>
</div>
</body>
</html>