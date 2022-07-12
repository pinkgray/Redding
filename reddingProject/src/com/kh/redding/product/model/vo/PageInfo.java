package com.kh.redding.product.model.vo;

public class PageInfo implements java.io.Serializable{
   private int currentPage;
   private int limit;
   private int maxPage;
   private int startPage;
   private int endPage;
   private int startRow;
   private int endRow;
   
   public PageInfo() {}

   public PageInfo(int currentPage, int limit, int maxPage, int startPage, int endPage, int startRow, int endRow) {
      super();
      this.currentPage = currentPage;
      this.limit = limit;
      this.maxPage = maxPage;
      this.startPage = startPage;
      this.endPage = endPage;
      this.startRow = startRow;
      this.endRow = endRow;
   }
   
   
   public PageInfo(int currentPage, int limit, int maxPage, int startPage, int endPage) {
      super();
      this.currentPage = currentPage;
      this.limit = limit;
      this.maxPage = maxPage;
      this.startPage = startPage;
      this.endPage = endPage;
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getLimit() {
      return limit;
   }

   public void setLimit(int limit) {
      this.limit = limit;
   }

   public int getMaxPage() {
      return maxPage;
   }

   public void setMaxPage(int maxPage) {
      this.maxPage = maxPage;
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public int getStartRow() {
      return startRow;
   }

   public void setStartRow(int startRow) {
      this.startRow = startRow;
   }

   public int getEndRow() {
      return endRow;
   }

   public void setEndRow(int endRow) {
      this.endRow = endRow;
   }

   @Override
   public String toString() {
      return "PageInfo [currentPage=" + currentPage + ", limit=" + limit + ", maxPage=" + maxPage + ", startPage="
            + startPage + ", endPage=" + endPage + ", startRow=" + startRow + ", endRow=" + endRow + "]";
   }

      
}