package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.List;

import com.daowen.entity.Indexcolumns;
import com.daowen.service.IndexcolumnsService;
import com.daowen.util.BeansUtil;

public class IndexcolumnsBuilder {

	private IndexcolumnsService icSrv=null;
	
	public IndexcolumnsBuilder(){
		icSrv=BeansUtil.getBean("indexcolumnsService", IndexcolumnsService.class);
	}
    public String buildColumns(){
		
		StringBuffer sb=new StringBuffer();
		LanmuBuilder  lmBuilder=new LanmuBuilder("box");
		sb.append("<div class=\"page-main-box white-paper\">");
		sb.append("<div class=\"row-flow\">");
		List<Indexcolumns>  textlist=icSrv.getEntity("where showstyle='文本'");
		for (Indexcolumns indexcolumns : textlist) {
			if(indexcolumns.getLayout()!=null&&indexcolumns.getLayout().equals("2"))
			{
				sb.append(MessageFormat.format("<div class=\"column\" style=\"width:{0}\">",indexcolumns.getWidth()));
			}
			if(indexcolumns.getShowstyle().equals("文本")){
			    sb.append(lmBuilder.buildTextLanmu(indexcolumns.getColid()));
			}
			sb.append("\r\n");
			//结束列
			if(indexcolumns.getLayout()!=null&&indexcolumns.getLayout().equals("2"))
			   sb.append("</div>");
		}
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
		
		
	}
	
    public String buildImageColumns(){
		
		StringBuffer sb=new StringBuffer();
		LanmuBuilder  shangpinbuilder=new LanmuBuilder("box");
		sb.append("<div class=\"page-main-box white-paper\">");
		sb.append("<div class=\"row-flow\">");
		List<Indexcolumns>  textlist=icSrv.getEntity("where showstyle='图片'");
		int i=1;
		for (Indexcolumns indexcolumns : textlist) {
			if(indexcolumns.getLayout()!=null&&indexcolumns.getLayout().equals("1"))
			{
				sb.append("<div class=\"clear\"></div>");
				
			}
			if(indexcolumns.getShowstyle().equals("图片")){
				sb.append(shangpinbuilder.buildImageLanmu(indexcolumns.getColid()));
				
			}
			sb.append("\r\n");
			i++;
			
		}
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
		
		
	}
	
	
}
