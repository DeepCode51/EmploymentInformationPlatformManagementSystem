<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>企业信息信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			       var ids = $(".check[type=checkbox]:checked").serialize();
					 if($(".check:checked").length<1)
				        {
				           $.dialog.alert("请选择需要删除条目");
				           return;
				        } 
					if(!confirm("你确定要删除吗")){
						return;
					}
					$.ajax({
			url: "${pageContext.request.contextPath}/admin/qiyemanager.do?actiontype=delete",
			                     method: 'post',
			                     data: ids,
			                     success: function (data) {
			                          window.location.reload();
			                     },
			                     error: function (XMLHttpRequest, textStatus, errorThrown) {
			                         alert(XMLHttpRequest.status + errorThrown);
			                     }
			                 });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>企业信息管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/qiyemanager.do?actiontype=load&forwardurl=/admin/qiyeadd.jsp">新建企业信息</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/qiyemanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>账号 <input name="accountname" value="${accountname}"
							class="input-txt" type="text" id="accountname" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl" value="/admin/qiyemanager.jsp" />
							<button class="orange-button">搜索</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<span class="orange-href" id="btnCheckAll">选择</span> <span
			id="btnDelete" class="orange-href"> 删除 </span>
	</div>
	<table id="qiye" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>账号</b></th>
				<th><b>企业名称</b></th>
				<th><b>法人</b></th>
				<th><b>企业性质</b></th>
				<th><b>注册日期</b></th>
				<th><b>人数</b></th>
				<th><b>营业执照号</b></th>
				<th><b>法人身份证号</b></th>
				<th><b>企业地址</b></th>
				<th><b>状态</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listqiye== null || fn:length(listqiye) == 0}">
				<tr>
					<td colspan="20">没有相关企业信息信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listqiye")!=null)
								      {
									  List<Qiye> listqiye=( List<Qiye>)request.getAttribute("listqiye");
								     for(Qiye  temqiye  :  listqiye)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temqiye.getId()%>" class="check"
					name="ids" type="checkbox" value='<%=temqiye.getId()%>'></td>
				<td><%=temqiye.getAccountname()%></td>
				<td><%=temqiye.getName()%></td>
				<td><%=temqiye.getLawor()%></td>
				<td><%=temqiye.getXingzhi()%></td>
				<td><%=sdf.format(temqiye.getRegdate())%></td>
				<td><%=temqiye.getRenshu()%></td>
				<td><%=temqiye.getZhizhaono()%></td>
				<td><%=temqiye.getIdcardno()%></td>
				<td><%=temqiye.getAddress()%></td>
				<td><%=temqiye.getStatus()%></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/qiyemanager.do?actiontype=load&id=<%=temqiye.getId()%>&forwardurl=/admin/qiyemodify.jsp">修改</a>
					<a class="orange-href"
					href="${pageContext.request.contextPath}/admin/qiyedetails.jsp?id=<%=temqiye.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
