package com.daowen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Xinxi;
import com.daowen.entity.Zhaopin;
import com.daowen.service.XinxiService;
import com.daowen.service.ZhaopinService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.util.BeansUtil;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class SitesearchController extends SimpleController {

	@Autowired
	private XinxiService xinxiSrv=null;
	
	@Override
	@RequestMapping("/admin/sitesearch.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);

	}
	
	private void find() {

		String searchtype = request.getParameter("searchtype");
        String  title=request.getParameter("title");
		
		if(searchtype!=null&&searchtype.equals("1")){
	          searchZhaopin();
		}
		if(searchtype!=null&&searchtype.equals("2")){
            List<Xinxi> listXinxi=null;
            if(title!=null){
            	listXinxi=xinxiSrv.getEntity("where title like '%"+title+"%'");
                 request.setAttribute("listXinxi", listXinxi);
            }
		
		forward("/e/searchnews.jsp");
	}
	}
	
	private void searchZhaopin(){
		
		
		 String  filter="where 1=1 ";
		 String  title=request.getParameter("title");
			
		 if(title!=null)
			 filter+=" and title like '%"+title+"%'";
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
			ZhaopinService zhaopinSrv=BeansUtil.getBean("zhaopinService", ZhaopinService.class);
			List<Zhaopin> zhaopinlist = zhaopinSrv.getPageEntitys( filter,
					pageindex, pagesize);
			int recordscount = zhaopinSrv.getRecordCount(filter == null ? ""
					: filter);
			request.setAttribute("listZhaopin", zhaopinlist);
			PagerMetal pm = new PagerMetal(recordscount);
			// 设置尺寸
			pm.setPagesize(pagesize);
			// 设置当前显示页
			pm.setCurpageindex(pageindex);
			// 设置分页信息
			request.setAttribute("pagermetal", pm);
			
			forward("/e/searchzp.jsp");
		
	}
	
	

	

}
