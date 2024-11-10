
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
             ZydownloadService zydownloadSrv=BeansUtil.getBean("zydownloadService", ZydownloadService.class);
            AttachementService attrSrv=BeansUtil.getBean("attachementService", AttachementService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Zydownload  zydownload=zydownloadSrv.load("where id="+id);
                if(zydownload!=null)
                   request.setAttribute("zydownload",zydownload);
            }
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/_style.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/_mobile.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/primary-blue.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/index.css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
  
  <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt; 资料下载
      </div>
	
		<input type="hidden" id="commentresurl" value="/e/zydownloadinfo.jsp?id=<%=id%>">
	<input type="hidden" id="reUrl" name="reurl" value="/e/zydownloadinfo.jsp?id=<%=id%>"/>
	<div class="fn-clear"></div>
	
		<div class="info">
			<h1>${requestScope.zydownload.title}</h1>
			<h5>( 发布人${requestScope.zydownload.pubren} 发布时间:
				<fmt:formatDate value="${requestScope.zydownload.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/>)</h5>
			<div class="news-content">
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					
		

					<tr>

						<td colspan="4">${requestScope.zydownload.des}</td>
					</tr>
					<tr>
						<td align="right">附件</td>
						<td colspan="3">
							<%
									    if( id!=null)
									    {
									    %>
							<div class="uploadify-queue">
								<ul>
									<%
									                List<Attachement> zydownloadattachementlist=attrSrv.getEntity(MessageFormat.format(" where belongtable=''zydownload'' and belongid=''{0}''",id));
									                for(Attachement tema : zydownloadattachementlist)
									                {
									            %>
									<li><a
										href="${pageContext.request.contextPath}/plusin/download.jsp?&dwid=<%=id %>&filename=<%=tema.getFilename()%>"><%=tema.getFilename() %></a>
									</li>
									<%
									            } %>
								</ul>
							</div> <%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="comment.jsp">
		       <jsp:param value="download" name="commenttype"/>
		   </jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
