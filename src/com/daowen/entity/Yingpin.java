package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Yingpin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String zpid;

	public String getZpid() {
		return zpid;
	}

	public void setZpid(String zpid) {
		this.zpid = zpid;
	}

	private String zptitle;

	public String getZptitle() {
		return zptitle;
	}

	public void setZptitle(String zptitle) {
		this.zptitle = zptitle;
	}

	private String poster;

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	private String postername;

	public String getPostername() {
		return postername;
	}

	public void setPostername(String postername) {
		this.postername = postername;
	}

	private String resumeid;

	public String getResumeid() {
		return resumeid;
	}

	public void setResumeid(String resumeid) {
		this.resumeid = resumeid;
	}

	private String resumetitle;

	public String getResumetitle() {
		return resumetitle;
	}

	public void setResumetitle(String resumetitle) {
		this.resumetitle = resumetitle;
	}

	private Date posttime;

	public Date getPosttime() {
		return posttime;
	}

	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}

	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
