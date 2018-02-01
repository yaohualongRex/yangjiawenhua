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
            <legend>合作图书管理</legend>
        </fieldset>

        <div class="layui-btn-group demoTable">
            <%@include file="0buttons.jsp" %>
        </div>

        <table class="layui-table"
               lay-data="{height: 'full-200', url:'/3/31/selectUnionBook',cellMinWidth: 20, page:true, id:'idTest'}"
               lay-filter="demo">
            <thead>
            <tr>
                <th lay-data="{type:'checkbox', fixed: 'left'}" rowspan="2"></th>
                <th lay-data="{field:'bookName',width: 107,  sort: true, fixed: true, templet: '#bookName'}" rowspan="2" >书名</th>
                <th lay-data="{field:'publicTime',width: 107, sort: true}" rowspan="2">出版日期</th>
                <th lay-data="{align:'center'}" colspan="6">主编</th>
                <th lay-data="{align:'center'}" colspan="8">副主编</th>
                <th lay-data="{align:'center'}" colspan="15">参编</th>
                <th lay-data="{fixed: 'right',width: 167, align:'center', toolbar: '#barDemo'}" rowspan="2">操作</th>
            </tr>
            <tr>
                <th lay-data="{field:'a1s', sort: false}">1</th>
                <th lay-data="{field:'a2s', sort: false}">2</th>
                <th lay-data="{field:'a3s', sort: false}">3</th>
                <th lay-data="{field:'a4s', sort: false}">4</th>
                <th lay-data="{field:'a5s', sort: false}">5</th>
                <th lay-data="{field:'a6s', sort: false}">6</th>

                <th lay-data="{field:'b1s', sort: false}">1</th>
                <th lay-data="{field:'b2s', sort: false}">2</th>
                <th lay-data="{field:'b3s', sort: false}">3</th>
                <th lay-data="{field:'b4s', sort: false}">4</th>
                <th lay-data="{field:'b5s', sort: false}">5</th>
                <th lay-data="{field:'b6s', sort: false}">6</th>
                <th lay-data="{field:'b7s', sort: false}">7</th>
                <th lay-data="{field:'b8s', sort: false}">8</th>

                <th lay-data="{field:'c1s', sort: false}">1</th>
                <th lay-data="{field:'c2s', sort: false}">2</th>
                <th lay-data="{field:'c3s', sort: false}">3</th>
                <th lay-data="{field:'c4s', sort: false}">4</th>
                <th lay-data="{field:'c5s', sort: false}">5</th>
                <th lay-data="{field:'c6s', sort: false}">6</th>
                <th lay-data="{field:'c7s', sort: false}">7</th>
                <th lay-data="{field:'c8s', sort: false}">8</th>
                <th lay-data="{field:'c9s', sort: false}">9</th>
                <th lay-data="{field:'c10s', sort: false}">10</th>
                <th lay-data="{field:'c11s', sort: false}">11</th>
                <th lay-data="{field:'c12s', sort: false}">12</th>
                <th lay-data="{field:'c13s', sort: false}">13</th>
                <th lay-data="{field:'c14s', sort: false}">14</th>
                <th lay-data="{field:'c15s', sort: false}">15</th>
            </tr>
            </thead>
        </table>

    </div>

    <!-- <div class="layui-footer">
        © yangjiawenhua.com - 底部固定区域
    </div> -->
</div>
<%-- start 工具栏 --%>
<script type="text/html" id="bookName">
    <a href="" class="layui-table-link" target="_blank" onclick="info({{d.id}});return false">{{ d.bookName }}</a>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
</script>
<%-- end 工具栏 --%>
<script>
    function info(obj) {
        layer.open({
            type: 2,
            title: '合作图书信息',
            shadeClose: true,
            shade: 0.8,
            offset: '50px',
            area: ['80%', '95%'],
            moveOut: true,
            content: '${hostIp}/3/31/selectUnionBookInfo?bookId='+obj
        });
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
                layer.msg('ID：' + data.id + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
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
            add: function () { //获取选中数据
                layer.open({
                    type: 2,
                    title: '添加合作图书',
                    shadeClose: true,
                    shade: 0.8,
                    offset: '50px',
                    area: ['50%', '90%'],
                    moveOut: true,
                    content: '${hostIp}/3/bookAddJsp?bookType=1',
                    end: function () {
                        location.reload();
                    }
                });
            }
            , update: function () { //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                if(data.length != 1)
                    layer.msg('请选中一条数据');
                else{
                    layer.open({
                        type: 2,
                        title: '编辑自费图书',
                        shadeClose: true,
                        shade: 0.8,
                        offset: '50px',
                        area: ['50%', '90%'],
                        moveOut: true,
                        content: '${hostIp}/3/32/userUpdateJsp?id='+data[0].id,
                        end: function () {
                            location.reload();
                        }
                    });
                }
            }
            , delete: function () {
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                if(data.length == 0)
                    layer.msg('请选中至少一条数据');
                else{
                    layer.confirm('真的删除这些用户么么', function (index) {
                        var url = '/1/11/deleteUser'
                        var ids = '';
                        for (i=0;i<data.length;i++){
                            ids+=data[i].id+","
                        }
                        ids = ids.substr(0,ids.length-1)
                        window.location.href=url+'?ids='+ids
                    });
                }

            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>
</body>
</html>