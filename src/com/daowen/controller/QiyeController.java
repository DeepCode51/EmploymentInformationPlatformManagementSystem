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
 * 企业信息控制
 *
 */
@Controller
public class QiyeController extends SimpleController {
	@Autowired
	private QiyeService qiyeSrv = null;
	@Autowired
	private QytypeService qytypeSrv = null;

	@Override
	@RequestMapping("/admin/qiyemanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String repassword2 = request.getParameter("repassword2");
		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Qiye qiye = qiyeSrv.load(new Integer(id));
		if (qiye != null) {
			if (!qiye.getPassword().equals(password1)) {
				request.setAttribute("errormsg",
						"<label class='error'>原始密码不正确，不能修改</label>");
				forward(errorpageurl);
			} else {
				qiye.setPassword(repassword1);
				qiyeSrv.update(qiye);
				request.getSession().setAttribute("qiye", qiye);
				if (forwardurl != null)
					forward(forwardurl);
			}
		}
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
		qiyeSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String accountname = request.getParameter("accountname");
		String name = request.getParameter("name");
		String lawor = request.getParameter("lawor");
		String xingzhi = request.getParameter("xingzhi");
		String regdate = request.getParameter("regdate");
		String renshu = request.getParameter("renshu");
		String zhizhaono = request.getParameter("zhizhaono");
		String photo = request.getParameter("photo");
		String idcardno = request.getParameter("idcardno");
		String address = request.getParameter("address");
		String status = request.getParameter("status");
		String des = request.getParameter("des");
		SimpleDateFormat sdfqiye = new SimpleDateFormat("yyyy-MM-dd");
		Qiye qiye = new Qiye();
		qiye.setAccountname(accountname == null ? "" : accountname);
		qiye.setPassword("123456");
		qiye.setName(name == null ? "" : name);
		qiye.setLawor(lawor == null ? "" : lawor);
		qiye.setXingzhi(xingzhi == null ? "" : xingzhi);
		if (regdate != null) {
			try {
				qiye.setRegdate(sdfqiye.parse(regdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			qiye.setRegdate(new Date());
		}
		qiye.setRenshu(renshu == null ? "" : renshu);
		qiye.setZhizhaono(zhizhaono == null ? "" : zhizhaono);
		qiye.setPhoto(photo == null ? "" : photo);
		qiye.setIdcardno(idcardno == null ? "" : idcardno);
		qiye.setAddress(address == null ? "" : address);
		qiye.setStatus("营业中");
		qiye.setDes(des == null ? "" : des);
		// 产生验证
		Boolean validateresult = qiyeSrv.isExist("where accountname='"
				+ accountname + "'");
		if (validateresult) {
			
				request.setAttribute("errormsg",
						"<label class='error'>已经存在的账户号</label>");
				request.setAttribute("qiye", qiye);
				request.setAttribute("actiontype", "save");
				forward(errorurl);
			
			return;
		}
		qiyeSrv.save(qiye);
		if (forwardurl == null) {
			forwardurl = "/admin/qiyemanager.do?actiontype=get";
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
		Qiye qiye = qiyeSrv.load(new Integer(id));
		if (qiye == null)
			return;
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String lawor = request.getParameter("lawor");
		String xingzhi = request.getParameter("xingzhi");
		String regdate = request.getParameter("regdate");
		String renshu = request.getParameter("renshu");
		String zhizhaono = request.getParameter("zhizhaono");
		String photo = request.getParameter("photo");
		String idcardno = request.getParameter("idcardno");
		String address = request.getParameter("address");
		String status = request.getParameter("status");
		String des = request.getParameter("des");
		SimpleDateFormat sdfqiye = new SimpleDateFormat("yyyy-MM-dd");
		qiye.setAccountname(accountname);
		
		qiye.setName(name);
		qiye.setLawor(lawor);
		qiye.setXingzhi(xingzhi);
		if (regdate != null) {
			try {
				qiye.setRegdate(sdfqiye.parse(regdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		qiye.setRenshu(renshu);
		qiye.setZhizhaono(zhizhaono);
		qiye.setPhoto(photo);
		qiye.setIdcardno(idcardno);
		qiye.setAddress(address);
		
		qiye.setDes(des);
		qiyeSrv.update(qiye);
		if (forwardurl == null) {
			forwardurl = "/admin/qiyemanager.do?actiontype=get";
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
			Qiye qiye = qiyeSrv.load("where id=" + id);
			if (qiye != null) {
				request.setAttribute("qiye", qiye);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> xingzhi_datasource = qytypeSrv.getEntity("");
		request.setAttribute("xingzhi_datasource", xingzhi_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/qiyeadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String accountname = request.getParameter("accountname");
		if (accountname != null)
			filter += "  and accountname like '%" + accountname + "%'  ";
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
		List<Qiye> listqiye = qiyeSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = qiyeSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listqiye", listqiye);
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
			forwardurl = "/admin/qiyemanager.jsp";
		}
		forward(forwardurl);
	}
}
