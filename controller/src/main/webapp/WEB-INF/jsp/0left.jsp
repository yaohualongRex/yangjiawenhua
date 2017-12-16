<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="0base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:forEach items="${accesses}" var="access">
	<c:choose>
		<c:when test="${access.father.id eq currentFather }">
			<li
				class='layui-nav-item layui-nav-itemed <c:if test='${empty access.sons }'>layui-this</c:if> '>
		</c:when>
		<c:otherwise>
			<li class="layui-nav-item">
		</c:otherwise>
	</c:choose>
	<a class="" href="javascript:;">${access.father.privilegeName }</a>
	<c:if test="${!empty access.sons }">
		<dl class="layui-nav-child">
			<c:forEach items="${access.sons }" var="son">
				<dd <c:if test="${son.id eq currentSon }">class='layui-this'</c:if>>
					<a href="javascript:;">${son.privilegeName }</a>
				</dd>
			</c:forEach>
		</dl>
		</li>
	</c:if>
</c:forEach>


