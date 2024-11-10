
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
             ZydownloadService zydownloadSrv=BeansUtil.getBean("zydownloadService", ZydownloadService.class);
            LanmuService lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
            List<Zydownload> zydownloadlist=zydownloadSrv.getEntity("");
            List<Lanmu> rootlm=lanmuSrv.getEntity( "where parentid=0");
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载资源信息</title>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/index.css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
  <script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
	  <div class="line-title">
                   当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a>下载资源</a>
      </div>
	
	<div style="min-height:600px;" class="common-picture-list">
			<ul>
				<% 
                    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
                     if(zydownloadlist!=null){
     	              for(Iterator it=zydownloadlist.iterator();it.hasNext();){ 
     	                  Zydownload temzydownload=(Zydownload)it.next();
     	            %>
				<li class="clearfix">
					<h3>
						<a
							href="${pageContext.request.contextPath}/e/zydownloadinfo.jsp?id=<%=temzydownload.getId()%>"><%=temzydownload.getTitle() %></a>
					</h3>
					<div class="picture-area">
						<img src="<%=temzydownload.getTupian()%>" width="150" height="95" />
					</div>
					<div class="text-area">
						
						<div class="list-show-item">
							<em> 发布人:</em><%=temzydownload.getPubren()%></div>
						<div class="list-show-item">
							<em> 发布时间:</em><%= sdf.format(temzydownload.getPubtime())%></div>
						<div class="list-show-item">
							<em> 下载次数:</em><%=temzydownload.getDlcount()%></div>
						<div class="list-show-item">
							<em> 分类:</em><%=temzydownload.getFenlei()%></div>
						<div class="abstract">
							<%=HTMLUtil.subStringInFilter(temzydownload.getDes(), 0, 200) %>
							[<a
								href="${pageContext.request.contextPath}/e/zydownloadinfo.jsp?id=<%=temzydownload.getId()%>">详细</a>]
						</div>
					</div>
				</li>
				<%}} %>
			</ul>
			<form id="zydownloadsearchForm" method="post"
				action="${pageContext.request.contextPath}/e/zydownloadlist.jsp">
				<input type="hidden" name="actiontype" value="get" /> <input
					type="hidden" name="forwardurl" value="/e/zydownloadlist.jsp" />
			</form>
			<daowen:pager id="pager1" attcheform="zydownloadsearchForm" />
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>


		
</html>
