package com.daowen.controller;

import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Attachement;
import com.daowen.entity.Zydownload;
import com.daowen.service.AttachementService;
import com.daowen.service.ZydownloadService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class ZydownloadController extends SimpleController {

	@Autowired
	private  ZydownloadService zydownloadSrv=null;
	@Autowired
	private  AttachementService attrSrv=null;
	@Override
	@RequestMapping("/admin/zydownloadmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		zydownloadSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String fenlei = request.getParameter("fenlei");
		String dlcount = request.getParameter("dlcount");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		SimpleDateFormat sdfzydownload = new SimpleDateFormat("yyyy-MM-dd");
		Zydownload zydownload = new Zydownload();
		zydownload.setTitle(title == null ? "" : title);
		zydownload.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				zydownload.setPubtime(sdfzydownload.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			zydownload.setPubtime(new Date());
		}
		zydownload.setFenlei(fenlei == null ? "" : fenlei);
		zydownload.setDlcount(dlcount == null ? 0 : new Integer(dlcount));
		zydownload.setTupian(tupian == null ? "" : tupian);
		zydownload.setDes(des == null ? "" : des);
		zydownloadSrv.save(zydownload);
		// 保存附件
		attachements(request,response,new Integer(zydownload.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/zydownloadmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	public void attachements(HttpServletRequest request,
			HttpServletResponse response, String belongid) {
		attrSrv.delete(MessageFormat.format(
				" where belongid=''{0}'' and belongtable=''zydownload'' ",
				belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("zydownload");
			a.setUrl(request.getContextPath() + "/upload/temp/"
					+ a.getFilename());
			a.setTitle(a.getFilename());
			attrSrv.save(a);
		}
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Zydownload zydownload =zydownloadSrv.load(new Integer(id));
		if (zydownload == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String fenlei = request.getParameter("fenlei");
		String dlcount = request.getParameter("dlcount");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		SimpleDateFormat sdfzydownload = new SimpleDateFormat("yyyy-MM-dd");
		zydownload.setTitle(title);
		zydownload.setPubren(pubren);
		
		zydownload.setFenlei(fenlei);
		
		zydownload.setTupian(tupian);
		zydownload.setDes(des);
		zydownloadSrv.update(zydownload);
		attachements(request,response,new Integer(zydownload.getId()).toString());
		if (forwardurl == null) {
			forwardurl = "/admin/zydownloadmanager.do?actiontype=get";
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
			Zydownload zydownload = zydownloadSrv.load("where id=" + id);
			if (zydownload != null) {
				request.setAttribute("zydownload", zydownload);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/zydownloadadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String pubren=request.getParameter("pubren");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		
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
		List<Zydownload> listzydownload = zydownloadSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = zydownloadSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listzydownload", listzydownload);
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
			forwardurl = "/admin/zydownloadmanager.jsp";
		}
		forward(forwardurl);
	}
	
	
}
