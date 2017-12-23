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
                <legend>客户信息查询</legend>
            </fieldset>
			<div style="margin-bottom: 5px;">          
				<!-- 示例-970 -->
				<ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>
			</div>
			 
			<div class="layui-btn-group demoTable">
			  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
			  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
			  <button class="layui-btn" data-type="isAll">验证是否全选</button>
			</div>
			
			<table class="layui-table" lay-data="{width: 1150, height:332, url:'/5/51/selectCompanyBill', page:true, id:'idTest'}" lay-filter="demo">
			  <thead>
			    <tr>
			        <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
			        <th lay-data="{field:'type', width:100, sort: true, fixed: true}">发票类型</th>
			        <th lay-data="{field:'head', width:210, sort: true}">发票抬头</th>
			        <th lay-data="{field:'unit'}">单位名称</th>
			        <th lay-data="{field:'project', width:120}">业务项目</th>
                    <th lay-data="{field:'amount', width:100}">发票金额</th>
                    <th lay-data="{field:'userName', width:80}">申请人</th>
                    <th lay-data="{field:'createTime', width:110}">申请日期</th>
                    <th lay-data="{field:'status', width:80}">状态</th>
			        <th lay-data="{fixed: 'right',width:120, align:'center', toolbar: '#barDemo'}">操作</th>
			    </tr>
			  </thead>
			</table>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © yangjiawenhua.com - 底部固定区域
        </div>
    </div>
    <script src="../../layui.js"></script>
    <script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-xs" lay-event="detail">详情</a>
        {{#  if(d.status == "待审核"){ }}
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">修改</a>
        {{#  } }}

	</script>
               
          
<script src="../../layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use('table', function(){
	  var table = layui.table;
	  //监听表格复选框选择
	  table.on('checkbox(demo)', function(obj){
	    console.log(obj)
	  });
	  //监听工具条
	  table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'detail'){
	      layer.msg('ID：'+ data.id + ' 的查看操作');
	    } else if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        obj.del();
	        layer.close(index);
	      });
	    } else if(obj.event === 'edit'){
	      layer.alert('编辑行：<br>'+ JSON.stringify(data))
	    }
	  });
	  
	  var $ = layui.$, active = {
	    getCheckData: function(){ //获取选中数据
	      var checkStatus = table.checkStatus('idTest')
	      ,data = checkStatus.data;
	      layer.alert(JSON.stringify(data));
	    }
	    ,getCheckLength: function(){ //获取选中数目
	      var checkStatus = table.checkStatus('idTest')
	      ,data = checkStatus.data;
	      layer.msg('选中了：'+ data.length + ' 个');
	    }
	    ,isAll: function(){ //验证是否全选
	      var checkStatus = table.checkStatus('idTest');
	      layer.msg(checkStatus.isAll ? '全选': '未全选')
	    }
	  };
	  
	  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});
</script>
</div>
</body>
</html>