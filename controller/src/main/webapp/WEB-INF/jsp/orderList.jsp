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
    <!-- start 头部区域 -->
    <div class="layui-header">
        <%@include file="0top.jsp" %>
    </div>
    <!-- end 头部区域 -->

    <!-- start 左侧导航区域 -->
    <div class="layui-side layui-bg-black">
        <%@include file="0left.jsp" %>
    </div>
    <!-- end 左侧导航区域 -->

    <!-- start 内容主体区域 -->
    <div class="layui-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>${typeName}订单管理</legend>
        </fieldset>
        <div style="margin-bottom: 5px;">
            <!-- 示例-970 -->
            <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px"
                 data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
        </div>

        <div class="layui-btn-group demoTable">
            <%@include file="0buttons.jsp" %>
        </div>

        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">已完成订单</li>
                <li>未完成订单</li>
                <li>已取消订单</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <table class="layui-table"
                           lay-data="{url:'/4/${type}/selectFinishOrder', page:true, id:'idTest1'}"
                           lay-filter="demo">
                        <%@include file="orderFields.jsp" %>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <table class="layui-table"
                           lay-data="{url:'/4/${type}/selectActiveOrder', page:true, id:'idTest2'}"
                           lay-filter="demo">
                        <%@include file="orderFields.jsp" %>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <table class="layui-table"
                           lay-data="{url:'/4/${type}/selectCancelOrder', page:true, id:'idTest3'}"
                           lay-filter="demo">
                        <%@include file="orderFields.jsp" %>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <div class="layui-footer">
        © yangjiawenhua.com - 底部固定区域
    </div>
</div>
<%-- start 工具栏 --%>
<script type="text/html" id="bookName">
    <a href="" class="layui-table-link" target="_blank" onclick="info({{d.id}});return false">{{ d.bookName }}</a>
</script>
<script type="text/html" id="barDemo">
    {{#  if(d.status != '订单结束' && d.status != '订单取消'){ }}
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">状态修改</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">编辑订单</a>
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">取消订单</a>
    {{#  } }}
</script>
<%-- end 工具栏 --%>
<script>
    function callbackInfoAndFlush(obj) {
        callbackInfo(obj)
        flushall()
    }

    layui.use('table', function () {
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.open({
                    type: 2,
                    title: '展示详情',
                    shadeClose: true,
                    shade: 0.8,
                    offset: '50px',
                    area: ['50%', '90%'],
                    moveOut: true,
                    content: '${hostIp}/4/orderDataJsp?orderId=' + data.id,
                    end: flushall
                });
            } else if (obj.event === 'del') {
                layer.confirm('真的取消订单么？', function (index) {
                    $.ajax({
                        type: 'POST',
                        contentType: "application/json",
                        url: "/4/cancelOrder?id=" + data.id,
                        success: callbackInfoAndFlush,
                        error: callbackError
                    });
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    title: '展示详情',
                    shadeClose: true,
                    shade: 0.8,
                    offset: '50px',
                    area: ['50%', '90%'],
                    moveOut: true,
                    content: '${hostIp}/'
                });
            }
        });

        var $ = layui.$, active = {
            select: function () {
                flushall()
            },
            add: function () { //获取选中数据
//                var checkStatus = table.checkStatus('idTest')
//                    , data = checkStatus.data;
//                layer.alert(JSON.stringify(data));
                layer.open({
                    type: 2,
                    title: '添加自费图书',
                    shadeClose: true,
                    shade: 0.8,
                    offset: '50px',
                    area: ['50%', '90%'],
                    moveOut: true,
                    content: '${hostIp}/3/32/selfBookAddJsp',
                    end: function () {
                        location.reload();
                    }
                });
            }
            , update: function () { //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                if (data.length != 1)
                    layer.msg('请选中一条数据');
                else {
                    layer.open({
                        type: 2,
                        title: '编辑自费图书',
                        shadeClose: true,
                        shade: 0.8,
                        offset: '50px',
                        area: ['50%', '90%'],
                        moveOut: true,
                        content: '${hostIp}/3/32/userUpdateJsp?id=' + data[0].id,
                        end: function () {
                            location.reload();
                        }
                    });
                }
            }
            , delete: function () {
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                if (data.length == 0)
                    layer.msg('请选中至少一条数据');
                else {
                    layer.confirm('真的删除这些用户么么', function (index) {
                        var url = '/1/11/deleteUser'
                        var ids = '';
                        for (i = 0; i < data.length; i++) {
                            ids += data[i].id + ","
                        }
                        ids = ids.substr(0, ids.length - 1)
                        window.location.href = url + '?ids=' + ids
                    });
                }

            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    function flushall(data) {
        var table = layui.table;
        //执行重载
        table.reload('idTest1', {
            where: { //设定异步数据接口的额外参数，任意设
                aaaaaa: 'xxx'
                , bbb: 'yyy'
                //…
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
        //执行重载
        table.reload('idTest2', {
            where: { //设定异步数据接口的额外参数，任意设
                aaaaaa: 'xxx'
                , bbb: 'yyy'
                //…
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
        //执行重载
        table.reload('idTest3', {
            where: { //设定异步数据接口的额外参数，任意设
                aaaaaa: 'xxx'
                , bbb: 'yyy'
                //…
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    }
</script>
</body>
</html>