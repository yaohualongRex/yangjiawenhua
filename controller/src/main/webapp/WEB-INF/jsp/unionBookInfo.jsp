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
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">图书基本信息</li>
        <li>参编位置信息</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>图书基本信息</legend>
            </fieldset>
            <div class="center">
                <div>
                    <table>
                        <tr><th>图书编号：</th>
                            <td></td></tr>
                        <tr><th>图书题目：</th>
                            <td></td></tr>
                        <tr><th>出版社：</th>
                            <td></td></tr>
                        <tr><th>出版日期：</th>
                            <td></td></tr>
                        <tr><th>编委会：</th>
                            <td></td></tr>
                        <tr><th>装帧方式：</th>
                            <td></td></tr>
                        <tr><th>字数：</th>
                            <td></td></tr>
                        <tr><th>开本：</th>
                            <td></td></tr>
                        <tr><th>成品尺寸：</th>
                            <td></td></tr>
                        <tr><th>印刷册数：</th>
                            <td></td></tr>
                    </table>
                </div>
                <div style="height: 60px">
                </div>
                <div>
                    <table border="1" >
                        <tr><th>主编位置</th><th style="width: 300px">简介</th></tr>
                        <tr><th>主编一：</th>
                            <td></td></tr>
                        <tr><th>主编二：</th>
                            <td></td></tr>
                        <tr><th>主编三：</th>
                            <td></td></tr>
                        <tr><th>主编四：</th><td></td></tr>
                        <tr><th>主编五：</th><td></td></tr>
                        <tr><th>主编六：</th><td></td></tr>
                    </table>
                </div>
            </div>

        </div>
        <div class="layui-tab-item">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>参编位置信息</legend>
            </fieldset>
            <table class="layui-table"
                   lay-data="{url:'/3/31/selectOrders?bookId=${book.id}', page:true, id:'idTest'}"
                   lay-filter="demo">
                <thead>
                <tr>
                    <th lay-data="{field:'userNo', width:200, sort: true, fixed: true}">位置信息</th>
                    <th lay-data="{field:'username', width:200, sort: true}">姓名</th>
                    <th lay-data="{field:'chinaName', width:200, sort: true}">详细信息</th>
                    <th lay-data="{field:'position', width:200}">推荐费信息</th>
                    <th lay-data="{field:'sex'}">备注</th>
                    <th lay-data="{field:'sex'}">销售员</th>
                    <th lay-data="{fixed: 'right',width:120, align:'center', toolbar: '#barDemo'}">操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
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