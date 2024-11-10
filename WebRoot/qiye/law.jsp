<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>


<%
      Object o=  request.getSession().getAttribute("qiye");
     if(o==null)
          response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
%>
