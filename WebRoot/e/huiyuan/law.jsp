<%@ page language="java" import="com.daowen.util.*,com.daowen.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="java.text.*" %>
<%
      Huiyuan tem_huiyuan=null;
      
      if(request.getSession().getAttribute("huiyuan")!=null){
         tem_huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
      }
      else
      {
    	 String forwardurl=request.getRequestURI().replace(request.getContextPath(), "");
         response.sendRedirect(request.getContextPath()+"/e/login.jsp?forwardurl="+forwardurl);
      }  
      
 %>
