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
                <legend>基本资料</legend>
            </fieldset>

            <div class="logo_box1">
                <form class="layui-form layui-form-pane" action="/1/11/updateUserData" method="post">
                	<div class="layui-form-item">
                        <label class="layui-form-label">员工编号</label>
                        <div class="layui-input-inline">
                            <B><input name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${currentUser.userNo}"
                                   class="layui-input" type="text" disabled="disabled"></B>
                                   <input name="id" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${currentUser.id}"
                                   class="layui-input" type="hidden">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工姓名</label>
                        <div class="layui-input-inline">
                            <B><input name="chinaName" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${currentUser.chinaName}"
                                   class="layui-input" type="text"></B>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工性别</label>
                        <div class="layui-input-block">
                            <input name="sex" value="1" title="男"  type="radio">
                            <input name="sex" value="2" title="女" type="radio">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">职位</label>
                        <div class="layui-input-inline">
                            <B><input name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${currentUser.roleName}"
                                   class="layui-input" type="text" disabled="disabled"></B>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属部门</label>
                        <div class="layui-input-inline">
                            <B><input name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" value="${currentUser.dtoId}"
                                   class="layui-input" type="text" disabled="disabled"></B>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">旧密码</label>
                        <div class="layui-input-inline">
                            <input name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" value=""
                                   class="layui-input" type="password">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-inline">
                            <input id="password1" name="password1" lay-verify="required" placeholder="请输入密码" autocomplete="off" value=""
                                   class="layui-input" type="password">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-inline">
                            <input id="password2" name="password2" lay-verify="required" placeholder="请输入密码" autocomplete="off" value=""
                                   class="layui-input" type="password">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>
                    
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="panduan()">立即提交</button>
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
    </script>
    <script>
	function panduan(){
		var mima1=document.getElementById("password1").value
		//取出第一个文本框里输如的值密码一
		var mima2=document.getElementById("password2").value
		//取出第二个文本框里输如的值密码二
		if(mima1==mima2){
			//2个值比较，做判断
			alert("2个密码一样拉")
			//输出对话框提示
			document.getElementById("mima1").focus()
			//焦点定位
		}else{
			//否则
			alert("密码和密码确认不同，请重新输入")
			//输出对话框提示
			document.getElementById("mima1").focus()
			//焦点定位
		}
	};
	</script>
</div>
</body>
</html>