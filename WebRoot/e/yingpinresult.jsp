
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
            String id=request.getParameter("id");
            ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
            Zhaopin  zhaopin=null;
            if(id!=null){
                zhaopin=zhaopinSrv.load("where id="+id);
                if(zhaopin!=null)
                   request.setAttribute("zhaopin",zhaopin);
            }
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
 <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>

<script type="text/javascript">

     $(function(){
    	 
    	 
    	 
    	 
    	 
     });

</script>


</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block" style="min-height:600px;">
	  <div class="line-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt;  应聘提示
      </div>
	
	<input type="hidden" id="reUrl" name="reurl" value="/e/zhaopininfo.jsp?id=<%=id%>"/>
	<input type="hidden" id="commentresurl" value="/e/zhaopininfo.jsp?id=<%=id%>">
	<div class="fn-clear"></div>
	
		<div class="info">
			<h1> 对职位[${zhaopin.title}]   简历投递成功！</h1>
			<h5></h5>
			<div class="news-content">
			
			  
				
			</div>
		</div>
		
	</div>
	<div class="fn-clear"></div>
</body>
</html>
