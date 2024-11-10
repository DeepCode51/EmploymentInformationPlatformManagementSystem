<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>下载资源信息</title>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
<link
	href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销下载资源信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/zydownloadmanager.do?actiontype=delete&id='
																			+ id);
																});
											});
						});
		$("#btnCheckAll").click(function() {
			var ischeck = false;
			$(".check").each(function() {
				if ($(this).is(":checked")) {
					$(this).prop("checked", "");
					ischeck = false;
				} else {
					$(this).prop("checked", "true");
					ischeck = true;
				}
			});
			if ($(this).text() == "选择记录")
				$(this).text("取消选择");
			else
				$(this).text("选择记录");
		})
	});
</script>
</head>
<body>

	<div class="search-title">
		<h2>下载资源管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/zydownloadmanager.do?actiontype=load&seedid=102">新建下载资源</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/zydownloadmanager.do"
			method="post">
			<table class="grid" cellspacing="1" width="100%">
				<tbody>
					<tr>
						<td>标题 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" />
							<div class="ui-button">
								<input type="submit" value="搜索" id="btnSearch"
									class="ui-button-text" />
							</div></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<span id="btnCheckAll" class="orange-href">选择 </span> <span
			id="btnDelete" class="orange-href">删除 </span>
	</div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>标题</b></th>
				<th><b>发布人</b></th>
				<th><b>提交时间</b></th>
				<th><b>资源分类</b></th>
				<th><b>下载次数</b></th>

				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if
				test="${listzydownload== null || fn:length(listzydownload) == 0}">
				<tr>
					<td colspan="20">没有相关下载资源信息</td>
				</tr>
			</c:if>
			<c:forEach var="temzydownload" items="${listzydownload}">
				<tr>
					<td>&nbsp<input id="chk${temzydownload.id}" class="check"
						name="chk${temzydownload.id}" type="checkbox"
						value='${temzydownload.id}'/>
					</td>
					<td>${temzydownload.title}</td>
					<td>${temzydownload.pubren}</td>
					<td><fmt:formatDate value="${temzydownload.pubtime}" pattern="yyyy-MM-dd"/></td>
					<td>${temzydownload.fenlei}</td>
					<td>${temzydownload.dlcount}</td>

					<td><a class="orange-href"
						href="${pageContext.request.contextPath}/admin/zydownloadmanager.do?actiontype=load&id=${temzydownload.id}">修改</a>
						<a class="orange-href"
						href="zydownloaddetails.jsp?id=${temzydownload.id}">查看</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />

</body>
</html>
