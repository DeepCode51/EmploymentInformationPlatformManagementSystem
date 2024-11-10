<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	java.io.BufferedInputStream bis = null;
	java.io.BufferedOutputStream bos = null;
	String dwid=request.getParameter("dwid");
	try {
		String filename = request.getParameter("filename");
		
		filename = new String(filename.getBytes("iso8859-1"), "UTF-8");
		
		System.out.println("filename="+filename);
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition","attachment; filename="+ new String(filename.getBytes("UTF-8"),"iso8859-1"));
		bis = new java.io.BufferedInputStream(
				new java.io.FileInputStream(config.getServletContext().getRealPath("/upload/temp/"+filename)));
		bos = new java.io.BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		ZydownloadService downloadSrv=BeansUtil.getBean("zydownloadService", ZydownloadService.class);
		if(dwid!=null)
			downloadSrv.executeUpdate("update zydownload set dwcount=dwcount+1 where id="+dwid);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (bis != null)
			bis.close();
		if (bos != null)
			bos.close();
		out.clear();  
        out = pageContext.pushBody();
	}
%>
