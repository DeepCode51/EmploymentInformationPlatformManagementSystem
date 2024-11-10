package com.daowen.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Attachement {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	// 评论标题
	private String title;
	// 评论时间
	private Date pubtime;
	// 评论人
	private String url;
	// 文件名
	private String filename;
	// 附件类型
	private String type;
	// 所属主题编码
	private String belongid;
	// 所属主题
	private String belongtable;
	// 所属列名
	private String belongfileldname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBelongid() {
		return belongid;
	}

	public void setBelongid(String belongid) {
		this.belongid = belongid;
	}

	public String getBelongtable() {
		return belongtable;
	}

	public void setBelongtable(String belongtable) {
		this.belongtable = belongtable;
	}

	public String getBelongfileldname() {
		return belongfileldname;
	}

	public void setBelongfileldname(String belongfileldname) {
		this.belongfileldname = belongfileldname;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}