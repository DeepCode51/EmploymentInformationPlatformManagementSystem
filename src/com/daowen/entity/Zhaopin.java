package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Zhaopin
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private String gwtype ;
   public String getGwtype() 
   {
      return gwtype;
  }
   public void setGwtype(String gwtype) 
   {
      this.gwtype= gwtype;
  }
   private String pubren ;
   public String getPubren() 
   {
      return pubren;
  }
   public void setPubren(String pubren) 
   {
      this.pubren= pubren;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private String daiyu ;
   public String getDaiyu() 
   {
      return daiyu;
  }
   public void setDaiyu(String daiyu) 
   {
      this.daiyu= daiyu;
  }
   private String gzdi ;
   public String getGzdi() 
   {
      return gzdi;
  }
   public void setGzdi(String gzdi) 
   {
      this.gzdi= gzdi;
  }
   private String xueli ;
   public String getXueli() 
   {
      return xueli;
  }
   public void setXueli(String xueli) 
   {
      this.xueli= xueli;
  }
   private int renshu ;
   public int getRenshu() 
   {
      return renshu;
  }
   public void setRenshu(int renshu) 
   {
      this.renshu= renshu;
  }
   private String tupian ;
   public String getTupian() 
   {
      return tupian;
  }
   public void setTupian(String tupian) 
   {
      this.tupian= tupian;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
}
