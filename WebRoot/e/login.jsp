<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

       String forwardurl=request.getParameter("forwardurl");
       if(forwardurl!=null)
         request.setAttribute("forwardurl", forwardurl);
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>

      <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
   
   
<script type="text/javascript">
 
           $(function(){
	           
	            $.metadata.setType("attr","validate");
	            $("#form1").validate();
	        });  
 
 </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="login.jsp">会员登录</a>
		</div>
	
		<div class="whitebox">

			<h1>用户登录</h1>
           <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="login" />
			<input type="hidden"  name="forwardurl" value="${forwardurl}"/>
			<input type="hidden"  name="errorurl" value="/e/login.jsp"/>
			<input type="hidden" name="usertype"  value="0" />
                      
			<div style="min-height:600px;" class="reg-box">

				
				<div class="reg-content">
					
					<div>
					   ${errormsg}
					</div>
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text" value="${accountname }" validate="{required:true,messages:{required:'请输入账户名'}}" class="ui-input" id="txtHuiyuanname"
								name="accountname"/> 

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" value="${password}" validate="{required:true,messages:{required:'请输入密码'}}"  class="ui-input" id="txtPassword"
								name="password"/> 
								

						</dd>

					</dl>
					
				     <dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="登录" name="btnReigster">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>


</body>
</html>