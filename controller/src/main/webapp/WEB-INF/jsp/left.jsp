<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="base.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<ul>
<%-- 	<c:set var="aaa" value="" />
	<!-- 遍历当前登录用户的角色列表 -->
	<c:forEach items="${_CURRENT_USER.roles }" var="role">
		<!-- 遍历每个角色下的模块 -->
		<c:forEach items="${role.modules }" var="module">
			<!-- 如果该模块没有输出过，则要进行输出，否则这个模块就不输出 -->
			<c:if test="${(moduleName eq module.remark) and module.ctype==1  }">
				<c:if test="${fn:contains(aaa,module.cpermission) eq false }">
					<c:set var="aaa" value="${aaa},${module.cpermission }" />
					<li><a href="${ctx}/${module.curl}"
						onclick="linkHighlighted(this)" target="main" id="aa_1">${module.cpermission }</a></li>
				</c:if>
			</c:if>

		</c:forEach>
	</c:forEach> --%>
	<ul class="layui-nav layui-nav-tree"  lay-filter="test">
      	<li class="layui-nav-item layui-nav-itemed"><a href="">公告栏</a></li>
        <li class="layui-nav-item">
          <a class="" href="javascript:;">系统管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">用户资料管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">客户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">客户信息查询</a></dd>
            <dd><a href="javascript:;">客户信息录入</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">图书管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">合作图书管理</a></dd>
            <dd><a href="javascript:;">自费图书管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">订单管理</a></li>
        <li class="layui-nav-item"><a href="">发票管理</a></li>
        <li class="layui-nav-item"><a href="">推荐费管理</a></li>
        <li class="layui-nav-item"><a href="">日志查询</a></li>
      </ul>
</ul>

