package com.kh.redding.product.model.dao;

import static com.kh.redding.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

public class ProductDao {
      private Properties prop = new Properties();
      
      public ProductDao() {
         String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
         
	         try {
	         prop.load(new FileReader(fileName));
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	         
      }
      
      //상품리스트조회
      public ArrayList<Product> selectList(Connection con, PageInfo pi, int cno) {
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         ArrayList<Product> list = null;
         
         String query = prop.getProperty("selectProductList");
         
         /*int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
         int endRow = startRow + pi.getLimit() - 1;*/
         
         try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cno);
            pstmt.setInt(2, pi.getStartRow());
            pstmt.setInt(3, pi.getEndRow());
            
            rset = pstmt.executeQuery();
            
            list = new ArrayList<Product>();
            
            while(rset.next()) {
               Product p = new Product();
               
               p.setpNo(rset.getInt("PNO"));
               p.setpName(rset.getString("PNAME"));
               p.setpContent(rset.getString("PCONTENT"));
               p.setPrice(rset.getInt("PRICE"));
               p.setpEnrollDate(rset.getDate("PENROLL_DATE"));
               p.setcNo(rset.getInt("CNO"));
               p.setpModifyDate(rset.getDate("PMODIFY_DATE"));
               p.setProStatus(rset.getString("PRO_STATUS"));
               list.add(p);
            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(rset);
            close(pstmt);
         }
         return list;
      }

     
      //cno가 일치하는 업체 정보를 가져온다.
      public Company selectCompanyOne(Connection con, int cNo) {
         //cNo일치 하는 컴파니 찾아오기
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         Company com = null;
         
         String query = prop.getProperty("selectCompanyOne");
         
         //System.out.println("selectCompanyOne query : " + query);
         
         //System.out.println("selectCompanyOne cNo : " +cNo);
         
         //System.out.println("selectCompanyOne con : " +con);
         
         
         try {
            pstmt = con.prepareStatement(query);
            
            pstmt.setInt(1, cNo);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
              //System.out.println("rset : " + rset);
               com = new Company();
               
               com.setCNO(rset.getInt("CNO"));
               com.setCom_Rep_Num(rset.getInt("COM_REP_NUM"));
               com.setRepName(rset.getString("REP_NAME"));
               com.setComAddress(rset.getString("COM_ADDRESS"));
               com.setComUrl(rset.getString("COM_URL"));
               com.setOpenTime(rset.getString("OPEN_TIMES"));
               com.setEndTime(rset.getString("CLOSE_TIMES"));
               com.setAccountCode(rset.getInt("ACCOUNT_CODE"));
               com.setAccountNum(rset.getString("ACCOUNT_NUM"));
               com.setAccountName(rset.getString("ACCOUNT_NAME"));
               com.setComType(rset.getString("COM_TYPE"));
               com.setComLike(rset.getInt("COM_LIKE"));
               com.setHoliday(rset.getString("HOLIDAY"));               
               
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(pstmt);
            close(rset);
         }
               
         //System.out.println("com : " +com);
         return com;
      }

   

   public int insertProduct(Connection con, Product pro) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertProduct");
      
