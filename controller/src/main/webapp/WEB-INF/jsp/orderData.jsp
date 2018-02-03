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
    <div style="height: 20px"></div>
    <div align="center">
        <form class="layui-form" action="/4/updateOrder" method="post">
            <input name="id" type="hidden" value="${order.id}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">订单编号</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.orderNo}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户姓名</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.customName}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">图书编号</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.bookInfoId}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.phoneNo}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">参编位置</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.customPlace}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">单位名称</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${customer.unitName}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">正文字数</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.words}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户专业</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${customer.profession}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">订单金额</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${order.amount}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">下单日期</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${createTime}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">订单状态</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${status}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">合同日期</label>
                    <div class="layui-input-inline">
                        <c:if test='${order.status eq "2"}'>
                            <input name="contractSendDate" lay-verify="required" autocomplete="off" class="layui-input" type="text"
                                   id="date" placeholder="请选择合同发送日期"></c:if>
                        <c:if test='${order.status ne "2"}'>
                            <input autocomplete="off" class="layui-input" type="text" value="${sendDate}"
                                   disabled="disabled">
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label"><c:if test="${order.type eq 2}">第一次</c:if>回款金额</label>
                    <div class="layui-input-inline">
                        <c:if test='${order.status eq "3"}'>
                            <input name="returnAmount" lay-verify="required" autocomplete="off" placeholder="请输入<c:if test="${order.type eq 2}">第一次</c:if>回款金额"
                                   class="layui-input" type="text">
                        </c:if>
                        <c:if test='${order.status ne "3"}'>
                            <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                                   value="${order.returnAmount}">
                        </c:if>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label"><c:if test="${order.type eq 2}">第一次</c:if>回款日期</label>
                    <div class="layui-input-inline">
                        <c:if test='${order.status eq "3"}'>
                            <input name="returnDate" lay-verify="required" placeholder="请选择<c:if test="${order.type eq 2}">第一次</c:if>回款日期" id="date"
                                   autocomplete="off" class="layui-input" type="text">
                        </c:if>
                        <c:if test='${order.status ne "3"}'>
                            <input autocomplete="off" class="layui-input" type="text" value="${returnDate}"
                                   disabled="disabled">
                        </c:if>
                    </div>
                </div>
            </div>


            <c:if test="${order.type eq 2}">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">第二次回款金额</label>
                        <div class="layui-input-inline">
                            <c:if test='${order.status eq "5"}'>
                                <input name="secondReturnAmount" lay-verify="required" autocomplete="off" placeholder="请输入第二次回款金额"
                                       class="layui-input" type="text">
                            </c:if>
                            <c:if test='${order.status ne "5"}'>
                                <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                                       value="${order.secondReturnAmount}">
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">第二次回款日期</label>
                        <div class="layui-input-inline">
                            <c:if test='${order.status eq "5"}'>
                                <input name="secondReturnTime" lay-verify="required" placeholder="请选择第二次回款日期" id="date"
                                       autocomplete="off" class="layui-input" type="text">
                            </c:if>
                            <c:if test='${order.status ne "5"}'>
                                <input autocomplete="off" class="layui-input" type="text" value="${secondReturnDate}"
                                       disabled="disabled">
                            </c:if>
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">第三次回款金额</label>
                        <div class="layui-input-inline">
                            <c:if test='${order.status eq "6"}'>
                                <input name="thirdReturnAmount" lay-verify="required" autocomplete="off" placeholder="请输入第三次回款金额"
                                       class="layui-input" type="text">
                            </c:if>
                            <c:if test='${order.status ne "6"}'>
                                <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                                       value="${order.thirdReturnAmount}">
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">第三次回款日期</label>
                        <div class="layui-input-inline">
                            <c:if test='${order.status eq "6"}'>
                                <input name="thirdReturnTime" lay-verify="required" placeholder="请选择第三次回款日期" id="date"
                                       autocomplete="off" class="layui-input" type="text">
                            </c:if>
                            <c:if test='${order.status ne "6"}'>
                                <input autocomplete="off" class="layui-input" type="text" value="${thirdReturnDate}"
                                       disabled="disabled">
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>


            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">订单取消日期</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               <c:if test='${order.status eq "0"}'>value="${cancelDate}"</c:if>>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">销售员</label>
                    <div class="layui-input-inline">
                        <input autocomplete="off" class="layui-input" type="text" disabled="disabled"
                               value="${userName}">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <c:if test='${order.status eq "2"}'>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定合同发送</button>
                    </c:if>
                    <c:if test='${order.status eq "3"}'>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定<c:if test="${order.type eq 2}">第一次</c:if>回款(财政总监)</button>
                    </c:if>
                    <c:if test='${order.status eq "5"}'>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定第二次回款(财政总监)</button>
                    </c:if>
                    <c:if test='${order.status eq "6"}'>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定第三次回款(财政总监)</button>
                    </c:if>
                    <c:if test='${order.status eq "4" || order.status eq "7"}'>
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">确定完成(销售总监)</button>
                    </c:if>
                </div>
            </div>
        </form>
    </div>
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
            var url = '/4/updateOrder'
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
<script>
    function panduan() {
        var mima1 = document.getElementById("password").value
        //取出第一个文本框里输如的值密码一
        var mima2 = document.getElementById("password1").value
        //取出第二个文本框里输如的值密码二
        var mima3 = document.getElementById("password2").value
        if (mima1 == mima2) {
            //2个值比较，做判断
            layer.msg("新旧密码一样拉")
            //输出对话框提示
            document.getElementById("password1").focus()
            //焦点定位
            return false
        }
        if (mima2 != mima3) {
            layer.msg("密码和确认密码不同，请重新输入")
            //输出对话框提示
            document.getElementById("password1").focus()
            //焦点定位
            return false
        }
        return true
    };
</script>
</div>
</body>
</html>