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
 * 招聘控制
 *
 */
@Controller
public class ZhaopinController extends SimpleController {
	@Autowired
	private ZhaopinService zhaopinSrv = null;
	@Autowired
	private GangweiService gangweiSrv = null;
	@Autowired
	private ResumeService  resumeSrv=null;
	@Autowired
	private YingpinService  yingpinSrv=null;

	
	
	@Override
	@RequestMapping("/admin/zhaopinmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}
	
	
	private void yingpin() {

		String id = request.getParameter("id");

		String poster = request.getParameter("poster");
		String postername = request.getParameter("postername");

		String forwardurl = request.getParameter("forwardurl");

		String resumeid = request.getParameter("resume");
		String zptitle = request.getParameter("zptitle");

		Resume resume = resumeSrv.load("where id=" + resumeid);

		if (resume != null) {
			Yingpin yingpin = new Yingpin();

			yingpin.setPoster(poster);
			//
			yingpin.setPostername(postername);
			yingpin.setPosttime(new Date());
			yingpin.setResumeid(resumeid);
			yingpin.setResumetitle(resume.getTitle());
			yingpin.setZpid(id);
			yingpin.setStatus(1);
			yingpin.setZptitle(zptitle);
			yingpinSrv.save(yingpin);

		}

		redirect(forwardurl);
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
		zhaopinSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String gwtype = request.getParameter("gwtype");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String daiyu = request.getParameter("daiyu");
		String gzdi = request.getParameter("gzdi");
		String xueli = request.getParameter("xueli");
		String renshu = request.getParameter("renshu");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		SimpleDateFormat sdfzhaopin = new SimpleDateFormat("yyyy-MM-dd");
		Zhaopin zhaopin = new Zhaopin();
		zhaopin.setTitle(title == null ? "" : title);
		zhaopin.setGwtype(gwtype == null ? "" : gwtype);
		zhaopin.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				zhaopin.setPubtime(sdfzhaopin.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			zhaopin.setPubtime(new Date());
		}
		zhaopin.setDaiyu(daiyu == null ? "" : daiyu);
		zhaopin.setGzdi(gzdi == null ? "" : gzdi);
		zhaopin.setXueli(xueli == null ? "" : xueli);
		zhaopin.setRenshu(renshu == null ? 0 : new Integer(renshu));
		zhaopin.setTupian(tupian == null ? "" : tupian);
		zhaopin.setDes(des == null ? "" : des);
		zhaopinSrv.save(zhaopin);
		if (forwardurl == null) {
			forwardurl = "/admin/zhaopinmanager.do?actiontype=get";
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
		Zhaopin zhaopin = zhaopinSrv.load(new Integer(id));
		if (zhaopin == null)
			return;
		String title = request.getParameter("title");
		String gwtype = request.getParameter("gwtype");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String daiyu = request.getParameter("daiyu");
		String gzdi = request.getParameter("gzdi");
		String xueli = request.getParameter("xueli");
		String renshu = request.getParameter("renshu");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		SimpleDateFormat sdfzhaopin = new SimpleDateFormat("yyyy-MM-dd");
		zhaopin.setTitle(title);
		zhaopin.setGwtype(gwtype);
		zhaopin.setPubren(pubren);
		if (pubtime != null) {
			try {
				zhaopin.setPubtime(sdfzhaopin.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		zhaopin.setDaiyu(daiyu);
		zhaopin.setGzdi(gzdi);
		zhaopin.setXueli(xueli);
		zhaopin.setRenshu(renshu == null ? 0 : new Integer(renshu));
		zhaopin.setTupian(tupian);
		zhaopin.setDes(des);
		zhaopinSrv.update(zhaopin);
		if (forwardurl == null) {
			forwardurl = "/admin/zhaopinmanager.do?actiontype=get";
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
			Zhaopin zhaopin = zhaopinSrv.load("where id=" + id);
			if (zhaopin != null) {
				request.setAttribute("zhaopin", zhaopin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> gwtype_datasource = gangweiSrv.getEntity("");
		request.setAttribute("gwtype_datasource", gwtype_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/zhaopinadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String  pubren=request.getParameter("pubren");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";

		if(pubren!=null){
			
			filter+=" and pubren='"+pubren+"'";
			
		}
		//
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
		List<Zhaopin> listzhaopin = zhaopinSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = zhaopinSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listzhaopin", listzhaopin);
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
			forwardurl = "/admin/zhaopinmanager.jsp";
		}
		forward(forwardurl);
	}
}
