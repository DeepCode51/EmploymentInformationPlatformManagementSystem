<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
       Qiye qiye= (Qiye)request.getSession().getAttribute("qiye");
	QiyeService qiyeSrv=BeansUtil.getBean("qiyeService",QiyeService.class);
	 if(qiye!=null)
	 {
	     Qiye temqiye   =qiyeSrv.load("where id="+((Qiye)qiye).getId());
	     request.setAttribute("qiye",temqiye);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>企业信息信息</title>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看账户信息</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">账号:</td>
			<td>${requestScope.qiye.accountname}</td>
			<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
				src="${requestScope.qiye.photo}" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="right">企业名称:</td>
			<td>${requestScope.qiye.name}</td>
		</tr>
		<tr>
			<td width="10%" align="right">法人:</td>
			<td>${requestScope.qiye.lawor}</td>
		</tr>
		<tr>
			<td align="right">企业性质:</td>
			<td>${requestScope.qiye.xingzhi}</td>
		</tr>
		<tr>
			<td align="right">注册日期:</td>
			<td><fmt:formatDate value="${requestScope.qiye.regdate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">人数:</td>
			<td>${requestScope.qiye.renshu}</td>
		</tr>
		<tr>
			<td width="10%" align="right">营业执照号:</td>
			<td>${requestScope.qiye.zhizhaono}</td>
		
			<td width="10%" align="right">法人身份证号:</td>
			<td>${requestScope.qiye.idcardno}</td>
		</tr>
		<tr>
			<td width="10%" align="right">企业地址:</td>
			<td>${requestScope.qiye.address}</td>
		
			<td width="10%" align="right">状态:</td>
			<td>${requestScope.qiye.status}</td>
		</tr>
		<tr>
			<td align="right">说明:</td>
			<td colspan="3">${requestScope.qiye.des}</td>
		</tr>
	</table>
</body>
</html>
