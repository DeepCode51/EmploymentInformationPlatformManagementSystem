<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
           QiyeService qiyeSrv=BeansUtil.getBean("qiyeService",QiyeService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Qiye qiye=qiyeSrv.load("where id="+id);
                if(qiye!=null)
                   request.setAttribute("qiye",qiye);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>企业信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <script type="text/javascript">
    
            $(function(){
               
                
                  $(".require-login").click(function(){
             	    	
           	    	 
           	    	  var temaccountname= $("#scren").val(); 
           	    	  var forwardurl=$("#commentresurl").val();
           	    	  if(temaccountname==""){
                             
                             window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+forwardurl;
                             return false;
                            
                        }
           	    	  
           	    	   return true;
           	      
           	      
           	      });
                   
                 
            });
    
    
    </script>
    
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/qiyeinfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a href="${pageContext.request.contextPath}/e/qiyelist.jsp">企业信息</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.qiye.photo}" />
				<div class="operation">
					<div class="ticket-price">
					  <form method="post" style="display:inline" action="${pageContext.request.contextPath}/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=id%>"/>
                                          <input type="hidden" name="bookname" value="${qiye.name}"/>
                                          <input type="hidden" name="tupian" value="${qiye.photo}"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/qiyeinfo.jsp?id=<%=id%>"/>
                                          <input type="hidden" name="errorurl" value="/e/qiyeinfo.jsp?id=<%=id%>"/>
                                           <input type="hidden" name="href" value="/e/qiyeinfo.jsp?id=${qiye.id }"/>
                                         <input type="hidden" name="xtype" value="qiye"/>
		                     <button  id="btnShoucang" class="btn btn-default require-login"><i class="fa fa-plus"></i>收藏</button>
		                     ${sctip}
                       </form>
					
					</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.qiye.name}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						
						<li><strong>法人:</strong> ${requestScope.qiye.lawor}</li>
						<li><strong>企业性质:</strong> ${requestScope.qiye.xingzhi}</li>
						<li><strong>注册日期:</strong> ${requestScope.qiye.regdate}</li>
						<li><strong>人数:</strong> ${requestScope.qiye.renshu}</li>
						<li><strong>营业执照号:</strong> ${requestScope.qiye.zhizhaono}
						</li>
						<li><strong>法人身份证号:</strong> ${requestScope.qiye.idcardno}
						</li>
						<li><strong>企业地址:</strong> ${requestScope.qiye.address}</li>
						<li><strong>状态:</strong> ${requestScope.qiye.status}</li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">企业介绍</div>
		<div class="brief-content">${requestScope.qiye.des}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="qiye" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
