<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  ypid=request.getParameter("ypid");
    ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
    ResumeService resumeSrv=BeansUtil.getBean("resumeService", ResumeService.class);
    YingpinService yingpinSrv=BeansUtil.getBean("yingpinService", YingpinService.class);
    if(ypid!=null)
    {
     
      Yingpin temobjyingpin=yingpinSrv.load(" where id="+ ypid);
      if(temobjyingpin!=null)
      {
    	  Resume  resume=resumeSrv.load("where id="+temobjyingpin.getResumeid());
    	  Zhaopin  zhaopin=zhaopinSrv.load("where id="+temobjyingpin.getZpid());
    	  request.setAttribute("resume", resume);
    	  request.setAttribute("zhaopin", zhaopin);
          request.setAttribute("yingpin",temobjyingpin);
      }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>岗位应聘信息查看</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
   <script type="text/javascript">
        $(function ()
        {
        });  
    </script>
</head>
<body style="padding:10px">

	<div class="search-title">
		<h2>查看应聘岗位：</h2>
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
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">

		<tr>
			<td align="right" class="title">姓名:</td>
			<td>${requestScope.resume.name}</td>
			<td colspan="2" rowspan="6"><img id="imgXiangpian" width="200px"
				height="200px" src="${requestScope.resume.xiangpian}" /></td>
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

			<td align="right" class="title">身高:</td>
			<td>${requestScope.resume.shengao}</td>
		</tr>
		<tr>
			<td align="right" class="title">政治面貌:</td>
			<td>${requestScope.resume.mianmao}</td>

			<td align="right" class="title">现从事行业:</td>
			<td>${requestScope.resume.xchangye}</td>
		</tr>
		<tr>
			<td align="right" class="title">求职行业:</td>
			<td>${requestScope.resume.qzhangye}</td>

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

</body>
</html>
