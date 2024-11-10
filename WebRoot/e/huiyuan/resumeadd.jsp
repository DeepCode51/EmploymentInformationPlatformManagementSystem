<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>简历</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">
        function initControl(){
                      $("#txtBirthday").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                      $("#txtBydate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                   //开始绑定
                    //结束绑定
                   //开始绑定
                    //结束绑定
                   //开始绑定
                    //结束绑定
			           $('#btnulXiangpian').uploadify({  
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
			                     $("#imgXiangpian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidXiangpian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
			                  }
			             }); 
			            var imgxiangpiansrc="${requestScope.resume.xiangpian}";
				       if(imgxiangpiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
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
            $("#resumeForm").validate();
        });  
    </script>
</head>
<body>
	 <jsp:include page="/e/head.jsp"></jsp:include>
		  <div class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="resumeadd.jsp">新增简历</a>
			</div>
    
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				
				<form name="resumeform" method="post"
					action="${pageContext.request.contextPath}/admin/resumemanager.do"
					id="resumeForm">
					<table class="grid" cellspacing="1" width="100%">
						<input type="hidden" name="id" value="${id}" />
						<input type="hidden" name="actiontype" value="${actiontype}" />
						<input type="hidden" name="seedid" value="${seedid}" />
						<input name="suoyouren"
								value="${huiyuan.accountname}"
								validate="{required:true,messages:{required:'请输入所有人'}}"
								type="hidden" id="txtSuoyouren" />
						<input type="hidden" name="forwardurl"
							value="/admin/resumemanager.do?actiontype=get&suoyouren=${huiyuan.accountname}&forwardurl=/e/huiyuan/resumemanager.jsp&seedid=101" />
						<tr>
							<td align="right">简历名:</td>
							<td ><input name="title" value="${requestScope.resume.title}"
								validate="{required:true,messages:{required:'请输入简历名'}}"
								class="input-txt" type="text" id="txtTitle" /></td>
							<td colspan="2" rowspan="6"><img id="imgXiangpian" width="200px" height="200px"
								src="${requestScope.resume.xiangpian}" />
								<div>
									<input type="file" name="upload" id="btnulXiangpian" />
								</div> <input type="hidden" id="hidXiangpian" name="xiangpian"
								value="${requestScope.resume.xiangpian}" /></td>
						</tr>
						<tr>
							<td align="right">姓名:</td>
							<td><input name="name" value="${requestScope.resume.name}"
								validate="{required:true,messages:{required:'请输入姓名'}}"
								class="input-txt" type="text" id="txtName" /></td>
							
						</tr>
						<tr>
							<td align="right">性别:</td>
							<td><input type="radio" name="sex" id="radSex" value="男"
								checked="checked">男 <input type="radio" name="sex"
									id="radSex" value="女">女 
							</td>
						</tr>
						<tr>
							<td align="right">出生年月:</td>
							<td><input name="birthday"
								value="${requestScope.resume.birthday}" type="text"
								id="txtBirthday" class="input-txt" validate="{required:true}" />
							</td>
						</tr>
						<tr>
							<td align="right">婚姻状况:</td>
							<td><input type="radio" name="hyzk" id="radHyzk" value="已婚"
								checked="checked">已婚 <input type="radio" name="hyzk"
									id="radHyzk" value="未婚">未婚 
							</td>
						</tr>
						<tr>
							<td align="right">民族:</td>
							<td><input name="mingzu"
								value="${requestScope.resume.mingzu}"
								validate="{required:true,messages:{required:'请输入民族'}}"
								class="input-txt" type="text" id="txtMingzu" /></td>
						</tr>
						<tr>
							<td align="right">籍贯:</td>
							<td><input name="jiguan"
								value="${requestScope.resume.jiguan}"
								validate="{required:true,messages:{required:'请输入籍贯'}}"
								class="input-txt" type="text" id="txtJiguan" /></td>
							<td align="right">工作年限:(年)</td>
							<td ><input name="gznianxian"
								value="${requestScope.resume.gznianxian}"
								validate="{required:true,number:true,min:1,max:20,messages:{required:'请输入工作年限',min:'最小为1年',max:'最多不能超过20年',number:'请输入正确年限'}}"
								class="input-txt" type="text" id="txtGznianxian" /></td>
						</tr>
						<tr>
							<td align="right">专业:</td>
							<td><input name="zhuanye"
								value="${requestScope.resume.zhuanye}"
								validate="{required:true,messages:{required:'请输入专业'}}"
								class="input-txt" type="text" id="txtZhuanye" /></td>
						
							<td align="right">学历:</td>
							<td><input name="xueli" value="${requestScope.resume.xueli}"
								validate="{required:true,messages:{required:'请输入学历'}}"
								class="input-txt" type="text" id="txtXueli" /></td>
						</tr>
						<tr>
							<td align="right">毕业时间:</td>
							<td><input name="bydate"
								value="${requestScope.resume.bydate}" type="text" id="txtBydate"
								class="input-txt" validate="{required:true}" /></td>
						
							<td align="right">联系电话:</td>
							<td><input name="lxtel" value="${requestScope.resume.lxtel}"
								validate="{required:true,messages:{required:'请输入联系电话'}}"
								class="input-txt" type="text" id="txtLxtel" /></td>
						</tr>
						<tr>
							<td align="right">邮箱:</td>
							<td><input name="email" value="${requestScope.resume.email}"
								validate="{required:true,email:true,messages:{required:'请输入邮箱',email:'请输入正确的邮箱格式'}}"
								class="input-txt" type="text" id="txtEmail" /></td>
						
							<td align="right">身高:（cm）</td>
							<td><input name="shengao"
								value="${requestScope.resume.shengao}"
								validate="{required:true,messages:{required:'请输入身高'}}"
								class="input-txt" type="text" id="txtShengao" /></td>
						</tr>
						<tr>
							<td align="right">政治面貌:</td>
							<td><select name="mianmao" id="ddlMianmao" ltype="select">
									<option value="党员">党员</option>
									<option value="群总">群总</option>
									<option value="团员">团员</option>
							</select></td>
						
							<td align="right">现从事行业:</td>
							<td>
							<input name="xchangye"
								value="${requestScope.resume.xchangye}"
								validate="{required:true,messages:{required:'请输入现从事行业'}}"
								class="input-txt" type="text"  />
							</td>
						</tr>
						<tr>
							
							<td align="right">期望薪水:(元)</td>
							<td><input name="qwxinshui"
								value="${requestScope.resume.qwxinshui}"
								validate="{required:true,messages:{required:'请输入期望薪水'}}"
								class="input-txt" type="text" id="txtQwxinshui" /></td>
						</tr>
						
						
						<tr>
							<td align="right">工作经历:</td>
							<td colspan="3"><textarea name="des" id="txtDes"
									style="width:98%;height:200px;">${requestScope.resume.des}</textarea>
							</td>
						</tr>
					</table>
					<div class="ui-button">
						<input type="submit" value="提交" id="Button1"
							class="ui-button-text" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
