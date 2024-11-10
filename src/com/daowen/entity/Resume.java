package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Resume {
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

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String sex;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	private Date birthday;

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	private String hyzk;

	public String getHyzk() {
		return hyzk;
	}

	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}

	private String mingzu;

	public String getMingzu() {
		return mingzu;
	}

	public void setMingzu(String mingzu) {
		this.mingzu = mingzu;
	}

	private String jiguan;

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	private String zhuanye;

	public String getZhuanye() {
		return zhuanye;
	}

	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}

	private String xueli;

	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	private Date bydate;

	public Date getBydate() {
		return bydate;
	}

	public void setBydate(Date bydate) {
		this.bydate = bydate;
	}

	private String lxtel;

	public String getLxtel() {
		return lxtel;
	}

	public void setLxtel(String lxtel) {
		this.lxtel = lxtel;
	}

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String shengao;

	public String getShengao() {
		return shengao;
	}

	public void setShengao(String shengao) {
		this.shengao = shengao;
	}

	private String mianmao;

	public String getMianmao() {
		return mianmao;
	}

	public void setMianmao(String mianmao) {
		this.mianmao = mianmao;
	}

	private String xchangye;

	public String getXchangye() {
		return xchangye;
	}

	public void setXchangye(String xchangye) {
		this.xchangye = xchangye;
	}

	private String qzhangye;

	public String getQzhangye() {
		return qzhangye;
	}

	public void setQzhangye(String qzhangye) {
		this.qzhangye = qzhangye;
	}

	private String qwxinshui;

	public String getQwxinshui() {
		return qwxinshui;
	}

	public void setQwxinshui(String qwxinshui) {
		this.qwxinshui = qwxinshui;
	}

	private Double gznianxian;

	public Double getGznianxian() {
		return gznianxian;
	}

	public void setGznianxian(Double gznianxian) {
		this.gznianxian = gznianxian;
	}

	private String xiangpian;

	public String getXiangpian() {
		return xiangpian;
	}

	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}

	private String suoyouren;

	public String getSuoyouren() {
		return suoyouren;
	}

	public void setSuoyouren(String suoyouren) {
		this.suoyouren = suoyouren;
	}

	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private int clickcount;

	public int getClickcount() {
		return clickcount;
	}

	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}
}
