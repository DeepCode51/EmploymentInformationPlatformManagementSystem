<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
       Qiye qiye= (Qiye)request.getSession().getAttribute("qiye");
	  QiyeService qiyeSrv=BeansUtil.getBean("qiyeService",QiyeService.class);
	  QytypeService qytypeSrv=BeansUtil.getBean("qytypeService", QytypeService.class);
	 if(qiye!=null)
	 {
	     Qiye temqiye   =qiyeSrv.load("where id="+((Qiye)qiye).getId());
	      request.setAttribute("qiye",temqiye);
	 }
				List<Qiye> xingzhi_datasource=qytypeSrv.getEntity("");
			    request.setAttribute("xingzhi_datasource",xingzhi_datasource);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>企业信息</title>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
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
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#teacherForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>账户信息管理</h2>
		<div class="description">修改帐户信息</div>
	</div>
	<form name="qiyeform" method="post"
		action="${pageContext.request.contextPath}/admin/qiyemanager.do"
		id="qiyeForm">
		<input type="hidden" name="actiontype" value="update" /> <input
			type="hidden" name="id" value="${requestScope.qiye.id}" /> <input
			type="hidden" name="forwardurl"
			value="/qiye/accountinfo.jsp?seedid=101" />
		<table border="0" cellspacing="1" class="grid" cellpadding="0"
			width="100%">
			<tr>
				<td height="30" align="right">账号:</td>
				<td>${requestScope.qiye.accountname}<input name="accountname"
					value="${requestScope.qiye.accountname}" class="input-txt"
					type="hidden" id="txtAccountname"
					validate="{required:true,messages:{required:'请输入账号'}}" /></td>
				<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px"
					height="200px" src="${requestScope.qiye.photo}" />
					<div>
						<input type="file" name="upload" id="btnulPhoto" />
					</div> <input type="hidden" id="hidPhoto" name="photo"
					value="${requestScope.qiye.photo}" /></td>
			</tr>

			<tr>
				<td height="30" align="right">企业名称:</td>
				<td><input name="name" value="${requestScope.qiye.name}"
					class="input-txt" type="text" id="txtName"
					validate="{required:true,messages:{required:'请输入企业名称'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">法人:</td>
				<td><input name="lawor" value="${requestScope.qiye.lawor}"
					class="input-txt" type="text" id="txtLawor"
					validate="{required:true,messages:{required:'请输入法人'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">企业性质:</td>
				<td>${requestScope.qiye.xingzhi}<input name="xingzhi"
					value="${requestScope.qiye.xingzhi}" class="input-txt"
					type="hidden"
					validate="{required:true,messages:{required:'请输入企业性质'}}" />

				</td>
			</tr>
			<tr>
				<td height="30" align="right">注册日期:</td>
				<td><input name="regdate" value="${requestScope.qiye.regdate}"
					type="text" id="txtRegdate" class="input-txt"
					validate="{required:true,messages:{required:'请选择日期'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">人数:</td>
				<td><input name="renshu" value="${requestScope.qiye.renshu}"
					class="input-txt" type="text" id="txtRenshu"
					validate="{required:true,messages:{required:'请输入人数'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">营业执照号:</td>
				<td><input name="zhizhaono"
					value="${requestScope.qiye.zhizhaono}" class="input-txt"
					type="text" id="txtZhizhaono"
					validate="{required:true,messages:{required:'请输入营业执照号'}}" /></td>

				<td height="30" align="right">法人身份证号:</td>
				<td><input name="idcardno"
					value="${requestScope.qiye.idcardno}" class="input-txt" type="text"
					id="txtIdcardno"
					validate="{required:true,messages:{required:'请输入法人身份证号'}}" /></td>
			</tr>
			<tr>
				<td height="30" align="right">企业地址:</td>
				<td><input name="address" value="${requestScope.qiye.address}"
					class="input-txt" type="text" id="txtAddress"
					validate="{required:true,messages:{required:'请输入企业地址'}}" /></td>

				<td height="30" align="right">状态:</td>
				<td><input name="status" value="${requestScope.qiye.status}"
					class="input-txt" type="text" id="txtStatus"
					validate="{required:true,messages:{required:'请输入状态'}}" /></td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3"><textarea name="des" class="l-textarea"
						id="txtDes" style="width: 98%; height: 200px;">${requestScope.qiye.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">

					<button class="orange-button">提交</button>

				</td>
			</tr>
		</table>
	</form>
</body>
</html>
