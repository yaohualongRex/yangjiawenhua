<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach items="${accesses}" var="access">
	<c:choose>
		<c:when test="${access.leftFather.id eq currentFather }">
			<li
				class='layui-nav-item layui-nav-itemed <c:if test='${empty access.leftSons }'>layui-this</c:if> '>
		</c:when>
		<c:otherwise>
			<li class="layui-nav-item">
		</c:otherwise>
	</c:choose>
	<a class="" href="javascript:;">${access.leftFather.name }</a>
	<c:if test="${!empty access.leftSons }">
		<dl class="layui-nav-child">
			<c:forEach items="${access.leftSons }" var="son">
				<dd <c:if test="${son.id eq currentSon }">class='layui-this'</c:if>>
					<a href="javascript:;">${son.name }</a>
				</dd>
			</c:forEach>
		</dl>
		</li>
	</c:if>
</c:forEach>


