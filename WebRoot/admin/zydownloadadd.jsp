<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>下载资源</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">
        function initControl(){
	
                    //结束绑定
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '${pageContext.request.contextPath}/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '${pageContext.request.contextPath}/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '${pageContext.request.contextPath}/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidTupian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.zydownload.tupian}";
				       if(imgtupiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="des"]', {
			             uploadJson : '../plusin/upload_json.jsp',
				         fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
	        //初始化附件
	            initUpload();
        }
        //初始化附件
         function  initUpload(){
             $('#upload').uploadify({  
                'formData': { 'folder': '${pageContext.request.contextPath}/Upload' },  
                'buttonText': '选择下载文档',  
                'buttonClass': 'browser',  
                'removeCompleted': true,  
                'swf': '${pageContext.request.contextPath}/uploadifyv3.1/uploadify.swf', 
                'fileTypeExts':"*.jpg;*.gif;*.png;*.xls;*.doc;*.zip;*.ppt;*.docx;",
                'auto':true, 
                'removeTimeout':0,
                'debug': false,  
                'height': 15,  
                'width':90,  
                'uploader': '${pageContext.request.contextPath}/admin/uploadmanager.do',
                 'fileSizelimit':'2048KB',
                 'queueSizelimit':'5',
                 'onUploadSuccess':function(file, data, response){
                     $("#filelist").show();
                     var filesize=Math.round(file.size/1024);
                      $("#filelist div ul").append("<li ><input type='hidden' name='fileuploaded' value='"+file.name+"'  > "+file.name+"["+filesize+"KB] <a href=\"#\" onclick=\"$(this).parent().remove();\">移除</a> </li> ");
                  },
                  'onQueueComplete':function(){
                  }
             }); 
          }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#zydownloadForm").validate();
        });  
    </script>
</head>
<body>

           <%
           
              AttachementService attrSrv=BeansUtil.getBean("attachementService", AttachementService.class);
           %>
      
             <div class="search-title">
	                <h2>
	                       下载资源管理->  <a href="${pageContext.request.contextPath}/admin/zydownloadmanager.do?actiontype=load&seedid=102">新建下载资源</a>
	                </h2>
                <div class="description">
                </div>
              </div>
				    <form name="zydownloadform" method="post" action="${pageContext.request.contextPath}/admin/zydownloadmanager.do"  id="zydownloadForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
						         <input type="hidden" name="seedid" value="${seedid}" />
						          <input type="hidden" name="pubren" value="${users.username}" />
						          
					<tr>
						<td width="10%" align="right">标题:</td>
						<td width="30%"><input name="title"
							value="${requestScope.zydownload.title}" class="input-txt"
							type="text" id="txtTitle" /></td>
							
						<td width="*" colspan="2" rowspan="3">
						   <img id="imgTupian" width="200px" height="200px"
							src="${requestScope.zydownload.tupian}" />
							<div>
								<input type="file" name="upload" id="btnulTupian" />
							</div> <input type="hidden" id="hidTupian" name="tupian"
							value="${requestScope.zydownload.tupian}" />
						</td>
					</tr>

					<tr>
						<td align="right">资源分类:</td>
						<td><select name="fenlei" id="ddlFenlei" class="dropdown">
								<option value="学习资料下载">学习资料下载</option>
								<option value="共享资料下载">共享资料下载</option>
						</select></td>
					</tr>

					
					<tr>
						<td align="right">附件</td>
						<td colspan="3">
							<div>
								<input type="file" name="upload" id="upload" />
							</div>
							<div id="filelist" style="display:none;" class="uploadify-queue">
								<div class="uploadify-queue-item">
									<ul>
									</ul>
								</div>
							</div> 
							<%
							 	String id = request.getParameter("id");
							 	if (id != null) {
							 %>
							<div class="uploadify-queue">
								<ul>
									<%
									                List<Attachement> zydownloadattachementlist=attrSrv.getEntity(MessageFormat.format(" where belongtable=''zydownload'' and belongid=''{0}''",id));
									                for(Attachement tema : zydownloadattachementlist)
									                {
									            %>
									<li><input type='hidden' name='fileuploaded'
										value='<%=tema.getFilename() %>'/> <%=tema.getFilename() %>
											<a href="#" onclick="$(this).parent().remove();">移除</a>
									</li>
									<%
									            } %>
								</ul>
							</div> <%} %>
						</td>
					</tr>
					<tr>
											   <td align="right" >描述:</td>
											   <td colspan="3">
													<textarea   name="des"   id="txtDes" style="width:98%;height:400px;"  >${requestScope.zydownload.des}</textarea>
										</td>
						</tr>
						       
				        </table>
		     <div class="ui-button">
				<input type="submit" value="提交" id="Button1" class="ui-button-text" /> 
		     </div>
		</form>

</body>
</html>
