<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="layui-logo">
    <font size="4"><B>阳夏图书管理系统</B></font>
</div>
<ul class="layui-nav layui-layout-left">
    <li class="layui-nav-item">欢迎您, <B>${currentUser.chinaName}</B> 进入阳夏图书管理系统!您当前所在用户组: <B>${currentUser.roleName}</B>
    </li>
</ul>
<ul class="layui-nav layui-layout-right">
    <li class="layui-nav-item"><a href="javascript:;"> <img
            src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
            class="layui-nav-img"> ${currentUser.chinaName}
    </a>
        <dl class="layui-nav-child">
            <dd>
                <a href="/userData">基本资料</a>
            </dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="/loginOut">退了</a></li>
</ul>


