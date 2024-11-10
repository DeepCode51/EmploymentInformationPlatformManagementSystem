
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="import.jsp" %>
 <script type="text/javascript">
  
    $(function(){
      
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      });
      
      $("#searchForm").submit(function(){
    		 var temtitle= $("#title").val();
    		  if(temtitle==""){
    			  
    			  alert("请输入搜索信息");
    			  return false;
    		  }
    		  
    		  
    	  });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
      String title=request.getParameter("title");
      if(title!=null)
    	  request.setAttribute("title", title);
      
     
   
     

 %>

 
 
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection">
                          <em></em><a href="#">收藏我们</a>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	  <li class="hd_menu_tit zhuce" >
	  <%if(temhy!=null){ %>
	       
	       欢迎<a href="${pageContext.request.contextPath}/e/huiyuan/accountinfo.jsp">${huiyuan.accountname }</a>！
	       <span style="cursor:pointer;"  class="red exit">退出</span> 
	   <%} else{
	   %>
	   <a href="${pageContext.request.contextPath}/e/login.jsp"  class="red">[登录]</a> 
	   <%} %>
	     <a href="${pageContext.request.contextPath}/e/register.jsp" class="red">[免费注册]</a>
	       
	       
	       </li>
	   
	   <li class="hd_menu_tit" ><a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a></li>
	  
	  </ul>
	</div>
    </div>
  </div>
 </div>
 

    <div class="row-flow white-paper">
    <div class="wrap">
        <div style="font-size: 28px; color:#04a219; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                             就业信息平台
            
        </div>
         <form  style="display:inline-block;margin-top:10px;"  id="searchForm"  action="${pageContext.request.contextPath}/admin/sitesearch.do" method="post" >
           <input   type="hidden" name="actiontype" value="find" />
            
        <div class="search-box ">
            <div class="search-text">
              <select name="searchtype" style="height:35px;width:120px;font-size:20px; ">
                   <option value="1">招聘</option>
                   <option value="2">资讯</option>
               </select>
            </div>
            <div class="keyword">
               
                <input type="text" placeholder="请输入信息" id="title" value="${title}" name="title">
            </div>
            <div class="so">
                <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

     
 </div>
  
 
 
 <%=new SitenavBuilder(request).build() %>
  
     
  