<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>首页栏目向导</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
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
			    $("#lanmu tr").each(function(){
			        if($(this).attr("parentid")!=0)
			          $(this).attr("data-tt-parent-id",$(this).attr("parentid"));
			    })
			    $("#lanmu").treetable({ expandable: true }).treetable("expandAll");
			    $(".btn-lanmu-delete").click(function(){
			             
			    	     
		                return confirm("你确定要加入该栏目");
		                 
		                 
			    });
			});
       </script>
</head>
<body >
			<div class="search-title">
				<h2>首页栏目选择向导</h2>
				<div class="description">
					
				</div>
			</div>
			<div class="clear"></div>
			<table id="lanmu" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				
				<tbody>
					<c:if test="${listlanmu== null || fn:length(listlanmu) == 0}">
						<tr>
							<td colspan="20">没有资讯类信息</td>
						</tr>
					</c:if>
					      <%	
					                IndexcolumnsService icSrv=BeansUtil.getBean("indexcolumnsService", IndexcolumnsService.class);
								    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listlanmu")!=null)
								      {
									  List<Lanmu> listlanmu=( List<Lanmu>)request.getAttribute("listlanmu");
								     for(Lanmu  temlanmu  :   listlanmu)
								      {
							%>
						<tr data-tt-id='<%=temlanmu.getId() %>' parentid="<%=temlanmu.getParentid()%>">
							<td style="text-align:left;">
							    <span class='<%=temlanmu.getIsleaf()==1?"file":"folder" %>'> 
								
										<%=temlanmu.getTitle()%>
								</span>
										
							  
							  <%
							     boolean isexist=icSrv.isExist(MessageFormat.format("where colid={0} and xtype=''资讯''",temlanmu.getId()));  
							     if(temlanmu.getIsleaf()==1&&!isexist){
							    	
							  %>
							      
							       <a lanmuid='<%=temlanmu.getId() %>' class="btn-lanmu-delete orange-href"  href="indexcolumnsmanager.do?actiontype=save&xtype=1&suzuid=<%=temlanmu.getId() %>">
							         <img src="images/add.gif">加入栏目
								   </a>
							  <%}else{%>
							              <span class="orange-href">已加入</span>
							  <%} %>
							         
							
							
		                     </td>
						</tr>
					    <%}}%>
				</tbody>
			</table>
</body>
</html>
