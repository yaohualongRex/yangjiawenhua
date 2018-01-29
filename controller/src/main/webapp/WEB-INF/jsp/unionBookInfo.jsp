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

    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">图书基本信息</li>
            <li>参编位置信息</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="center">
                    <div>
                        <table>
                            <tr>
                                <th>图书编号：</th>
                                <td width="10px"></td>
                                <td>${book.id}</td>
                            </tr>
                            <tr>
                                <th>图书题目：</th>
                                <td width="10px">
                                <td>${book.bookName}</td>
                            </tr>
                            <tr>
                                <th>出版社：</th>
                                <td width="10px">
                                <td>${book.publicer}</td>
                            </tr>
                            <tr>
                                <th>出版日期：</th>
                                <td width="10px">
                                <td>${publicTime}</td>
                            </tr>
                            <tr>
                                <th>编委会：</th>
                                <td width="10px">
                                <td>${book.bwh}</td>
                            </tr>
                            <tr>
                                <th>装帧方式：</th>
                                <td width="10px">
                                <td>${book.fixType}</td>
                            </tr>
                            <tr>
                                <th>字数：</th>
                                <td width="10px">
                                <td>${book.words}</td>
                            </tr>
                            <tr>
                                <th>开本：</th>
                                <td width="10px">
                                <td>${book.size}</td>
                            </tr>
                            <tr>
                                <th>成品尺寸：</th>
                                <td width="10px">
                                <td>${book.productSize}</td>
                            </tr>
                            <tr>
                                <th>印刷册数：</th>
                                <td width="10px">
                                <td>${book.volumes}</td>
                            </tr>
                        </table>
                    </div>
                    <div style="height: 60px">
                    </div>
                    <div>
                        <table border="1">
                            <tr>
                                <th>主编位置</th>
                                <th style="width: 300px">简介</th>
                            </tr>
                            <tr>
                                <th>主编一：</th>
                                <td>${position.a1}</td>
                            </tr>
                            <tr>
                                <th>主编二：</th>
                                <td>${position.a2}</td>
                            </tr>
                            <tr>
                                <th>主编三：</th>
                                <td>${position.a3}</td>
                            </tr>
                            <tr>
                                <th>主编四：</th>
                                <td>${position.a4}</td>
                            </tr>
                            <tr>
                                <th>主编五：</th>
                                <td>${position.a5}</td>
                            </tr>
                            <tr>
                                <th>主编六：</th>
                                <td>${position.a6}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <table class="layui-table" lay-data="{height: 'full-100',  page: false, url:'/3/31/selectOrders?bookId=${bookId}', id:'idTest'}">
                    <thead>
                        <tr>
                            <th lay-data="{field:'position'}">位置信息</th>
                            <th lay-data="{field:'customerName'}">姓名</th>
                            <th lay-data="{field:'detail', }">详细信息</th>
                            <th lay-data="{field:'recommendInfo'}">推荐费信息</th>
                            <th lay-data="{field:'remark'}">备注</th>
                            <th lay-data="{field:'userName'}">销售员</th>
                            <th lay-data="{fixed: 'right',width:120, align:'center', toolbar: '#barDemo'}">操作</th>
                        </tr>
                    </thead>
                </table>


            </div>
        </div>
    </div>
</div>
<%-- start 工具栏 --%>
<script type="text/html" id="barDemo">
    {{#  if(d.customerName =='' || d.customerName == null){ }}
        <a id="{{d.orderId}}" href="" class="layui-btn layui-btn-xs" onclick='addOrder(this);return false'>添加新订单</a>
    {{#  } }}
</script>
<%-- end 工具栏 --%>
<script>
    function addOrder(obj) {
        layer.open({
            type: 2,
            title: '添加自费图书订单',
            shadeClose: true,
            shade: 0.8,
            offset: '50px',
            area: ['60%', '95%'],
            moveOut: true,
            content: '${hostIp}/4/orderAddJsp?orderInfo='+obj.id,
            end: function () {
                var table = layui.table;
                //执行重载
                table.reload('idTest', {
                });
//                var index = parent.layer.getFrameIndex(window.name);
//                parent.layer.close(index)
            }
        });
    }

    layui.use('table', function () {
        var table = layui.table;
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'add') {
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
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>
</body>
</html>
