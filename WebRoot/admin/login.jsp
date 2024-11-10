<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<style type="text/css">
body {
	background-color: #3b5d88;
}
</style>

<link
	href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/login.css">

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"
	type="text/javascript"></script>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"
	type="text/javascript"></script>
<script type="text/javascript">
	if (top.window != window)
		top.location.href = "login.jsp";

	$(function() {

		$("#btnReloadImage,#imgvc").on("click",function() {

			$("#imgvc").prop("src","../plusin/image.jsp?time="+ new Date().getMilliseconds());

		});
		$("#loginForm").submit(function() {

			//alert($("#txtUsername").val());
			if ($("#txtUsername").val() == "") {
				alert("用户名不能为空");
				return false;
			}
			return true;

		});

	});
</script>


</head>
<body>
	<form method="post"
		action="${pageContext.request.contextPath}/admin/login.do" id="loginForm">

		<input type="hidden" name="actiontype" value="login" /> <input
			type="hidden" name="forwardurl" value="/admin/index.jsp" />
		<div class="center-container">

			<div class="login-container">

				<div class="systitle">就业信息平台</div>



				<p>后台登陆</p>
				<div class="input-group form-row">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> <input type="text" name="username"
						style="font-size: 18px; font-weight: 600;" value="${username}" placeholder="系统账号"
						class="input" />
				</div>

				<div class="input-group  form-row">
					<span class="input-group-addon"> <i class="fa fa-lock"></i>
					</span> <input type="password" name="password"  value="${password}"
						style="font-size: 18px; font-weight: 600;" placeholder="登陆密码"
						class="input" />
				</div>
				
				<div class="input-group  form-row">
					<span class="input-group-addon"> <i class="fa fa-user"></i>
					</span> 
					<input type="radio" name="usertype" value="0" checked="checked"/>管理员
					<input type="radio" name="usertype" value="1" />企业
				</div>
				<div class="form-row">

                   <div style="margin-right:50px;" class="input-group">
					<div style="padding: 0px;" class="input-group-addon dl-icon-left">

						<img id="imgvc" class='validatecode' src="../plusin/image.jsp"
							width="70" height="47" alt="图片看不清？点击重新得到验证码"
							style="cursor: pointer;" />
					</div>
					<input type="text" name="validcode" value="${validcode}"
						style="font-size:18px;width:100px;padding-left:20px; font-weight:600;" placeholder="验证码"
						class="input"/>
					<span id="btnReloadImage"
						style="cursor: pointer;" class="input-group-addon dl-icon-left">
						看不清换一组 </span>
				   </div>

				</div>

				

				<div class="form-row">

					<span> 
					  ${errmsg}
					</span>

					<button class="btn btn-success btn-large fn-righ">登录</button>

				</div>
				<div class="form-row">


					
				</div>


			</div>


		</div>


	</form>



	

	</form>
</body>
</html>