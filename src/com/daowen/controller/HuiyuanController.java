package com.daowen.controller;

import java.text.MessageFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Huiyuan;
import com.daowen.service.HuiyuanService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class HuiyuanController extends SimpleController {

	@Autowired
	private HuiyuanService huiyuanSrv=null;

	@RequestMapping("/admin/huiyuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		this.mappingMethod(request, response);
	}
	
	

	public void exit() {

		if (request.getSession().getAttribute("huiyuan") != null) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");

		}
		

	}
	
	public void login() {
		String usertype = request.getParameter("usertype");
		
		if (usertype != null && usertype.equals("0")) {
			huiyuanLogin();
		}
	}
	private void huiyuanLogin() {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");

		String filter = MessageFormat.format("where accountname=''{0}'' and password=''{1}''", accountname,
				password);
		Huiyuan huiyuan = (Huiyuan) huiyuanSrv.load(filter);
		String errorurl=request.getParameter("errorurl");
		String forwardurl=request.getParameter("forwardurl");
        if(huiyuan==null){
        	dispatchParams(request, response);
        	request.setAttribute("errormsg", "<label class='error'>系统账户和密码不匹配</label>");
        	forward(errorurl);
        	return;
        }
        	
		if (huiyuan.getPassword().equals(password)) {
			huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			if (forwardurl == null||"".equals(forwardurl))
				forwardurl = "/e/huiyuan/accountinfo.jsp";
			redirect(forwardurl);
		}

	}
	

	public void save() {
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
        String idcardno=request.getParameter("idcardno");
		String email = request.getParameter("email");
		String  mobile=request.getParameter("mobile");
		String  address=request.getParameter("address");
		String  touxiang=request.getParameter("touxiang");
		String  sex=request.getParameter("sex");
        String  des=request.getParameter("des");
		if (huiyuanSrv.isExist("where accountname='" + accountname
				+ "'")) {
				request.setAttribute("errormsg",
						"<label class='error'>用户名已经存在</label>");
				dispatchParams(request, response);
				forward("/e/register.jsp");
		}

		Huiyuan huiyuan = new Huiyuan();
		huiyuan.setAccountname(accountname == null ? "" : accountname);
		huiyuan.setPassword(password == null ? "" : password);
		
		if(mobile!=null)
		   huiyuan.setMobile(mobile); 
		if(address!=null)
		   huiyuan.setAddress(address);
		if(sex!=null)
			huiyuan.setSex(sex);
		else
			huiyuan.setSex("男");
		huiyuan.setNickname(accountname);
        huiyuan.setName(name);
		huiyuan.setRegdate(new Date());
        huiyuan.setIdcardno(idcardno==null?"":idcardno);
		huiyuan.setLogtimes(0);
		if(touxiang!=null)
			huiyuan.setTouxiang(touxiang);
		else
		    huiyuan.setTouxiang(request.getContextPath()
				+ "/upload/nopic.jpg");
		huiyuan.setEmail(email == null ? "" : email);
		huiyuan.setStatus(1);
		huiyuan.setYue(0);
		huiyuan.setDes(des==null?"":des);
		huiyuanSrv.save(huiyuan);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/huiyuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}
	public void delete() {
		String id = request.getParameter("id");
		huiyuanSrv.delete(" where id=" + id);
		get();
	}
	
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Huiyuan huiyuan = huiyuanSrv.load(new Integer(id));
		if (huiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		String nickname = request.getParameter("nickname");
		String forwardurl = request.getParameter("forwardurl");
		String touxiang = request.getParameter("touxiang");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
	    String idcardno=request.getParameter("idcardno");
	    if(accountname!=null)
		   huiyuan.setAccountname(accountname);
		huiyuan.setNickname(nickname==null?"":nickname);
		huiyuan.setTouxiang(touxiang==null?"":touxiang);
		huiyuan.setEmail(email==null?"":email);
		huiyuan.setMobile(mobile==null?"":mobile);
		huiyuan.setIdcardno(idcardno==null?"":idcardno);
		huiyuan.setSex(sex==null?"":sex);
		huiyuan.setAddress(address==null?"":address);
		huiyuan.setName(name==null?"":name);
		huiyuanSrv.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		if (forwardurl == null) {
			forwardurl = "/admin/huiyuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}
	
	public void modifyPw() {

		String password=request.getParameter("password");
		String errorurl=request.getParameter("errorurl");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan =huiyuanSrv.load(new Integer(id));
		if(huiyuan!=null)
		{
			if(!huiyuan.getPassword().equals(password)){
				request.setAttribute("errormsg",
						"<label class='error'>原始密码不正确</label>");
				dispatchParams(request, response);
				forward(errorurl);
				return ;
			}
			huiyuan.setPassword(repassword1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			redirect(forwardurl);
		}

	}
	
	
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null){
			Huiyuan huiyuan = huiyuanSrv.load("where id="+ id);
			if (huiyuan != null) {
				request.setAttribute("huiyuan", huiyuan);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		forward(forwardurl);
		
	}
	public void  get(){
		String filter = "";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String accountname = request.getParameter("accountname");
		if (accountname != null)
			filter = "  where accountname like '%" + accountname + "%'  ";
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Huiyuan> listhuiyuan = huiyuanSrv.getEntity();
		int recordscount = huiyuanSrv.getRecordCount(filter);
		request.setAttribute("listhuiyuan", listhuiyuan);
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
			forwardurl = "/admin/huiyuanmanager.jsp";
		}
		forward(forwardurl);
	}
	
	

}
