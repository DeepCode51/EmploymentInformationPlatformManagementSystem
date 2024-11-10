<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String  id=request.getParameter("id");
    LeavewordService lwSrv=BeansUtil.getBean("leavewordService",LeavewordService.class);
	Leaveword temobjleaveword=null;
	if( id!=null)
	{
	  temobjleaveword=lwSrv.load(" where id="+ id);
	  request.setAttribute("leaveword",temobjleaveword);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>留言信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 留言管理
		</div>
	</div>
	<div class="wrap">
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		
		
			<tr>
			<td width="10%" align="right">标题:</td>
			<td>${requestScope.leaveword.title}</td>
		</tr>
		<tr>
			<td width="10%" align="right">时间:</td>
			<td><fmt:formatDate value="${requestScope.leaveword.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		</tr>
	
		<tr>
			<td width="10%" align="right">状态:</td>
			<td>
			    <%if(temobjleaveword.getStatus()==0) {%>
			                   待回复
			    <%} %>
			    <%if(temobjleaveword.getStatus()==1) {%>
			                   已回复
			    <%} %>
			</td>
		</tr>
		
		<tr>
			<td width="10%" align="right">留言人:</td>
			<td>${requestScope.leaveword.lwren}</td>
		</tr>
		<tr>
			<td align="right">留言内容:</td>
			<td colspan="3">${requestScope.leaveword.dcontent}</td>
		</tr>
		<%if(temobjleaveword.getStatus()==1){ %>
		<tr>
			<td width="10%" align="right">回复人:</td>
			<td>${requestScope.leaveword.replyren}</td>
		</tr>
		<tr>
			<td width="10%" align="right">回复时间:</td>
			<td>
			  <fmt:formatDate value="${requestScope.leaveword.replytime}" pattern="yyyy-MM-dd hh:mm:ss"/>
			
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">回复内容:</td>
			<td>${requestScope.leaveword.replycontent}</td>
		</tr>
		<%} %>
		
	</table>
				<!-----结束---->
			</div>
		</div>
	</div>
</body>
</html>
