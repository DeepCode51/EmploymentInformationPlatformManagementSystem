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
				<i class="fa fa-info"></i>  <b>网站资讯</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					
				   <li><a target="main"
						href="${pageContext.request.contextPath}/admin/zydownloadmanager.do?actiontype=get">下载文档管理</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get">新闻资讯管理</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load">发布新闻资讯</a>
					</li>
					
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get">新闻栏目</a>
					</li>
					

					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get">系统公告管理</a>
					</li>
					
					   <li>
		                   <a target="main" href="${pageContext.request.contextPath}/admin/gangweimanager.do?actiontype=get">岗位管理</a>
		
		            </li>


					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/commentmanager.do?actiontype=get">会员评论管理</a>
					</li>
				</ul>
			</dd>
		</dl>
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-info"></i>  <b>系统用户</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">

					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get">
							会员管理 </a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/qiyemanager.do?actiontype=get">
							企业管理 </a>
					</li>
					
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/qytypemanager.do?actiontype=get">
							企业分类管理 </a>
					</li>
					
						<li><a target="main"
						href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get&forwardurl=/admin/usersmanager.jsp">
							后台用户管理 </a>
					</li>
					
					


				</ul>
			</dd>
		</dl>
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-cog"></i> <b>网站设置 </b>
			</dt>
			<dd class="current">
				<ul class="sitemu">

					
					<li >
				<a target="main" href="${pageContext.request.contextPath}/admin/sitenavmanager.do?actiontype=get">网站导航管理</a>
			</li>
			<li>
				<a   target="main" href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get">首页栏目管理</a>
			</li>
			 <li>
				<a target="main" href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get">系统公告管理</a>
			</li>
			
			 <li>
				<a target="main" href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get">首页轮播图管理</a>
			</li>
			
			<li>
				<a target="main" href="${pageContext.request.contextPath}/admin/sysconfigmanager.do?actiontype=get">系统设置管理</a>
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
						href="${pageContext.request.contextPath}/admin/modifypw.jsp">修改密码</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/accountinfo.jsp">账户信息</a>
					</li>
					<li><a target="main"
						href="${pageContext.request.contextPath}/admin/modifyinfo.jsp">编辑信息</a>
					</li>
				</ul>
			</dd>
		</dl>

		<div class="clear"></div>
	</div>
</div>

