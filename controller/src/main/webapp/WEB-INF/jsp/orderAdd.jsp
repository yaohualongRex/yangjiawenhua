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
<body>

<!-- start 内容主体区域 -->
<div class="center">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>订单信息录入</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="">
        <%-- 隐藏内容 --%>
        <input name="type" type="hidden" value="${model.type}">
        <input name="bookId" type="hidden" value="${model.bookId}">
        <input name="placeField" type="hidden" value="${model.placeField}">

        <div class="layui-form-item">
            <label class="layui-form-label">客户电话</label>
            <div class="layui-input-inline">
                <input name="phoneNo" lay-verify="required" placeholder="请输入客户联系电话" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户姓名</label>
            <div class="layui-input-inline">
                <input name="customName" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off" class="layui-input" type="text">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单书籍</label>
            <div class="layui-input-inline">
                <input name="bookName" lay-verify="required" autocomplete="off" class="layui-input" type="text" disabled="disabled" value="${model.bookName}">
            </div>
        </div>
        <c:if test="${model.type eq 1}">
            <div class="layui-form-item">
                <label class="layui-form-label">参编位置</label>
                <div class="layui-input-inline">
                    <input name="customPlace" lay-verify="required"  autocomplete="off" class="layui-input" type="text" disabled="disabled" value="${model.customPlace}">
                </div>
            </div>
        </c:if>
        <div class="layui-form-item">
            <label class="layui-form-label">订单金额</label>
            <div class="layui-input-inline">
                <input name="amount" lay-verify="required" placeholder="请输入订单金额" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">字数要求</label>
            <div class="layui-input-inline">
                <input name="words" lay-verify="required" placeholder="请输入字数要求" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">订单备注</label>
            <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入备注内容" class="layui-textarea"></textarea>
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
            var url = '/4/addOrder'
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