<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<thead>
    <tr>
        <th lay-data="{field:'orderNo', sort: true, fixed: true}">订单编号</th>
        <th lay-data="{field:'bookName', sort: true, fixed: true}">书名</th>
        <th lay-data="{field:'status', sort: true}">状态</th>
        <th lay-data="{field:'createTime', sort: true}">订单创建日期</th>
        <th lay-data="{fixed: 'right', align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
</thead>