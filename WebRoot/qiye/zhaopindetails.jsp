<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
    if( id!=null)
    {
      Zhaopin temobjzhaopin=zhaopinSrv.load(" where id="+ id);
      request.setAttribute("zhaopin",temobjzhaopin);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>招聘信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看招聘</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">职位名称:</td>
			<td>${requestScope.zhaopin.title}</td>
			<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
				src="${requestScope.zhaopin.tupian}" /></td>
		</tr>
		<tr>
			<td align="right">岗位类别:</td>
			<td>${requestScope.zhaopin.gwtype}</td>
		</tr>
		<tr>
			<td width="10%" align="right">发布人:</td>
			<td>${requestScope.zhaopin.pubren}</td>
		</tr>
		<tr>
			<td align="right">发布时间:</td>
			<td><fmt:formatDate value="${requestScope.zhaopin.pubtime}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">职位待遇:</td>
			<td>${requestScope.zhaopin.daiyu}</td>
		</tr>
		<tr>
			<td width="10%" align="right">工作地:</td>
			<td>${requestScope.zhaopin.gzdi}</td>
		</tr>
		<tr>
			<td width="10%" align="right">最低学历:</td>
			<td>${requestScope.zhaopin.xueli}</td>
		
			<td width="10%" align="right">招聘人数:</td>
			<td>${requestScope.zhaopin.renshu}</td>
		</tr>
		
		
	</table>
</body>
</html>
