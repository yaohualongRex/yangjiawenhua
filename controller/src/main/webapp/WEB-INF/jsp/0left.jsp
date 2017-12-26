<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="layui-side-scroll">
    <!--  -->
    <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed"><a href="">公告栏</a></li>
        <c:forEach items="${privileges}" var="privilege">
            <c:choose>
                <c:when test="${privilege.father.id eq currentFather }">
                    <li
                    class='layui-nav-item layui-nav-itemed <c:if test='${empty privilege.sons }'>layui-this</c:if> '>
                </c:when>
                <c:otherwise>
                    <li class="layui-nav-item">
                </c:otherwise>
            </c:choose>
            <a class="" href="${privilege.father.url}">${privilege.father.privilegeName }</a>
            <c:if test="${!empty privilege.sons }">
                <dl class="layui-nav-child">
                    <c:forEach items="${privilege.sons }" var="son">
                        <dd <c:if test="${son.id eq currentSon }">class='layui-this'</c:if>>
                            <a href="${son.url}">${son.privilegeName }</a>
                        </dd>
                    </c:forEach>
                </dl>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>


