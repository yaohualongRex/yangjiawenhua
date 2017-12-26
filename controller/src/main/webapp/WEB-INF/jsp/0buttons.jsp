<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<c:if test="${!empty buttons}">
    <div class="layui-btn-group">
        <c:forEach items="${buttons}" var="button">
            <c:choose>
                <c:when test="${button.id%10 eq 1}">
                    <button class="layui-btn" data-type="add">${button.privilegeName}</button>
                </c:when>
                <c:when test="${button.id%10 eq 2}">
                    <button class="layui-btn" data-type="update">${button.privilegeName}</button>
                </c:when>
                <c:when test="${button.id%10 eq 3}">
                    <button class="layui-btn" data-type="delete">${button.privilegeName}</button>
                </c:when>
            </c:choose>

        </c:forEach>
    </div>
</c:if>