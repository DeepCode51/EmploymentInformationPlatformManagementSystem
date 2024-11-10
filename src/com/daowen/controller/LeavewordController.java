package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Leaveword;
import com.daowen.service.LeavewordService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class LeavewordController extends SimpleController {

	@Autowired
	private LeavewordService lwSrv = null;

	@Override
	@RequestMapping("/admin/leavewordmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	private void reply() {

		String id = request.getParameter("id");
		String replyren = request.getParameter("replyren");
		if (id == null)
			return;
		Leaveword leaveword = (Leaveword) lwSrv.load(new Integer(id));
		if (leaveword == null)
			return;

		String replycontent = request.getParameter("replycontent");
		leaveword.setReplycontent(replycontent);
		leaveword.setReplytime(new Date());
		leaveword.setReplyren(replyren);
		leaveword.setStatus(1);
		lwSrv.update(leaveword);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		try {
			response.sendRedirect(request.getContextPath()+ forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		lwSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String title = request.getParameter("title");
		String lwren = request.getParameter("currenthy");
		String replyren = request.getParameter("replyren");
		String dcontent = request.getParameter("dcontent");
		String replycontent = request.getParameter("replycontent");
		String photo = request.getParameter("photo");
		Leaveword leaveword = new Leaveword();
		leaveword.setTitle(title == null ? "" : title);
		leaveword.setLwren(lwren == null ? "" : lwren);

		leaveword.setPubtime(new Date());

		leaveword.setReplyren(replyren == null ? "" : replyren);

		leaveword.setReplytime(new Date());
		leaveword.setPhoto(photo);
		leaveword.setStatus(0);
		leaveword.setDcontent(dcontent == null ? "" : dcontent);
		leaveword.setReplycontent(replycontent == null ? "" : replycontent);
		lwSrv.save(leaveword);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Leaveword leaveword = lwSrv.load(new Integer(id));
		if (leaveword == null)
			return;
		String title = request.getParameter("title");
		String lwren = request.getParameter("lwren");
		String pubtime = request.getParameter("pubtime");
		String replyren = request.getParameter("replyren");
		String replytime = request.getParameter("replytime");
		String status = request.getParameter("status");
		String dcontent = request.getParameter("dcontent");
		String replycontent = request.getParameter("replycontent");
		SimpleDateFormat sdfleaveword = new SimpleDateFormat("yyyy-MM-dd");
		leaveword.setTitle(title);
		leaveword.setLwren(lwren);
		try {
			leaveword.setPubtime(sdfleaveword.parse(pubtime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		leaveword.setReplyren(replyren);
		try {
			leaveword.setReplytime(sdfleaveword.parse(replytime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		leaveword.setStatus(new Integer(status));
		leaveword.setDcontent(dcontent);
		leaveword.setReplycontent(replycontent);
		lwSrv.update(leaveword);

		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Leaveword leaveword = lwSrv.load("where id=" + id);
			if (leaveword != null) {
				request.setAttribute("leaveword", leaveword);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		//
		int pageindex = 1;
		int pagesize = 10;

		String title = request.getParameter("title");

		String lwren = request.getParameter("lwren");

		if (title != null)
			filter += "  and title like '%" + title + "%'  ";

		if (lwren != null)
			filter += " and lwren='" + lwren + "'";
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Leaveword> listleaveword = lwSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = lwSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listleaveword", listleaveword);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/leavewordmanager.jsp";
		}
		forward(forwardurl);
	}

}
