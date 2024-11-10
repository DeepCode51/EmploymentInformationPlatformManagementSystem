
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
            String id=request.getParameter("id");
            ResumeService resumeSrv=BeansUtil.getBean("resumeService", ResumeService.class);
            if(id!=null){
                Resume  resume=resumeSrv.load("where id="+id);
                if(resume!=null){
                	//
                  
                	request.setAttribute("resume",resume);
                }
            }
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e//css/box.all.css" type="text/css"></link>
 <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="/e/head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.aspx">首页</a> &gt;&gt; <a>简历</a>
		</div>
	
	<input type="hidden" id="reUrl" name="reurl"
		value="/e/resumeinfo.jsp?id=<%=id%>" />
	<input type="hidden" id="commentresurl"
		value="/e/resumeinfo.jsp?id=<%=id%>">
	<div class="fn-clear"></div>
	
	   <div class="main" style="height: auto;">
		     <jsp:include  page="menu.jsp"></jsp:include>
	  <div  class="main-content" style="height: auto;">
		<div class="info">
			<h1>${requestScope.resume.title}</h1>
			<h5></h5>
			<div class="news-content">
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">

					<tr>
						<td align="right" class="title">姓名:</td>
						<td>${requestScope.resume.name}</td>
						<td colspan="2" rowspan="6"><img id="imgXiangpian"
							width="200px" height="200px"
							src="${requestScope.resume.xiangpian}" /></td>
					</tr>

					<tr>
						<td align="right" class="title">出生年月:</td>
						<td>${requestScope.resume.birthday}</td>
					</tr>

					<tr>
						<td align="right" class="title">民族:</td>
						<td>${requestScope.resume.mingzu}</td>
					</tr>
					<tr>
						<td align="right" class="title">籍贯:</td>
						<td>${requestScope.resume.jiguan}</td>
					</tr>
					<tr>
						<td align="right" class="title">专业:</td>
						<td>${requestScope.resume.zhuanye}</td>
					</tr>
					<tr>
						<td align="right" class="title">学历:</td>
						<td>${requestScope.resume.xueli}</td>
					</tr>
					<tr>
						<td align="right" class="title">毕业时间:</td>
						<td>${requestScope.resume.bydate}</td>

						<td align="right" class="title">联系电话:</td>
						<td>${requestScope.resume.lxtel}</td>
					</tr>
					<tr>
						<td align="right" class="title">邮箱:</td>
						<td>${requestScope.resume.email}</td>

						<td align="right" class="title">身高:（cm）</td>
						<td>${requestScope.resume.shengao}</td>
					</tr>
					<tr>
						<td align="right" class="title">政治面貌:</td>
						<td>${requestScope.resume.mianmao}</td>

						<td align="right" class="title">现从事行业:</td>
						<td>${requestScope.resume.xchangye}</td>
					</tr>
					<tr>
					
						<td align="right" class="title">期望薪水:</td>
						<td>${requestScope.resume.qwxinshui}</td>
					</tr>
					<tr>
						<td align="right" class="title">工作年限:</td>
						<td>${requestScope.resume.gznianxian}</td>


						<td align="right" class="title">状态:</td>
						<td>${requestScope.resume.status}</td>
					</tr>
					<tr>
						<td align="right" class="title">工作经历:</td>
						<td colspan="3">${requestScope.resume.des}</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	<div class="fn-clear"></div>
   </div>
   </div>
</body>
</html>
