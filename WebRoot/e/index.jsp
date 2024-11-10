<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE HTML>
<%
ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
List<Zhaopin> listZhaopin = zhaopinSrv.getTopEntity("",8);
if(listZhaopin!=null)
	request.setAttribute("listZhaopin", listZhaopin);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/jquery.iFadeSlide.css" type="text/css"></link>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {


            
            $('div#slide_c').iFadeSlide({
                field: $('div#slide_c img'),
                icocon: $('div.ico_c'),
                outTime: 100,
                inTime: 200
            });
            
           

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	

	<div class="wrap round-block">
	  
		<div class="sidebar fn-left"
			style="height:316px; width:252px; padding-right: 0px; background: #fff;">
			<h3>系统公告</h3>
			<%=new NoticeBuilder().build() %>

		</div>
		<div class="fn-left">
		
		      <%=new FocusgraphicBuilder().build()%>
          
		</div>

		

	</div>

	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildColumns() %>

		
	 
	</div>
	
	<div class="wrap round-block">
	
	    <div  class="picture-list">
	        <div class="title">招聘信息</div>
		     <ul>
		       <c:forEach var="zhaopin" items="${listZhaopin}">
		        <li>
		             <div class="item">
			              <div class="tag">
			                 <span>推荐</span>
			              </div>
		              <div class="img">
					   <a href="${pageContext.request.contextPath}/e/zhaopininfo.jsp?id=${zhaopin.id}" >
                             <img src="${zhaopin.tupian}" />
						 </a>
		              </div>
		               <div class="name">${zhaopin.title}</div>
		               <div class="price">${zhaopin.renshu }人</div>
		           </div>
		        </li>
		        </c:forEach>
		     </ul>
		   </div> 
	</div>
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildImageColumns() %>

		
	 
	</div>
		
		
	<div class="fn-clear"></div>
	
   
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>