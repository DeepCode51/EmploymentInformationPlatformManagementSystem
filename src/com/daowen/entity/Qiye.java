package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Qiye
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
   private String accountname ;
   public String getAccountname() 
   {
      return accountname;
  }
   public void setAccountname(String accountname) 
   {
      this.accountname= accountname;
  }
   private String password ;
   public String getPassword() 
   {
      return password;
  }
   public void setPassword(String password) 
   {
      this.password= password;
  }
   private String name ;
   public String getName() 
   {
      return name;
  }
   public void setName(String name) 
   {
      this.name= name;
  }
   private String lawor ;
   public String getLawor() 
   {
      return lawor;
  }
   public void setLawor(String lawor) 
   {
      this.lawor= lawor;
  }
   private String xingzhi ;
   public String getXingzhi() 
   {
      return xingzhi;
  }
   public void setXingzhi(String xingzhi) 
   {
      this.xingzhi= xingzhi;
  }
   private Date regdate ;
   public Date getRegdate() 
   {
      return regdate;
  }
   public void setRegdate(Date regdate) 
   {
      this.regdate= regdate;
  }
   private String renshu ;
   public String getRenshu() 
   {
      return renshu;
  }
   public void setRenshu(String renshu) 
   {
      this.renshu= renshu;
  }
   private String zhizhaono ;
   public String getZhizhaono() 
   {
      return zhizhaono;
  }
   public void setZhizhaono(String zhizhaono) 
   {
      this.zhizhaono= zhizhaono;
  }
   private String photo ;
   public String getPhoto() 
   {
      return photo;
  }
   public void setPhoto(String photo) 
   {
      this.photo= photo;
  }
   private String idcardno ;
   public String getIdcardno() 
   {
      return idcardno;
  }
   public void setIdcardno(String idcardno) 
   {
      this.idcardno= idcardno;
  }
   private String address ;
   public String getAddress() 
   {
      return address;
  }
   public void setAddress(String address) 
   {
      this.address= address;
  }
   private String status ;
   public String getStatus() 
   {
      return status;
  }
   public void setStatus(String status) 
   {
      this.status= status;
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
