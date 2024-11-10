<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

    $(function () {

        $("#divAccordion dl dt").click(function () {

            $("#divAccordion dl").removeClass("current").addClass("bitem2");
            $("#divAccordion dl dd").hide();

            $(this).siblings("dd").show();
            $(this).parent().addClass("current");

        });

        $(".sitemu li").click(function () {

            $(".sitemu li").removeClass("selected");
            $(this).addClass("selected");

        });

        var menuid = '<%=request.getParameter("menuid")%>';

		if (menuid != "") {
			$("#" + menuid).addClass("selected");
			$("#divAccordion dl dd").hide();
			$("#" + menuid).closest("dd").show().parent().addClass("current");
		}

	})
</script>
<div class="left">
	<div style="width: 145px; height: 480px; padding: 0; margin: 0"
		id="divAccordion">
		<div class="bgtop">
			<b>系统菜单</b>
		</div>

		
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-user"></i> <b>招聘管理</b>
			</dt>
			<dd>
			<ul class="sitemu">
			<li>
			   	<a   target="main"  target="main" href="${pageContext.request.contextPath}/admin/zhaopinmanager.do?actiontype=get&pubren=${qiye.accountname}&forwardurl=/qiye/zhaopinmanager.jsp">招聘管理</a>

			</li>
			
			<li>
			   	<a   target="main"  target="main" href="${pageContext.request.contextPath}/admin/zhaopinmanager.do?actiontype=load&forwardurl=/qiye/zhaopinadd.jsp">发布招聘信息</a>

			</li>
			
			<li>
			   	<a   target="main"  target="main" href="${pageContext.request.contextPath}/admin/gangweimanager.do?actiontype=get&forwardurl=/qiye/gangweimanager.jsp">岗位管理</a>

			</li>

				</ul>
			</dd>
		</dl>
	
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-user"></i>  <b>账户管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					
					<li><a target="main"
						href="${pageContext.request.contextPath}/qiye/modifypw.jsp">修改密码</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/qiye/accountinfo.jsp">账户信息</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/qiye/modifyinfo.jsp">编辑信息</a>
					</li>
				</ul>
			</dd>
		</dl>

		<div class="clear"></div>
	</div>
</div>

