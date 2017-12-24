<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" type="text/css" href="../../css/normalize.css"/>
<link rel="stylesheet" type="text/css" href="../../css/demo.css"/>
<link rel="stylesheet" type="text/css" href="../../css/component.css"/>
<link rel="stylesheet" href="../../css/layui.css" media="all">
<!--[if IE]>
<script src="../../js/html5.js"></script>
<![endif]-->
<script src="../../layui.js" charset="utf-8"></script>
<script src="../../jquery.js" charset="utf-8"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>

