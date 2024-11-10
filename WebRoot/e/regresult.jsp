<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统注册</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="css/register.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/e/js/jquery.iFadeSldie.js"
	type="text/javascript"></script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">系统注册结果</a>
		</div>
	
		
        <div class="whitebox">
            <h1>
                会员注册<strong>Register</strong></h1>
            <div class="reg-box">
                <div class="reg-title">
                 
                </div>
                <div class="msg-tip">
                    <div class="ico warning">
                    </div>
                    <div class="text">
                        <strong>恭喜你注册成功！</strong>
                        <a href="${pageContext.request.contextPath}/e/login.jsp">登录系统</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
	</div>

	<div class="fn-clear"></div>





</body>
</html>