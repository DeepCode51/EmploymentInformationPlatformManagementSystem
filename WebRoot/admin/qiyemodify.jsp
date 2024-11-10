<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>企业信息</title>
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
	/* $("#xingzhi").change(function(){
			        	      $("[name=name]").val($("#xingzhi option:selected").text());
			               })*/
                    //结束绑定
                      $("#txtRegdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			           $('#btnulPhoto').uploadify({  
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
			                     $("#imgPhoto").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidPhoto").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgphotosrc="${requestScope.qiye.photo}";
				       if(imgphotosrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgPhoto").attr("src",url);
				         $("#hidPhoto").val(url);
				       }else
				       {
				          $("#imgPhoto").attr("src",imgphotosrc);
				          $("#hidPhoto").val(imgphotosrc); 
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
            $("#qiyeForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>更新企业信息</h2>
		<div class="description"></div>
	</div>
	<form name="qiyeform" method="post"
		action="${pageContext.request.contextPath}/admin/qiyemanager.do"
		id="qiyeForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/qiyeadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/qiyemanager.do?actiontype=get&forwardurl=/admin/qiyemanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">账号:</td>
				<td>${qiye.accountname}<input name="accountname" placeholder="账号"
					validate="{required:true,messages:{required:'请输入账号'}}"
					value="${requestScope.qiye.accountname}" class="input-txt"
					type="hidden" id="txtAccountname" /></td>
				<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
					src="${requestScope.qiye.photo}" />
					<div>
						<input type="file" name="upload" id="btnulPhoto" />
					</div> <input type="hidden" id="hidPhoto" name="photo"
					value="${requestScope.qiye.photo}" /></td>
			</tr>
			
			<tr>
				<td align="right">企业名称:</td>
				<td><input name="name" placeholder="企业名称"
					validate="{required:true,messages:{required:'请输入企业名称'}}"
					value="${requestScope.qiye.name}" class="input-txt" type="text"
					id="txtName" /></td>
			</tr>
			<tr>
				<td align="right">法人:</td>
				<td><input name="lawor" placeholder="法人"
					validate="{required:true,messages:{required:'请输入法人'}}"
					value="${requestScope.qiye.lawor}" class="input-txt" type="text"
					id="txtLawor" /></td>
			</tr>
			<tr>
				<td align="right">企业性质:</td>
				<td><web:dropdownlist name="xingzhi" id="xingzhi"
						cssclass="dropdown" value="${requestScope.qiye.xingzhi}"
						datasource="${xingzhi_datasource}" textfieldname="name"
						valuefieldname="name">
					</web:dropdownlist>
				</td>
			</tr>
			<tr>
				<td align="right">注册日期:</td>
				<td><input name="regdate" value="${requestScope.qiye.regdate}"
					type="text" id="txtRegdate" class="input-txt"
					validate="{required:true}" /></td>
			</tr>
			<tr>
				<td align="right">人数:</td>
				<td><input name="renshu" placeholder="人数"
					validate="{required:true,messages:{required:'请输入人数'}}"
					value="${requestScope.qiye.renshu}" class="input-txt" type="text"
					id="txtRenshu" /></td>
			</tr>
			<tr>
				<td align="right">营业执照号:</td>
				<td><input name="zhizhaono" placeholder="营业执照号"
					validate="{required:true,messages:{required:'请输入营业执照号'}}"
					value="${requestScope.qiye.zhizhaono}" class="input-txt"
					type="text" id="txtZhizhaono" /></td>
			
				<td align="right">法人身份证号:</td>
				<td><input name="idcardno" placeholder="法人身份证号"
					validate="{required:true,messages:{required:'请输入法人身份证号'}}"
					value="${requestScope.qiye.idcardno}" class="input-txt" type="text"
					id="txtIdcardno" /></td>
			</tr>
			<tr>
				<td align="right">企业地址:</td>
				<td><input name="address" placeholder="企业地址"
					validate="{required:true,messages:{required:'请输入企业地址'}}"
					value="${requestScope.qiye.address}" class="input-txt" type="text"
					id="txtAddress" /></td>
			</tr>
		
			<tr>
				<td align="right">说明:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:200px;">${requestScope.qiye.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div></td>
			</tr>
		</table>
	</form>
</body>
</html>
