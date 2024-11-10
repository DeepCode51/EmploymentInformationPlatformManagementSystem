<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp" %>
<%
            String id=request.getParameter("id");
            ResumeService resumeSrv=BeansUtil.getBean("resumeService", ResumeService.class);
            ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
            if(id!=null){
                Zhaopin zhaopin=zhaopinSrv.load("where id="+id);
                if(zhaopin!=null)
                   request.setAttribute("zhaopin",zhaopin);
            }
   %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>招聘</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

   
<script type="text/javascript">

     $(function(){
    	 
    	 
    	 $("#btnOk").click(function(){
    		 
    		 var poster=$("#poster").val();
    		 var temreturnurl=$("#reUrl").val();
    		 if(poster==""){
    			 
    			 window.location.href="login.jsp?reurl="+temreturnurl;
                 return false;
    		 }
    		 
    		 if($("[name='resume']:checked").size()==0){
    			 alert("请选择一份简历");
    			 return false;
    			 
    		 }
    		 
    		 
    	 });
    	 
    	 
     });

</script>
   
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/zhaopininfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a href="${pageContext.request.contextPath}/e/zhaopinlist.jsp">招聘</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.zhaopin.tupian}" />
				<div class="operation">
					<div class="ticket-price">${requestScope.zhaopin.title}</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.zhaopin.title}</div>
				<div class="sub-title"></div>
				<div>
					<ul>

						<li><strong>岗位类别:</strong> ${requestScope.zhaopin.gwtype}</li>
						<li><strong>发布人:</strong> ${requestScope.zhaopin.pubren}</li>
						<li><strong>发布时间:</strong> <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${requestScope.zhaopin.pubtime}"/>
						</li>
						<li><strong>职位待遇:</strong> ${requestScope.zhaopin.daiyu}</li>
						<li><strong>工作地:</strong> ${requestScope.zhaopin.gzdi}</li>
						<li><strong>最低学历:</strong> ${requestScope.zhaopin.xueli}</li>
						<li><strong>招聘人数:</strong> ${requestScope.zhaopin.renshu}人</li>
						
						<li>
						<%
					
					  Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
				       
				   	List<Resume> resumlist=null;
					  if(temhy!=null){
					  

						 resumlist=resumeSrv.getEntity("where suoyouren='"+temhy.getAccountname()+"'");
						
					  
					  }
					  if(temhy!=null&&resumlist!=null&&resumlist.size()==0){
					  
					  
					%>
					
					<div>
					   亲你的简历库中没有你的简历，请速度填写简历<a  href="${pageContext.request.contextPath}/admin/resumemanager.do?actiontype=load&forwardurl=/e/huiyuan/resumeadd.jsp&seedid=102">快速填写简历</a>
				
					</div>
					<%} %>
					 <form  name="form1" method="post" action="${pageContext.request.contextPath}/admin/zhaopinmanager.do" >
				
					<% 
					
					  if(temhy!=null&&resumlist!=null&&resumlist.size()>0){
						  
						  for(Resume resume : resumlist){
					%>
					
					<div>
					            
					  
					   
					     <input type="radio" value="<%=resume.getId()%>" name="resume"/> <%=resume.getTitle() %>
					     
					     
					  </div>
					
					
					<%}}%>
					       <input type="hidden" name="forwardurl" value="/e/yingpinresult.jsp?id=<%=id%>"/>
							<input type="hidden" name="actiontype" value="yingpin"/>
							<input type="hidden" name="id" value="<%=id%>"/>
							<input type="hidden" name="zptitle" value="${zhaopin.title}"/>
							<input type="hidden" name="poster" id="poster" value="${huiyuan.accountname}"/>
							<input type="hidden" name="postername" id="postername" value="${huiyuan.name}"/>
							  <input type="submit" class="button" name="btnOk" id="btnOk"  value="投递简历"/>
					           
							</form>
					
						  
							
						</li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">岗位描述</div>
		<div class="brief-content">${requestScope.zhaopin.des}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="zhaopin" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
