package com.kh.redding.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UseProduct implements Serializable{
   private int upNo;
   private Date useDate;
   private String useStartTime;
   private String useEndTime;
   private int pNo;
   private int uNum;
   private String ustatus;
   
   public UseProduct() {}


public UseProduct(int upNo, Date useDate, String useStartTime, String useEndTime, int pNo, int uNum, String ustatus) {
   super();
   this.upNo = upNo;
   this.useDate = useDate;
   this.useStartTime = useStartTime;
   this.useEndTime = useEndTime;
   this.pNo = pNo;
   this.uNum = uNum;
   this.ustatus = ustatus;
}


public int getUpNo() {
   return upNo;
}


public void setUpNo(int upNo) {
   this.upNo = upNo;
}


public Date getUseDate() {
   return useDate;
}


public void setUseDate(Date useDate) {
   this.useDate = useDate;
}


public String getUseStartTime() {
   return useStartTime;
}


public void setUseStartTime(String useStartTime) {
   this.useStartTime = useStartTime;
}


public String getUseEndTime() {
   return useEndTime;
}


public void setUseEndTime(String useEndTime) {
   this.useEndTime = useEndTime;
}


public int getpNo() {
   return pNo;
}


public void setpNo(int pNo) {
   this.pNo = pNo;
}


public int getuNum() {
   return uNum;
}


public void setuNum(int uNum) {
   this.uNum = uNum;
}


public String getUstatus() {
   return ustatus;
}


public void setUstatus(String ustatus) {
   this.ustatus = ustatus;
}


@Override
public String toString() {
   return "UseProduct [upNo=" + upNo + ", useDate=" + useDate + ", useStartTime=" + useStartTime + ", useEndTime="
         + useEndTime + ", pNo=" + pNo + ", uNum=" + uNum + ", ustatus=" + ustatus + "]";
}   
   
}