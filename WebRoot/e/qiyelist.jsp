<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@  include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
    QiyeService qiyeSrv=BeansUtil.getBean("qiyeService",QiyeService.class);
    String  filter="";
    int pageindex = 1;
	int pagesize = 10;
	// 获取当前分页
	String currentpageindex = request.getParameter("currentpageindex");
	// 当前页面尺寸
	String currentpagesize = request.getParameter("pagesize");
	// 设置当前页
	if (currentpageindex != null)
		pageindex = new Integer(currentpageindex);
	// 设置当前页尺寸
	if (currentpagesize != null)
		pagesize = new Integer(currentpagesize);
	List<Qiye> qiyelist = qiyeSrv.getPageEntitys(filter,pageindex, pagesize);
	int recordscount = qiyeSrv.getRecordCount(filter == null ? "": filter);
	request.setAttribute("listQiye", qiyelist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业信息列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 企业信息查询
		</div>
		<div  class="picture-list">
		     <ul>
		       <c:forEach var="qiye" items="${listQiye}">
		        <li>
		             <div class="item">
			              <div class="tag">
			                 <span>推荐</span>
			              </div>
		              <div class="img">
					   <a href="${pageContext.request.contextPath}/e/qiyeinfo.jsp?id=${qiye.id}" >
                          <img src="${qiye.photo}" />
						 </a>
		              </div>
		               <div class="name">${qiye.name}</div>
		               <div class="price">${qiye.xingzhi }</div>
		           </div>
		        </li>
		        </c:forEach>
		     </ul>
		   </div>
		   <c:if test="${listQiye== null || fn:length(listQiye) == 0}">
		       <div style="font-size:26px;padding-left:200px;padding-top:150px;color:red;font-weight:600;">
没有找到相关企业信息信息
		       </div>
		    </c:if>
						<div class="clear"></div>
				<form id="qiyesearchForm" method="post" action="${pageContext.request.contextPath}/e/qiyelist.jsp">
<input type="hidden" name="actiontype" value="get" />
                      <input type="hidden" name="forwardurl" value="/e/qiyelist.jsp" />
                 </form>
		<daowen:pager id="pager1"  attcheform="qiyesearchForm" />
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
