<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.daowen.webcontrol.*" %>

<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
     List<Zhaopin> listZhaopin=(List<Zhaopin>)request.getAttribute("listZhaopin");
 %>
<head>
<title>招聘列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 招聘查询
		</div>
			  <div style="min-height:600px;" class="common-picture-list">
			     <ul>
                  <% 
                    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                     if(listZhaopin!=null){
     	              for(Iterator it=listZhaopin.iterator();it.hasNext();){ 
     	                  Zhaopin temzhaopin=(Zhaopin)it.next();
     	            %>
                         <li  class="clearfix">
                            <h3>
                                <a href="${pageContext.request.contextPath}/e/zhaopininfo.jsp?id=<%=temzhaopin.getId()%>"><%=temzhaopin.getTitle() %></a> 
                            </h3>
                            <div class="picture-area">
                                <img src="<%=temzhaopin.getTupian()%>"  width="150" height="95"/>
                            </div>
                            <div class="text-area">
													     <div class="list-show-item"><em> 职位名称:</em><%=temzhaopin.getTitle()%></div>
													     <div class="list-show-item"><em> 岗位类别:</em><%=temzhaopin.getGwtype()%></div>
													     <div class="list-show-item"><em> 发布人:</em><%=temzhaopin.getPubren()%></div>
													     <div class="list-show-item"><em> 发布时间:</em><%=sdf.format(temzhaopin.getPubtime())%></div>
													     <div class="list-show-item"><em> 职位待遇:</em><%=temzhaopin.getDaiyu()%></div>
													     <div class="list-show-item"><em> 工作地:</em><%=temzhaopin.getGzdi()%></div>
													     <div class="list-show-item"><em> 最低学历:</em><%=temzhaopin.getXueli()%></div>
													     <div class="list-show-item"><em> 招聘人数:</em><%=temzhaopin.getRenshu()%></div>
					                     <div class="abstract">
									   <%=HTMLUtil.subStringInFilter(temzhaopin.getDes(), 0, 200) %>
	[<a href="${pageContext.request.contextPath}/e/zhaopininfo.jsp?id=<%=temzhaopin.getId()%>">详细</a>]
								 </div>
	   </div>
                    </li>
                 <%}} %>
                 </ul>
                 <form id="zhaopinsearchForm" method="post" action="${pageContext.request.contextPath}/e/zhaopinlist.jsp">
                      <input type="hidden" name="actiontype" value="get" />
                      <input type="hidden" name="forwardurl" value="/e/zhaopinlist.jsp" />
                 </form>
     	            <daowen:pager id="pager1" attcheform="zhaopinsearchForm" />
     	        </div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
