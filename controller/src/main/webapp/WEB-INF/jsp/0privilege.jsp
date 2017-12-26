<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<option value="">请选择用户角色</option>
<option value="1" <c:if test="${user.roleId eq 1}">selected</c:if>>系统管理员</option>

