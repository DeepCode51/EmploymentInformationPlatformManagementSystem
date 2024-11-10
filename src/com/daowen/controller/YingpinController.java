package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 职位应聘控制
 *
 */
@Controller
public class YingpinController extends SimpleController {
	@Autowired
	private YingpinService yingpinSrv = null;

	@Override
	@RequestMapping("/admin/yingpinmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		yingpinSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String zpid = request.getParameter("zpid");
		String zptitle = request.getParameter("zptitle");
		String poster = request.getParameter("poster");
		String postername = request.getParameter("postername");
		String resumeid = request.getParameter("resumeid");
		String resumetitle = request.getParameter("resumetitle");
		String posttime = request.getParameter("posttime");
		SimpleDateFormat sdfyingpin = new SimpleDateFormat("yyyy-MM-dd");
		Yingpin yingpin = new Yingpin();
		yingpin.setZpid(zpid == null ? "" : zpid);
		// 等待发送面试通知
		yingpin.setStatus(1);
		yingpin.setZptitle(zptitle == null ? "" : zptitle);
		yingpin.setPoster(poster == null ? "" : poster);
		yingpin.setPostername(postername == null ? "" : postername);
		yingpin.setResumeid(resumeid == null ? "" : resumeid);
		yingpin.setResumetitle(resumetitle == null ? "" : resumetitle);
		if (posttime != null) {
			try {
				yingpin.setPosttime(sdfyingpin.parse(posttime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			yingpin.setPosttime(new Date());
		}

		yingpinSrv.save(yingpin);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpinmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Yingpin yingpin = yingpinSrv.load(new Integer(id));
		if (yingpin == null)
			return;
		String zpid = request.getParameter("zpid");
		String zptitle = request.getParameter("zptitle");
		String poster = request.getParameter("poster");
		String postername = request.getParameter("postername");
		String resumeid = request.getParameter("resumeid");
		String resumetitle = request.getParameter("resumetitle");
		String posttime = request.getParameter("posttime");
		SimpleDateFormat sdfyingpin = new SimpleDateFormat("yyyy-MM-dd");
		yingpin.setZpid(zpid);
		yingpin.setZptitle(zptitle);
		yingpin.setPoster(poster);
		yingpin.setPostername(postername);
		yingpin.setResumeid(resumeid);
		yingpin.setResumetitle(resumetitle);
		if (posttime != null) {
			try {
				yingpin.setPosttime(sdfyingpin.parse(posttime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		yingpinSrv.update(yingpin);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpinmanager.do?actiontype=get";
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
		dispatchParams(request, response);
		if (id != null) {
			Yingpin yingpin = yingpinSrv.load("where id=" + id);
			if (yingpin != null) {
				request.setAttribute("yingpin", yingpin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpinadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String zptitle = request.getParameter("zptitle");
		String  zpid=request.getParameter("zpid");
		String  poster=request.getParameter("poster");
		if (zptitle != null)
			filter += "  and zptitle like '%" + zptitle + "%'  ";
		
		if(zpid!=null)
			filter+=" and  zpid='"+zpid+"'";
		
		if(poster!=null)
			 filter+= " and poster='"+poster+"'";
		int pageindex = 1;
		int pagesize = 10;
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
		List<Yingpin> listyingpin = yingpinSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = yingpinSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listyingpin", listyingpin);
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
			forwardurl = "/admin/yingpinmanager.jsp";
		}
		forward(forwardurl);
	}
}
