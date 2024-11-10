<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>招聘</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	  //开始绑定
	/* $("#gwtype").change(function(){
			        	      $("[name=name]").val($("#gwtype option:selected").text());
			               })*/
                    //结束绑定
                      $("#txtPubtime").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
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
			          var imgtupiansrc="${requestScope.zhaopin.tupian}";
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
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#zhaopinForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建招聘</h2>
		<div class="description"></div>
	</div>
	<form name="zhaopinform" method="post"
		action="${pageContext.request.contextPath}/admin/zhaopinmanager.do"
		id="zhaopinForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/zhaopinadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/zhaopinmanager.do?actiontype=get&forwardurl=/admin/zhaopinmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">职位名称:</td>
				<td><input name="title" placeholder="职位名称"
					validate="{required:true,messages:{required:'请输入职位名称'}}"
					value="${requestScope.zhaopin.title}" class="input-txt" type="text"
					id="txtTitle" /></td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.zhaopin.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.zhaopin.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">岗位类别:</td>
				<td><web:dropdownlist name="gwtype" id="gwtype"
						cssclass="dropdown" value="${requestScope.zhaopin.gwtype}"
						datasource="${gwtype_datasource}" textfieldname="name"
						valuefieldname="name">
					</web:dropdownlist> </td>
			</tr>
			<tr>
				<td align="right">发布人:</td>
				<td><input name="pubren" placeholder="发布人"
					validate="{required:true,messages:{required:'请输入发布人'}}"
					value="${requestScope.zhaopin.pubren}" class="input-txt"
					type="text" id="txtPubren" /></td>
			</tr>
			
			<tr>
				<td align="right">职位待遇:</td>
				<td><input name="daiyu" placeholder="职位待遇"
					validate="{required:true,messages:{required:'请输入职位待遇'}}"
					value="${requestScope.zhaopin.daiyu}" class="input-txt" type="text"
					id="txtDaiyu" /></td>
			</tr>
			<tr>
				<td align="right">工作地:</td>
				<td><input name="gzdi" placeholder="工作地"
					validate="{required:true,messages:{required:'请输入工作地'}}"
					value="${requestScope.zhaopin.gzdi}" class="input-txt" type="text"
					id="txtGzdi" /></td>
			</tr>
			<tr>
				<td align="right">最低学历:</td>
				<td><input name="xueli" placeholder="最低学历"
					validate="{required:true,messages:{required:'请输入最低学历'}}"
					value="${requestScope.zhaopin.xueli}" class="input-txt" type="text"
					id="txtXueli" /></td>
			</tr>
			<tr>
				<td align="right">招聘人数:（人）</td>
				<td><input name="renshu" placeholder="招聘人数"
					validate="{required:true,digits:true,messages:{required:'请输入招聘人数',digits:'请输入正确的人数'}}"
					value="${requestScope.zhaopin.renshu}" class="input-txt"
					type="text" id="txtRenshu" />
				</td>
			</tr>
		
			<tr>
				<td align="right">岗位介绍:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:400px;">${requestScope.zhaopin.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">
						<i class="icon-ok icon-white"></i>提交
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
