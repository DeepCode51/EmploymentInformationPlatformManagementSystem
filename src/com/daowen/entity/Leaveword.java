package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Leaveword {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String lwren;

	public String getLwren() {
		return lwren;
	}

	public void setLwren(String lwren) {
		this.lwren = lwren;
	}

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private String replyren;

	public String getReplyren() {
		return replyren;
	}

	public void setReplyren(String replyren) {
		this.replyren = replyren;
	}

	private Date replytime;

	public Date getReplytime() {
		return replytime;
	}

	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	private String replycontent;

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	
	private  String  photo;

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
