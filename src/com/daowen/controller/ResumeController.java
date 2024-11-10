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
 * 简历控制
 *
 */
 @Controller
public class ResumeController extends  SimpleController{
     @Autowired
       private ResumeService  resumeSrv=null;
       @Override
	@RequestMapping("/admin/resumemanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
       /********************************************************
   	 ****************** 信息注销监听支持*****************************
   	 *********************************************************/
   	public void delete() {
   		String id = request.getParameter("id");
   		resumeSrv.delete(" where id=" + id);
   		get();
   	}

   	/*************************************************************
   	 **************** 保存动作监听支持******************************
   	 **************************************************************/
   	public void save() {
   		String forwardurl = request.getParameter("forwardurl");
   		String title = request.getParameter("title");
   		String name = request.getParameter("name");
   		String sex = request.getParameter("sex");
   		String birthday = request.getParameter("birthday");
   		String hyzk = request.getParameter("hyzk");
   		String mingzu = request.getParameter("mingzu");
   		String jiguan = request.getParameter("jiguan");
   		String zhuanye = request.getParameter("zhuanye");
   		String xueli = request.getParameter("xueli");
   		String bydate = request.getParameter("bydate");
   		String lxtel = request.getParameter("lxtel");
   		String email = request.getParameter("email");
   		String shengao = request.getParameter("shengao");
   		String mianmao = request.getParameter("mianmao");
   		String xchangye = request.getParameter("xchangye");
   		String qzhangye = request.getParameter("qzhangye");
   		String qwxinshui = request.getParameter("qwxinshui");
   		String gznianxian = request.getParameter("gznianxian");
   		String xiangpian = request.getParameter("xiangpian");
   		String suoyouren = request.getParameter("suoyouren");
   		String status = request.getParameter("status");
   		String des = request.getParameter("des");
   		SimpleDateFormat sdfresume = new SimpleDateFormat("yyyy-MM-dd");
   		Resume resume = new Resume();
   		resume.setTitle(title == null ? "" : title);
   		resume.setName(name == null ? "" : name);
   		resume.setSex(sex == null ? "" : sex);
   		if (birthday != null) {
   			try {
   				resume.setBirthday(sdfresume.parse(birthday));
   			} catch (ParseException e) {
   				e.printStackTrace();
   			}
   		} else {
   			resume.setBirthday(new Date());
   		}
   		resume.setHyzk(hyzk == null ? "" : hyzk);
   		resume.setMingzu(mingzu == null ? "" : mingzu);
   		resume.setJiguan(jiguan == null ? "" : jiguan);
   		resume.setZhuanye(zhuanye == null ? "" : zhuanye);
   		resume.setXueli(xueli == null ? "" : xueli);
   		if (bydate != null) {
   			try {
   				resume.setBydate(sdfresume.parse(bydate));
   			} catch (ParseException e) {
   				e.printStackTrace();
   			}
   		} else {
   			resume.setBydate(new Date());
   		}
   		resume.setLxtel(lxtel == null ? "" : lxtel);
   		resume.setEmail(email == null ? "" : email);
   		resume.setShengao(shengao == null ? "" : shengao);
   		resume.setMianmao(mianmao == null ? "" : mianmao);
   		resume.setXchangye(xchangye == null ? "" : xchangye);
   		resume.setQzhangye(qzhangye == null ? "" : qzhangye);
   		resume.setQwxinshui(qwxinshui == null ? "" : qwxinshui);
   		resume.setGznianxian(gznianxian == null ? (double) 0 : new Double(
   				gznianxian));
   		resume.setXiangpian(xiangpian == null ? "" : xiangpian);
   		resume.setSuoyouren(suoyouren == null ? "" : suoyouren);
   		resume.setStatus("已入库");
   		resume.setDes(des == null ? "" : des);
   		resume.setClickcount(0);
   		resumeSrv.save(resume);
   		
   		if (forwardurl == null) {
   			forwardurl = "/admin/resumemanager.do?actiontype=get";
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
   		Resume resume =resumeSrv.load(new Integer(id));
   		if (resume == null)
   			return;
   		String title = request.getParameter("title");
   		String name = request.getParameter("name");
   		String sex = request.getParameter("sex");
   		String birthday = request.getParameter("birthday");
   		String hyzk = request.getParameter("hyzk");
   		String mingzu = request.getParameter("mingzu");
   		String jiguan = request.getParameter("jiguan");
   		String zhuanye = request.getParameter("zhuanye");
   		String xueli = request.getParameter("xueli");
   		String bydate = request.getParameter("bydate");
   		String lxtel = request.getParameter("lxtel");
   		String email = request.getParameter("email");
   		String shengao = request.getParameter("shengao");
   		String mianmao = request.getParameter("mianmao");
   		String xchangye = request.getParameter("xchangye");
   		String qzhangye = request.getParameter("qzhangye");
   		String qwxinshui = request.getParameter("qwxinshui");
   		String gznianxian = request.getParameter("gznianxian");
   		String xiangpian = request.getParameter("xiangpian");
   		String suoyouren = request.getParameter("suoyouren");
   		String status = request.getParameter("status");
   		String des = request.getParameter("des");
   		SimpleDateFormat sdfresume = new SimpleDateFormat("yyyy-MM-dd");
   		resume.setTitle(title);
   		resume.setName(name);
   		resume.setSex(sex);
   		if (birthday != null) {
   			try {
   				resume.setBirthday(sdfresume.parse(birthday));
   			} catch (ParseException e) {
   				e.printStackTrace();
   			}
   		}
   		resume.setHyzk(hyzk);
   		resume.setMingzu(mingzu);
   		resume.setJiguan(jiguan);
   		resume.setZhuanye(zhuanye);
   		resume.setXueli(xueli);
   		if (bydate != null) {
   			try {
   				resume.setBydate(sdfresume.parse(bydate));
   			} catch (ParseException e) {
   				e.printStackTrace();
   			}
   		}
   		resume.setLxtel(lxtel);
   		resume.setEmail(email);
   		resume.setShengao(shengao);
   		resume.setMianmao(mianmao);
   		resume.setXchangye(xchangye);
   		resume.setQzhangye(qzhangye);
   		resume.setQwxinshui(qwxinshui);
   		resume.setGznianxian(gznianxian == null ? (double) 0 : new Double(
   				gznianxian));
   		resume.setXiangpian(xiangpian);
   		resume.setSuoyouren(suoyouren);
   		
   		resume.setDes(des);
   		resumeSrv.update(resume);
   		
   		if (forwardurl == null) {
   			forwardurl = "/admin/resumemanager.do?actiontype=get";
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
   			Resume resume = resumeSrv.load("where id=" + id);
   			if (resume != null) {
   				request.setAttribute("resume", resume);
   			}
   			actiontype = "update";
   			request.setAttribute("id", id);
   		}
   		request.setAttribute("actiontype", actiontype);
   		
   		String forwardurl = request.getParameter("forwardurl");
   		System.out.println("forwardurl=" + forwardurl);
   		if (forwardurl == null) {
   			forwardurl = "/admin/resumeadd.jsp";
   		}
   		forward(forwardurl);
   	}

   	/******************************************************
   	 *********************** 数据绑定内部支持*********************
   	 *******************************************************/
   	public void get() {
   		String filter = "where 1=1 ";
   		String title = request.getParameter("title");
   		String suoyouren=request.getParameter("suoyouren");
   		if (title != null)
   			filter += "  and title like '%" + title + "%'  ";
   		//
   		if (suoyouren != null)
   			filter += "  and suoyouren='" + suoyouren + "'  ";
   		
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
   		List<Resume> listresume = resumeSrv.getPageEntitys(filter,
   				pageindex, pagesize);
   		int recordscount = resumeSrv.getRecordCount(filter == null ? ""
   				: filter);
   		request.setAttribute("listresume", listresume);
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
   			forwardurl = "/admin/resumemanager.jsp";
   		}
   		forward(forwardurl);
   	}
}
