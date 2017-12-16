<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="0base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${!empty buttons}">
	<div class="layui-btn-group">
		<c:forEach items="${buttons}" var="button">
			<button class="layui-btn">${button.privilegeName}</button>
		</c:forEach>
	</div>
</c:if>


