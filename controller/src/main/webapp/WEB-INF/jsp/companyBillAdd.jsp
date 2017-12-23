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
                <legend>新增公司发票</legend>
            </fieldset>

            <div class="logo_box2">
                <form class="layui-form layui-form-pane" action="/5/51/addCompanyBill" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">发票类别</label>
                        <div class="layui-input-block">
                            <input name="type" value="个人发票" title="个人发票" type="radio" checked="">
                            <input name="type" value="单位发票" title="单位发票" type="radio"  >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">发票抬头</label>
                        <div class="layui-input-inline">
                            <input name="head" lay-verify="required" placeholder="请输入发票抬头" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证号</label>
                        <div class="layui-input-inline">
                            <input name="idCard" lay-verify="required" placeholder="请输入发票显示身份证号码" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input name="name" lay-verify="required" placeholder="请输入发票显示姓名" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单位</label>
                        <div class="layui-input-inline">
                            <input name="unit" lay-verify="required" placeholder="请输入发票显示单位" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">业务项目</label>
                        <div class="layui-input-inline">
                            <input name="project" lay-verify="required" placeholder="请输入业务项目" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图书编号</label>
                        <div class="layui-input-inline">
                            <input name="bookNo" lay-verify="required" placeholder="请输入客户参编图书编号" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">参编位置</label>
                        <div class="layui-input-inline">
                            <select name="position" lay-verify="required">
                                <option value="">请选择客户参编位置</option>
                                <option value="1" <c:if test="${user.roleId eq 1}">selected</c:if>>系统管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-inline">
                            <input name="phone" lay-verify="required" placeholder="请输入客户联系电话" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">客户姓名</label>
                        <div class="layui-input-inline">
                            <input name="customer" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">客户单位</label>
                        <div class="layui-input-inline">
                            <input name="customerUnit" lay-verify="required" placeholder="请输入客户单位名称" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">发票金额</label>
                        <div class="layui-input-inline">
                            <input name="amount" lay-verify="required" placeholder="请输入发票金额(单位：元)" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">交易信息</label>
                        <div class="layui-input-block">
                            <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">申请人:${currentUser.chinaName}</label>
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

//            //监听提交
//            form.on('submit(demo1)', function (data) {
//                layer.alert(JSON.stringify(data.field), {
//                    title: '最终的提交信息'
//                })
//                return false;
//            });


        });
        window.onload = function () {
            msg = "${msg}";
            if (msg != null && msg != "") {
                alert(msg)
            }
        }
    </script>
</div>
</body>
</html>