
<%@page import="com.daowen.entity.*"%>
<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.uibuilder.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
     <script type="text/javascript">
         
              $(function(){
                
            	  editor = KindEditor.create('textarea[name="dcontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
          	  
 
            	 
            	  
                  $("#btnLeaveword").click(function(){
                	  
                      var temaccountname= $("#hidCurrenthy").val();
                      var temgotourl=$("#reUrl").val();
                      editor.sync(); 
                      var temtitle=$("txtTitle").val();
                      var temdcontent=$("#txtDcontent").val();
                      if(temaccountname==""||temaccountname==""){
                          
                    	  window.location.href="login.jsp?gotourl="+temgotourl;
                          return false;
                        
                      }
                      
                      if(temtitle==""){
                       
                         alert("请输入留言标题");
                         return false;
                      }
                      if(temdcontent==""){
                          alert("请填写留言内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("留言内容至少8个字符");
                           return false;
                      }
                      
                      
                  });

              });
        
     </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	


	<div class="fn-clear"></div>
    <div style="background:#dadada;">
	<div class="wrap" >
		<div class="ask-list round-block" style="min-height: 600px;background-color:#fff;">
			<div class="title">
			       留言信息
			</div>
			<%=new LeavewordBuilder().build() %>
			
		</div>
		
		  <div class="round-block">
			 
			   <form id="leavewordForm" method="post"
					action="${pageContext.request.contextPath}/admin/leavewordmanager.do">
					
				    <input type="hidden" id="reUrl" name="reurl" value="/e/leavewordinfo.jsp"/>
				    <input type="hidden"  name="forwardurl" value="/e/leavewordinfo.jsp"/>
					<input type="hidden" name="actiontype" value="save"/>
					<input type="hidden" id="hidCurrenthy" name="currenthy" value="${huiyuan.accountname}"/>
					<input type="hidden" id="hidPhoto" name="photo" value="${huiyuan.touxiang}"/>
					
					<div>
					    <input type="text" name="title" id="txtTitle" style="margin-bottom:20px;width:400px;" class="input-txt" placeholder="标题" />
					</div>
			       <div >
			          
					  
			           <textarea  name="dcontent"  id="txtDcontent"  placeholder="在线留言"  style="width:100%;height:200px; "></textarea>
			         
			       </div>
			       <div >
			          
			           
			           <button id="btnLeaveword" class="btn btn-default"><i class="fa fa-check"></i>在线留言</button>
			       </div>
			   </form>
			  
			</div>
			

	</div>
    </div>
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>