<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<option value="">请选择用户角色</option>
<option value="1" <c:if test="${user.roleId eq 1}">selected</c:if>>总经理</option>
<option value="2" <c:if test="${user.roleId eq 2}">selected</c:if>>财务总监</option>
<option value="3" <c:if test="${user.roleId eq 3}">selected</c:if>>编辑总监</option>
<option value="4" <c:if test="${user.roleId eq 4}">selected</c:if>>档案管理员</option>
<option value="5" <c:if test="${user.roleId eq 5}">selected</c:if>>编辑员</option>
<option value="8" <c:if test="${user.roleId eq 8}">selected</c:if>>销售总监</option>
<option value="6" <c:if test="${user.roleId eq 6}">selected</c:if>>销售一部经理</option>
<option value="7" <c:if test="${user.roleId eq 7}">selected</c:if>>销售一部销售</option>
<option value="9" <c:if test="${user.roleId eq 9}">selected</c:if>>销售二部经理</option>
<option value="10" <c:if test="${user.roleId eq 10}">selected</c:if>>销售二部销售</option>
<option value="11" <c:if test="${user.roleId eq 11}">selected</c:if>>销售三部经理</option>
<option value="12" <c:if test="${user.roleId eq 12}">selected</c:if>>销售三部销售</option>
<option value="13" <c:if test="${user.roleId eq 13}">selected</c:if>>销售四部经理</option>
<option value="14" <c:if test="${user.roleId eq 14}">selected</c:if>>销售四部销售</option>
<option value="15" <c:if test="${user.roleId eq 15}">selected</c:if>>销售五部经理</option>
<option value="16" <c:if test="${user.roleId eq 16}">selected</c:if>>销售五部销售</option>