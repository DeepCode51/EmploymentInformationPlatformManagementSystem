<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>岗位应聘信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
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
			             $.dialog.confirm("你确定要注销岗位应聘信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/yingpinmanager.do?&forwardurl=/e/huiyuan/yingpinmanager.jsp&actiontype=delete&id='+id);
				          });
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
	  <body style="overflow:auto;">
		 <jsp:include page="/e/head.jsp"></jsp:include>
		  <div class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="yingpinmanager.jsp">岗位应聘管理</a>
			</div>
    	
		   <div class="main">
		     <jsp:include  page="menu.jsp"></jsp:include>
	  <div  class="main-content">
			   <div class="search-title">
	                <h2>
	                       岗位应聘管理
	                </h2>
                <div class="description">
                </div>
              </div>
					<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/yingpinmanager.do"
						method="post">
						<table cellspacing="1" width="100%">
							<tbody>
								<tr>
									<td>招聘职位 <input name="zptitle" value="${zptitle}"
										class="input-txt" type="text" id="zptitle" /> <input
										type="hidden" name="actiontype" value="search" /> <input
										type="hidden" name="seedid" value="${seedid}" /> <input
										type="hidden" name="forwardurl"
										value="/e/huiyuan/yingpinmanager.jsp" />
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
			
				<table id="module" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
						
							<th><b>职位名称</b></th>
							
							<th><b>简历名</b></th>
							<th><b>投递时间</b></th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${listyingpin== null || fn:length(listyingpin) == 0}">
							<tr>
								<td colspan="20">没有相关岗位应聘信息</td>
							</tr>
						</c:if>
						<%	
						            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									if(request.getAttribute("listyingpin")!=null)
								      {
									  List<Yingpin> listyingpin=( List<Yingpin>)request.getAttribute("listyingpin");
								     for(Yingpin  temyingpin  :  listyingpin)
								      {
							%>
						<tr>
						

							<td><%=temyingpin.getZptitle()%></td>
							
							<td><%=temyingpin.getResumetitle()%></td>
							<td><%=sdf.format(temyingpin.getPosttime())%></td>
							
							<td>
							  
							     <%if(temyingpin.getStatus()==3){ %>
								    <a class="orange-href"  href="${pageContext.request.contextPath}/e/huiyuan/qycepingadd.jsp?ypid=<%=temyingpin.getId() %>&resumeid=<%=temyingpin.getResumeid()%>&seedid=101">测评用人单位</a>
							    <%} %>
							    <a class="orange-href"  href="${pageContext.request.contextPath}/e/huiyuan/yingpindetails.jsp?ypid=<%=temyingpin.getId() %>&resumeid=<%=temyingpin.getResumeid()%>&seedid=101">查看</a>
							 
							</td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
        </div>
        </div>
        <jsp:include page="/e/bottom.jsp"></jsp:include>
	</body>
</html>
