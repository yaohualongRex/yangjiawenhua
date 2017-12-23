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

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>新增员工</legend>
            </fieldset>

            <div class="logo_box1">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${user.username}"
                                   class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" value="${user.password}"
                                   class="layui-input" type="password">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input name="chinaName" lay-verify="required" placeholder="请输入姓名" autocomplete="off" value="${user.chinaName}"
                                   class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户角色</label>
                        <div class="layui-input-inline">
                            <select name="roleId" lay-verify="required">
                                <option value="">请选择用户角色</option>
                                <option value="1" <c:if test="${user.roleId eq 1}">selected</c:if>>系统管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input name="sex" value="男" title="男" type="radio" <c:if test='${user.sex eq "男" || user.sex eq "" || user.sex eq null}'>checked=""</c:if> >
                            <input name="sex" value="女" title="女" type="radio" <c:if test='${user.sex eq "女" }'>checked=""</c:if> >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工编号</label>
                        <div class="layui-input-inline">
                            <input name="userNo" lay-verify="required" placeholder="请输入员工编号" autocomplete="off" value="${user.userNo}"
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
                    contentType:"application/json",
                    url: url,
                    data: json,
                    success: callback
                });
                return false;
            });
        });
        function callback(data) {
            if (data != ""){
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.msg(data);
                });
            }
        }
    </script>
</div>
</body>
</html>