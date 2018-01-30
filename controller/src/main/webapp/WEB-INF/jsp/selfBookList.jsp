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
            <legend>自费图书管理</legend>
        </fieldset>
        <div style="margin-bottom: 5px;">
            <!-- 示例-970 -->
            <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px"
                 data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
        </div>

        <div class="layui-btn-group demoTable">
            <%@include file="0buttons.jsp" %>
        </div>

        <table class="layui-table"
               lay-data="{ url:'/3/32/selectSelfBook', page:true, id:'idTest'}"
               lay-filter="demo">
            <thead>
            <tr>
                <th lay-data="{type:'checkbox', fixed: 'left'}" ></th>
                <th lay-data="{field:'bookName',  sort: true, fixed: true, templet: '#bookName'}"  >书名</th>
                <th lay-data="{field:'publicTime', sort: true}" >出版日期</th>
                <th lay-data="{field:'publicer'}" >出版社</th>
                <th lay-data="{align:'center', toolbar: '#barDemo'}" rowspan="2">订单详情</th>
                <th lay-data="{field:'status'}">图书状态</th>
            </tr>
            </thead>
        </table>

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
            area: ['50%', '90%'],
            moveOut: true,
            content: '${hostIp}/3/31/selectUnionBookInfo?bookId='+obj,
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
                    content: '${hostIp}/3/bookAddJsp?bookType=2',
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