      try {
         pstmt = con.prepareStatement(query);
         
         pstmt.setString(1, pro.getpName());
         pstmt.setString(2, pro.getpContent());
         pstmt.setInt(3, pro.getPrice());
         pstmt.setDate(4, pro.getpEnrollDate());
         pstmt.setInt(5, pro.getcNo());
         pstmt.setString(6, pro.getProStatus());
         
         result = pstmt.executeUpdate();
         
         
         //System.out.println("result : " + result);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   
   //상품의 현재 pno를 들고 온다
   public int selectProductCurrval(Connection con) {
      Statement stmt = null;
      ResultSet rset = null;
      int pno = 0;
      String query = prop.getProperty("selectProductCurrval");
      
      try {
         stmt = con.createStatement();
         
         rset = stmt.executeQuery(query);
         
         if(rset.next()) {
            pno = rset.getInt("currval");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         
         close(stmt);
         close(rset);
      }
   
      
      return pno;
   }

  
   //제품등록용
   public int insertUseProduct(Connection con, ArrayList<UseProduct> uProList, ArrayList<String> useDate) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertDateTime");
      
      try {
    	 pstmt =con.prepareStatement(query);
    	  
         for(int i=0 ; i<uProList.size() ; i++) {
            
            
               pstmt.setDate(1, uProList.get(i).getUseDate());
            
               pstmt.setString(2, uProList.get(i).getUseStartTime());
               pstmt.setString(3, uProList.get(i).getUseEndTime());
               pstmt.setInt(4, uProList.get(i).getpNo());
               pstmt.setInt(5, uProList.get(i).getuNum());
               
               result += pstmt.executeUpdate();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   
   
   //상품의 전체 갯수 리턴
   public int getListCount(Connection con, int cno) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      int listCount = 0;
      
      String query = prop.getProperty("getListCount");
      
      try {
         pstmt = con.prepareStatement(query);
         
         pstmt.setInt(1, cno);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt(1);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
    	  close(pstmt);
    	  close(rset);
      }
      return listCount;
   }
   //상품 1개 들고오기
   public Product selectProductOne(Connection con, int pno) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Product product = null;
      
      String query = prop.getProperty("selectProductOne");
      
      try {
         pstmt = con.prepareStatement(query);
         pstmt.setInt(1, pno);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            product = new Product();
            product.setpNo(rset.getInt("PNO"));
            product.setpName(rset.getString("PNAME"));
            product.setpContent(rset.getString("PCONTENT"));
            product.setPrice(rset.getInt("PRICE"));
            product.setpEnrollDate(rset.getDate("PENROLL_DATE"));
            product.setcNo(rset.getInt("CNO"));
            product.setpModifyDate(rset.getDate("PMODIFY_DATE"));
            product.setProStatus(rset.getString("PRO_STATUS"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
         close(rset);
      }
      
      return product;
   }

   public ArrayList<UseProduct> selectUseProductList(Connection con, int pno, PageInfo pi, int cno) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<UseProduct> useProList = null;
      UseProduct usePro = null;
      //System.out.println("con : " + con );
      //System.out.println("pno : " + pno);
      //System.out.println("cno : " + cno);
      String query = prop.getProperty("selectUseProductList");
      try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, pi.getStartRow());
			pstmt.setInt(4, pi.getEndRow());
			
			rset = pstmt.executeQuery();
			
			useProList = new ArrayList<UseProduct>();
			while(rset.next()) {
				usePro = new UseProduct();
				
				usePro.setUpNo(rset.getInt("UPNO"));
				usePro.setUseDate(rset.getDate("USE_DATE"));
				usePro.setUseStartTime(rset.getString("USE_START_TIME"));
				usePro.setUseEndTime(rset.getString("USE_END_TIME"));
				usePro.setpNo(rset.getInt("PNO"));
				usePro.setuNum(rset.getInt("UNUM"));
				usePro.setUstatus(rset.getString("USTATUS"));
				
				
				useProList.add(usePro);				
			}
			
	  } catch (SQLException e) {
			e.printStackTrace();
	  } finally {
		  close(pstmt);
		  close(rset);
	  }
      //System.out.println("usePro.getUno : " + usePro.getUpNo());
      //System.out.println("useProList.size : " + useProList.size());
      return useProList;
   }
	public int getUseProductListCount(Connection con, int pno, int cno) {
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    int listCount = 0;
	    
	    String query = prop.getProperty("getUseProductListCount");
	    
	    try {
	       pstmt = con.prepareStatement(query);
	       
	       pstmt.setInt(1, cno);
	       pstmt.setInt(2, pno);
	       
	       rset = pstmt.executeQuery();
	       
	       if(rset.next()) {
	          listCount = rset.getInt(1);
	       }
	    } catch (SQLException e) {
	       e.printStackTrace();
	    } finally {
	    	close(pstmt);
	    	close(rset);
	    }
	    return listCount;
	}

	public UseProduct selectUseProductOne(Connection con, int upNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UseProduct upro = null;
		
		String query = prop.getProperty("selectUseProductOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, upNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				upro = new UseProduct();
				
				upro.setUpNo(rset.getInt("UPNO"));
				upro.setUseDate(rset.getDate("USE_DATE"));
				upro.setUseStartTime(rset.getString("USE_START_TIME"));
				upro.setUseEndTime(rset.getString("USE_END_TIME"));
				upro.setpNo(rset.getInt("PNO"));
				upro.setuNum(rset.getInt("UNUM"));
				upro.setUstatus(rset.getString("USTATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return upro;
	}

	public int updateUseProduct(Connection con, UseProduct upro) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUseProductOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, upro.getuNum());
			pstmt.setString(2, upro.getUstatus());
			pstmt.setInt(3, upro.getUpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProduct(Connection con, Product product) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, product.getpContent());	
			pstmt.setInt(2, product.getPrice());
			pstmt.setString(3, product.getProStatus());
			pstmt.setDate(4, product.getpModifyDate());
			pstmt.setInt(5, product.getpNo());
			
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateUseProductStatus(Connection con, String status, int upno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUseProductStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, upno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int productTotalCount(Connection con, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int productTotalCount = 0;
		
		String query = prop.getProperty("productTotalCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				productTotalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return productTotalCount;
	}

	public int saleProductCount(Connection con, int cno, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int saleProductCount = 0;
		
		String query = prop.getProperty("saleProductCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setString(2, status);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				saleProductCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return saleProductCount;
	}
	public int updateUseProductLists(Connection con, int pno, String ustatus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUseProductList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, ustatus);
			pstmt.setInt(2, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateProductStatus(Connection con, String status, int pno, Date modifyDate) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("updateProductStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setDate(2, modifyDate);
			pstmt.setInt(3, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//System.out.println("상품업뎃 : " + result);
		return result;
	}

	public int updateTotalUseProductStatus(Connection con, String ustatus, int pno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTotalUseProductStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ustatus);
			pstmt.setInt(2, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//System.out.println("제품 리스트 업뎃 : " + result);
		return result;
	}

	public ArrayList<Product> searchProduct(Connection con, int value, int cno, String searchProName, String searchStatus, PageInfo pi) {
		Properties prop = new Properties();
		
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> proList = null;
		Product pro = null;
		
		String query = prop.getProperty("searchProduct");
		
		if(value==10) {
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, cno);
				pstmt.setInt(2, pi.getStartRow());
				pstmt.setInt(3, pi.getEndRow());
				
				rset = pstmt.executeQuery();
				
				proList = new ArrayList<Product>();
				
				while(rset.next()) {
					
					pro = new Product();
					pro.setpNo(rset.getInt("PNO"));
					pro.setpName(rset.getString("PNAME"));
					pro.setpContent(rset.getString("PCONTENT"));
					pro.setPrice(rset.getInt("PRICE"));
					pro.setpEnrollDate(rset.getDate("PENROLL_DATE"));
					pro.setcNo(rset.getInt("CNO"));
					pro.setpModifyDate(rset.getDate("PMODIFY_DATE"));
					pro.setProStatus(rset.getString("PRO_STATUS"));
					
					proList.add(pro);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		}else if(value==20) {
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, cno);
				pstmt.setString(2, searchStatus);
				pstmt.setInt(3, pi.getStartRow());
				pstmt.setInt(4, pi.getEndRow());
				
				rset = pstmt.executeQuery();
				proList = new ArrayList<Product>();
				
				while(rset.next()) {					
					pro = new Product();
					pro.setpNo(rset.getInt("PNO"));
					pro.setpName(rset.getString("PNAME"));
					pro.setpContent(rset.getString("PCONTENT"));
					pro.setPrice(rset.getInt("PRICE"));
					pro.setpEnrollDate(rset.getDate("PENROLL_DATE"));
					pro.setcNo(rset.getInt("CNO"));
					pro.setpModifyDate(rset.getDate("PMODIFY_DATE"));
					pro.setProStatus(rset.getString("PRO_STATUS"));
					
					proList.add(pro);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		}else if(value==30) {
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, cno);
				pstmt.setString(2, searchProName);
				pstmt.setInt(3, pi.getStartRow());
				pstmt.setInt(4, pi.getEndRow());
				
				rset = pstmt.executeQuery();
				proList = new ArrayList<Product>();
				
				while(rset.next()) {					
					pro = new Product();
					pro.setpNo(rset.getInt("PNO"));
					pro.setpName(rset.getString("PNAME"));
					pro.setpContent(rset.getString("PCONTENT"));
					pro.setPrice(rset.getInt("PRICE"));
					pro.setpEnrollDate(rset.getDate("PENROLL_DATE"));
					pro.setcNo(rset.getInt("CNO"));
					pro.setpModifyDate(rset.getDate("PMODIFY_DATE"));
					pro.setProStatus(rset.getString("PRO_STATUS"));
					
					proList.add(pro);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}else if(value==40) {
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, cno);
				pstmt.setString(2, searchProName);
				pstmt.setString(3, searchStatus);
				pstmt.setInt(4, pi.getStartRow());
				pstmt.setInt(5, pi.getEndRow());
				
				rset = pstmt.executeQuery();
				proList = new ArrayList<Product>();
				
				while(rset.next()) {					
					pro = new Product();
					pro.setpNo(rset.getInt("PNO"));
					pro.setpName(rset.getString("PNAME"));
					pro.setpContent(rset.getString("PCONTENT"));
					pro.setPrice(rset.getInt("PRICE"));
					pro.setpEnrollDate(rset.getDate("PENROLL_DATE"));
					pro.setcNo(rset.getInt("CNO"));
					pro.setpModifyDate(rset.getDate("PMODIFY_DATE"));
					pro.setProStatus(rset.getString("PRO_STATUS"));
					
					proList.add(pro);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
		}
		return proList;
	}

	public int getListCountJustStatus(Connection con, int cno, String searchStatus) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCountJustStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setString(2, searchStatus);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	public int getListCountNameStatus(Connection con, int cno, String searchProName, String searchStatus) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCountNameStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setString(2, searchStatus);
			pstmt.setString(3, searchProName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		return listCount;
	}

	public int getListJustName(Connection con, int cno, String searchProName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListJustName");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, cno);
			pstmt.setString(2, searchProName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		return listCount;
	}

	public int getUseProductSearchListCount(Connection con, int pNo, String ustatus, Date startDate,
			Date endDate) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getUseProductSearchListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			pstmt.setString(2, ustatus);
			pstmt.setDate(3, startDate);
			pstmt.setDate(4, endDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		return listCount;
	}

	public ArrayList<UseProduct> searchUseProduct(Connection con, int pNo, String ustatus, Date startDate, Date endDate,
			PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UseProduct> useProList = null;
		UseProduct upro = null;
		
		String query = prop.getProperty("searchUseProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pNo);
			pstmt.setString(2, ustatus);
			pstmt.setDate(3, startDate);
			pstmt.setDate(4, endDate);
			pstmt.setInt(5, pi.getStartRow());
			pstmt.setInt(6, pi.getEndRow());
			
			rset = pstmt.executeQuery();
			
			useProList = new ArrayList<UseProduct>();
			
			while(rset.next()) {
				upro = new UseProduct();
				
				upro.setUpNo(rset.getInt("UPNO"));
				upro.setUseDate(rset.getDate("USE_DATE"));
				upro.setUseStartTime(rset.getString("USE_START_TIME"));
				upro.setUseEndTime(rset.getString("USE_END_TIME"));
				upro.setpNo(rset.getInt("PNO"));
				upro.setuNum(rset.getInt("UNUM"));
				upro.setUstatus(rset.getString("USTATUS"));
				
				useProList.add(upro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		
		return useProList;
	}

	public int getUseProductSearchTotalListCount(Connection con, int pNo, Date startDate,
			Date endDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("searchUseProductTotalListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pNo);
			pstmt.setDate(2, startDate);
			pstmt.setDate(3, endDate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		return listCount;
	}

	public ArrayList<UseProduct> searchUseProductTotal(Connection con, int pNo, Date startDate, Date endDate,
			PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UseProduct> useProList = null;
		UseProduct upro = null;
		
		String query = prop.getProperty("searchUseProductTotal");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pNo);
			pstmt.setDate(2, startDate);
			pstmt.setDate(3, endDate);
			pstmt.setInt(4, pi.getStartRow());
			pstmt.setInt(5, pi.getEndRow());
			
			rset = pstmt.executeQuery();
			
			useProList = new ArrayList<UseProduct>();
			
			while(rset.next()) {
				upro = new UseProduct();
				
				upro.setUpNo(rset.getInt("UPNO"));
				upro.setUseDate(rset.getDate("USE_DATE"));
				upro.setUseStartTime(rset.getString("USE_START_TIME"));
				upro.setUseEndTime(rset.getString("USE_END_TIME"));
				upro.setpNo(rset.getInt("PNO"));
				upro.setuNum(rset.getInt("UNUM"));
				upro.setUstatus(rset.getString("USTATUS"));
				
				useProList.add(upro);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            close(rset);
            close(pstmt);
         }
		
		return useProList;
	}

}