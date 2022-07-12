package com.kh.redding.product.model.vo;

import java.sql.Date;

public class Product implements java.io.Serializable{
   private int pNo;
   private String pName;
   private String pContent;
   private int price;
   private Date pEnrollDate;
   private int cNo;
   private Date pModifyDate;
   private String proStatus;
   
   public Product() {}

   public Product(int pNo, String pName, String pContent, int price, Date pEnrollDate, int cNo, Date pModifyDate,
         String proStatus) {
      super();
      this.pNo = pNo;
      this.pName = pName;
      this.pContent = pContent;
      this.price = price;
      this.pEnrollDate = pEnrollDate;
      this.cNo = cNo;
      this.pModifyDate = pModifyDate;
      this.proStatus = proStatus;
   }

   public int getpNo() {
      return pNo;
   }

   public void setpNo(int pNo) {
      this.pNo = pNo;
   }

   public String getpName() {
      return pName;
   }

   public void setpName(String pName) {
      this.pName = pName;
   }

   public String getpContent() {
      return pContent;
   }

   public void setpContent(String pContent) {
      this.pContent = pContent;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public Date getpEnrollDate() {
      return pEnrollDate;
   }

   public void setpEnrollDate(Date pEnrollDate) {
      this.pEnrollDate = pEnrollDate;
   }

   public int getcNo() {
      return cNo;
   }

   public void setcNo(int cNo) {
      this.cNo = cNo;
   }

   public Date getpModifyDate() {
      return pModifyDate;
   }

   public void setpModifyDate(Date pModifyDate) {
      this.pModifyDate = pModifyDate;
   }

   public String getProStatus() {
      return proStatus;
   }

   public void setProStatus(String proStatus) {
      this.proStatus = proStatus;
   }

   @Override
   public String toString() {
      return "Product [pNo=" + pNo + ", pName=" + pName + ", pContent=" + pContent + ", price=" + price
            + ", pEnrollDate=" + pEnrollDate + ", cNo=" + cNo + ", pModifyDate=" + pModifyDate + ", proStatus="
            + proStatus + "]";
   }
   
   

}