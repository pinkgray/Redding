package com.kh.redding.board.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.board.model.vo.Reply;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//커뮤니티 게시글 목록 조회용
	public ArrayList<HashMap<String, Object>> selectBoardList(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardList");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//게시물 수 조회용 메소드
	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			
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

	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> boardDetail = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			boardDetail= new HashMap<String , Object>();
			
			if(rset.next()) {
				Board board = new Board();
				
				board.setBid(rset.getInt("BID"));
				board.setBtitle(rset.getString("BTITLE"));
				board.setBwriter((rset.getInt("BWRITER")));
				board.setBdate(rset.getDate("BDATE"));
				board.setBcount(rset.getInt("BCOUNT"));
				board.setBlike(rset.getInt("BLIKE"));
				board.setBcategory(rset.getString("BCATEGORY"));
				board.setBcontent(rset.getString("BCONTENT"));
				
				boardDetail.put("board", board);
				
				String MID = rset.getString("MID");
				String nick_name = rset.getString("NICK_NAME");
				
				boardDetail.put("mid", MID);
				boardDetail.put("nickName", nick_name);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return boardDetail;
	}

	public int updateCount(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bid);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//공지사항 insert
	public int insertNotice(Connection con, String noticeTitle, String noticeContent, int writer) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, noticeTitle);
			pstmt.setInt(2, writer);
			pstmt.setString(3 , noticeContent);
			pstmt.setString(4, "공지사항");
			
			result = pstmt.executeUpdate();
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//공지사항 리스트 가져오기
	public ArrayList<HashMap<String, Object>> selectNotice(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> noticeList = null;
		HashMap<String , Object> hmap = null;
		
		
		String query = prop.getProperty("selectNotice");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			String type = "공지사항";
			
			pstmt.setString(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			noticeList = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String , Object>();
				Board board = new Board();
				
				int num = rset.getInt("ROWNUM");
				board.setBid(rset.getInt("BID"));
				board.setBtitle(rset.getString("BTITLE"));
				board.setBwriter(rset.getInt("BWRITER"));
				String name = rset.getString("MNAME");
				board.setBdate(rset.getDate("BDATE"));
				board.setBcount(rset.getInt("BCOUNT"));
				board.setBcontent(rset.getString("BCONTENT"));
				board.setBdivision(rset.getString("BDIVISION"));
				board.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
				hmap.put("num", num);
				hmap.put("board", board);
				hmap.put("name" , name);
				
				noticeList.add(hmap);
			
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return noticeList;
	}

	//공지사항 몇개 인지 count하는 함수
	public int selectNoticeListCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectNoiticeCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			String type = "공지사항";
			
			pstmt.setString(1, type);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	
	//공지사항 상세
	public Board selectNoticeOne(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board selectNotice = null;
		
		String query = prop.getProperty("selectOneNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			pstmt.setString(2, "관리자");
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				selectNotice = new Board();
				
				selectNotice.setBid(rset.getInt("BID"));
				selectNotice.setBtitle(rset.getString("BTITLE"));
				selectNotice.setBdate(rset.getDate("BDATE"));
				selectNotice.setBcount(rset.getInt("BCOUNT"));
				selectNotice.setBcontent(rset.getString("BCONTENT"));
				selectNotice.setBdivision(rset.getString("BDIVISION"));
				selectNotice.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		 
		
		return selectNotice;
	}

	public int UpdateNotice(Connection con, int bid, String btitle, String bcontent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setInt(3, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	//조회 수 조회
	public int selectNoticeCount(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int bcount = 0;
		
		String query = prop.getProperty("selectNoticeCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				bcount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return bcount;
	}

	//조회수 증가
	public int updateNoticeCount(Connection con, int bid, int count) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("updateNoticeCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			count = count+1;
			
			pstmt.setInt(1, count);
			pstmt.setInt(2, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//공지사항 한개 삭제
	public int deleteNoticeOne(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("DeleteNoticeOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertFAQ(Connection con, String noticeTitle, String noticeContent, int writer) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, noticeTitle);
			pstmt.setInt(2, writer);
			pstmt.setString(3 , noticeContent);
			pstmt.setString(4, "FAQ");
			
			result = pstmt.executeUpdate();
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//자주하는 질문 총 갯수
	public int selectFAQListCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectNoiticeCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			String type = "FAQ";
			
			pstmt.setString(1, type);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		
		return result;
	}

	//자주하는 질문 리스트 
	public ArrayList<Board> selectFAQList(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<Board> FAQList = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectFAQList"); 
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt= con.prepareStatement(query);
			
			String type = "FAQ";
			
			pstmt.setString(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			FAQList = new ArrayList<Board>();
			while(rset.next()) {
				Board board = new Board();
				
				board.setBid(rset.getInt("BID"));
				board.setBtitle(rset.getString("BTITLE"));
				board.setBdate(rset.getDate("BDATE"));
				board.setBwriter(rset.getInt("BWRITER"));
				board.setBcontent(rset.getString("BCONTENT"));
				board.setBdivision(rset.getString("BDIVISION"));
				board.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
				FAQList.add(board);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return FAQList;
	}

	public int insertQnA(Connection con, int mno, String conTitle, String contact, String category) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnA");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, conTitle);
			pstmt.setInt(2, mno);
			pstmt.setString(3, contact);
			pstmt.setString(4, category);
			pstmt.setString(5, "QnA");
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		
		}
		
		
		
		
		
		
		return result;
	}

	
	//QnA 값 불러오기 
	public ArrayList<HashMap<String, Object>> selectQnAList(Connection con, int mno, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		ArrayList<HashMap<String , Object>> QnAList = null;
		
		String query = prop.getProperty("selectQnAList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			QnAList = new ArrayList<HashMap<String , Object>>();
			
			while(rset.next()) {
				HashMap<String , Object> Qhmap = new HashMap<String , Object>();
				
				int num = rset.getInt("ROWNUM");
				
				Qhmap.put("num", num);
				
				System.out.println("NUM :" + num);
				
				Board qna = new Board();
				
				qna.setBid(rset.getInt("BID"));
				qna.setBtitle(rset.getString("BTITLE"));
				qna.setBwriter(rset.getInt("BWRITER"));
				qna.setBdate(rset.getDate("BDATE"));
				qna.setBcategory(rset.getString("BCATEGORY"));
				qna.setBcontent(rset.getString("BCONTENT"));
				qna.setBdivision(rset.getString("BDIVISION"));
				qna.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
				Qhmap.put("QnA", qna);
				
				Reply reply = new Reply();
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				reply.setReply_modify_date(rset.getDate("REPLY_MODIFY_DATE"));
				
				Qhmap.put("reply", reply);
				
				
				QnAList.add(Qhmap);
			}
			
			System.out.println("문의 :"+ QnAList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return QnAList;
	}

	//QnA갯수 
	public int selectQnaCount(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int QnAcount = 0;
		
		String query = prop.getProperty("selectQnACount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				QnAcount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return QnAcount;
	}

	
	//전체 문의 수 조회
	public int selectQnaAllCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("selectQnAAllCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return count;
	}

	//지원 - 문의 전체리스트
	public ArrayList<HashMap<String, Object>> selectQnAAllList(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		ArrayList<HashMap<String , Object>> QnAList = null;
		
		
		String query = prop.getProperty("selectQnAAllList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			QnAList = new ArrayList<HashMap<String , Object>>();
			
			while(rset.next()) {
				HashMap<String , Object> Qhmap = new HashMap<String , Object>();
				
				int num = rset.getInt("ROWNUM");
				
				Qhmap.put("num", num);
				
				Board qna = new Board();
				
				qna.setBid(rset.getInt("BID"));
				qna.setBtitle(rset.getString("BTITLE"));
				qna.setBwriter(rset.getInt("BWRITER"));
				qna.setBdate(rset.getDate("BDATE"));
				qna.setBcategory(rset.getString("BCATEGORY"));
				qna.setBcontent(rset.getString("BCONTENT"));
				qna.setBdivision(rset.getString("BDIVISION"));
				qna.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
				Qhmap.put("QnA", qna);
				
				Reply reply = new Reply();
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				reply.setReply_modify_date(rset.getDate("REPLY_MODIFY_DATE"));
				
				Qhmap.put("reply", reply);
				
				String memberid = rset.getString("MNAME");
				String nickname = rset.getString("NICK_NAME");
				
				Qhmap.put("memberId", memberid);
				Qhmap.put("NickName", nickname);
				
				
				QnAList.add(Qhmap);
			}
			
			//System.out.println("문의 :"+ QnAList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return QnAList;
	}
	
	//qna insert(0523광섭)
	public int insertQnaBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnaBoard");
		
		try {
			
			System.out.println("query" + query);
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, b.getBtitle());
			pstmt.setInt(2, b.getBwriter());
			pstmt.setString(3, b.getBcontent());
			pstmt.setString(4, null);
			pstmt.setString(5, b.getBdivision());
			pstmt.setInt(6, b.getRef_cnum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//진행완료인 QnA
	public int selectQnACompleteSelect(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("completeQnAcount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return count;
	}

	//지원 - 문의 상세 
	public ArrayList<HashMap<String, Object>> selectQnAOneDetail(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> QnAlist = null;
		
		String query = prop.getProperty("selectQnADetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			QnAlist = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				HashMap<String , Object>  hmap = new HashMap<String , Object>();
				
				Board QnA = new Board();
				
				QnA.setBid(rset.getInt("BID"));
				QnA.setBtitle(rset.getString("BTITLE"));
				QnA.setBwriter(rset.getInt("BWRITER"));
				QnA.setBdate(rset.getDate("BDATE"));
				QnA.setBcontent(rset.getString("BCONTENT"));
				QnA.setBdivision(rset.getString("BDIVISION"));
				QnA.setBcategory(rset.getString("BCATEGORY"));
				QnA.setBmodify_date(rset.getDate("BMODIFY_DATE"));
			
				hmap.put("QnA", QnA);
				
				String mname = rset.getString("MNAME");
				String nickname = rset.getString("NICK_NAME");
				
				hmap.put("mname", mname);
				hmap.put("nickname", nickname);
				
				Reply reply = new Reply();
				
				reply.setReply_code(rset.getInt("reply_code"));
				reply.setReply_date(rset.getDate("reply_date"));
				reply.setReply_content(rset.getString("reply_content"));
				reply.setMno(rset.getInt("MNO"));
				
				hmap.put("reply" , reply);
				
				QnAlist.add(hmap);
			}
			
			System.out.println("QnA 상세:"+QnAlist);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return QnAlist;
	}

	public int insertQnAReply(Connection con, int bid, int mno, String replyContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnAReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	//지원 : 문의 - 삭제
	public int deleteMemberQnA(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String query = prop.getProperty("DeleteMemberQnA");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	//지원 - 실행중인 문의
	public ArrayList<HashMap<String, Object>> selectQnAProgressList(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		ArrayList<HashMap<String , Object>> QnAList = null;
		
		
		String query = prop.getProperty("selectQnAProgress");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			QnAList = new ArrayList<HashMap<String , Object>>();
			
			while(rset.next()) {
				HashMap<String , Object> Qhmap = new HashMap<String , Object>();
				
				int num = rset.getInt("ROWNUM");
				
				Qhmap.put("num", num);
				
				Board qna = new Board();
				
				qna.setBid(rset.getInt("BID"));
				qna.setBtitle(rset.getString("BTITLE"));
				qna.setBwriter(rset.getInt("BWRITER"));
				qna.setBdate(rset.getDate("BDATE"));
				qna.setBcategory(rset.getString("BCATEGORY"));
				qna.setBcontent(rset.getString("BCONTENT"));
				qna.setBdivision(rset.getString("BDIVISION"));
				
				Qhmap.put("QnA", qna);
				
				Qhmap.put("reply", null);
				
				String memberid = rset.getString("MNAME");
				String nickname = rset.getString("NICK_NAME");
				
				Qhmap.put("memberId", memberid);
				Qhmap.put("NickName", nickname);
				
				
				QnAList.add(Qhmap);
			}
			
			System.out.println("문의 :"+ QnAList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return QnAList;
	}

	//지원 - 진행 완료 문의
	public ArrayList<HashMap<String, Object>> selectQnACompleteList(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		ArrayList<HashMap<String , Object>> QnAList = null;
		
		
		String query = prop.getProperty("selectCompleteList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			QnAList = new ArrayList<HashMap<String , Object>>();
			
			while(rset.next()) {
				HashMap<String , Object> Qhmap = new HashMap<String , Object>();
				
				int num = rset.getInt("ROWNUM");
				
				Qhmap.put("num", num);
				
				Board qna = new Board();
				
				qna.setBid(rset.getInt("BID"));
				qna.setBtitle(rset.getString("BTITLE"));
				qna.setBwriter(rset.getInt("BWRITER"));
				qna.setBdate(rset.getDate("BDATE"));
				qna.setBcategory(rset.getString("BCATEGORY"));
				qna.setBcontent(rset.getString("BCONTENT"));
				qna.setBdivision(rset.getString("BDIVISION"));
				
				Qhmap.put("QnA", qna);
				
				Reply reply = new Reply();
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				
				Qhmap.put("reply", reply);
				
				String memberid = rset.getString("MNAME");
				String nickname = rset.getString("NICK_NAME");
				
				Qhmap.put("memberId", memberid);
				Qhmap.put("NickName", nickname);
				
				
				QnAList.add(Qhmap);
			}
			
			//System.out.println("문의 :"+ QnAList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return QnAList;
	}

	public ArrayList<HashMap<String, Object>> selectQnASearchList(Connection con, BoardPageInfo pi, String searchType,String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		ArrayList<HashMap<String , Object>> QnAList = null;
		
		String query = "";
		if (searchType.equals("Code")) {
			query = prop.getProperty("SearchQnACode");
		}else if (searchType.equals("Name")) {
			query = prop.getProperty("SearchQnAName");
		}else if (searchType.equals("NickName")) {
			query = prop.getProperty("SearchQnANickName");
		}else {
			query = prop.getProperty("SearchCategory");
		}
		
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			System.out.println("query :" + query);
			pstmt = con.prepareStatement(query);
			
			if (searchType.equals("Code")) {
				int num = Integer.parseInt(searchText);
				pstmt.setInt(1, num);
			}else {
				pstmt.setString(1, searchText);
			}
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			QnAList = new ArrayList<HashMap<String , Object>>();
			
			while(rset.next()) {
				HashMap<String , Object> Qhmap = new HashMap<String , Object>();
				
				int num = rset.getInt("ROWNUM");
				
				Qhmap.put("num", num);
				
				Board qna = new Board();
				
				qna.setBid(rset.getInt("BID"));
				qna.setBtitle(rset.getString("BTITLE"));
				qna.setBwriter(rset.getInt("BWRITER"));
				qna.setBdate(rset.getDate("BDATE"));
				qna.setBcategory(rset.getString("BCATEGORY"));
				qna.setBcontent(rset.getString("BCONTENT"));
				qna.setBdivision(rset.getString("BDIVISION"));
				qna.setBmodify_date(rset.getDate("BMODIFY_DATE"));
				
				Qhmap.put("QnA", qna);
				
				Reply reply = new Reply();
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				
				Qhmap.put("reply", reply);
				
				String memberid = rset.getString("MNAME");
				String nickname = rset.getString("NICK_NAME");
				
				Qhmap.put("memberId", memberid);
				Qhmap.put("NickName", nickname);
				
				
				QnAList.add(Qhmap);
			}
			
			//System.out.println("문의 :"+ QnAList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return QnAList;
		
	}

	public int insertBoard(Connection con, int mno, String title, String category, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, title);
			pstmt.setInt(2, mno);
			pstmt.setString(3, content);
			pstmt.setString(4, category);
			pstmt.setString(5, "커뮤니티");
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectBid(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectBid");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if (rset.next()) {
				bid = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return bid;
	}

	public int insertBoardAttachment(Connection con, int bid, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query  = prop.getProperty("insertBoardAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for (int i = 0 ; i < fileList.size() ; i++) {
				pstmt.setString(1, fileList.get(i).getOriginname());
				pstmt.setString(2, fileList.get(i).getChangename());
				pstmt.setString(3, fileList.get(i).getFilepath());
				pstmt.setInt(4, bid);
				
				result += pstmt.executeUpdate();
			}
		
			System.out.println("완료" + result);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Attachment> selectAttachment(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> attachlist = null;
		
		String query  = prop.getProperty("SelectCommuityAttach");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			attachlist = new ArrayList<>();
			
			while (rset.next()) {
				Attachment attach = new Attachment();
				
				attach.setAid(rset.getInt("AID"));
				attach.setBid(rset.getInt("BID"));
				attach.setChangename(rset.getString("CHANGE_NAME"));
				attach.setOriginname(rset.getString("ORIGIN_NAME"));
				attach.setFilepath(rset.getString("FILE_PATH"));
				attach.setAdivision(rset.getInt("ADIVISION"));
				
				attachlist.add(attach);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return attachlist;
	}

	public ArrayList<HashMap<String, Object>> selectReply(Connection con, int bid, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> replylist = null;
		
		String query  = prop.getProperty("SelectCommuityReply");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setInt(1, bid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			replylist = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				HashMap<String , Object> replyMap = new HashMap<String , Object>();
				
				Reply reply = new Reply();
				
				reply.setReply_code(rset.getInt("REPLY_CODE"));
				reply.setReply_date(rset.getDate("REPLY_DATE"));
				reply.setReply_content(rset.getString("REPLY_CONTENT"));
				reply.setMno(rset.getInt("MNO"));
				reply.setBid(rset.getInt("BID"));
				reply.setReply_modify_date(rset.getDate("REPLY_MODIFY_DATE"));
				
				replyMap.put("reply", reply);
				
				int num = rset.getInt("ROWNUM");
				
				replyMap.put("no", num);
				
				String nickname = rset.getString("NICK_NAME");
				String mid = rset.getString("MID");
				
				replyMap.put("nickname", nickname);
				replyMap.put("mid", mid);
				
				replylist.add(replyMap);
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return replylist;
	}

	public int getReplyCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("REPLYCOUNT");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int updateBoardLike(Connection con, int bid, int blike) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		blike = blike + 1; 
		
		String query = prop.getProperty("UPDATEBOARDLIKE");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, blike);
			pstmt.setInt(2, bid);
			
			result = pstmt.executeUpdate();
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectBoardLike(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int blike = 0;
		
		String query = prop.getProperty("SELECTBOARDLIKE");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bid);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				blike = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return blike;
	}

	public int updateBoardReply(Connection con, int replycode, String replycontent) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoardReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, replycontent);
			pstmt.setInt(2, replycode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoardReply(Connection con,int replycode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoardReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, replycode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoardAttachment(Connection con, int aid) {
		PreparedStatement pstmt = null;
		int result = 0;
	
		String query = prop.getProperty("deleteBoardAttach");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, aid);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectBoardManyLookup(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectManyLookup");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectBoardManyLike(Connection con, BoardPageInfo pi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectManyLike");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int getBoardChatterBox(Connection con , String bcategory) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result = 0;
		
		String query = prop.getProperty("selectBoardChatter");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, bcategory);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectBoardChatterBox(Connection con, BoardPageInfo pi, String bcategory) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardChatterList");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setString(2, bcategory);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectBoardTitleList(Connection con, BoardPageInfo pi, String serachText) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardTitleList");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setString(2, serachText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectBoardWriterList(Connection con, BoardPageInfo pi, String serachText) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardWriterList");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setString(2, serachText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectBoardContentList(Connection con, BoardPageInfo pi, String serachText) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectBoardContentList");
//		System.out.println(query);
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "커뮤니티");
			pstmt.setString(2, serachText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("no", rset.getInt("ROWNUM"));
				hmap.put("bid", rset.getInt("BID"));
				hmap.put("bcategory", rset.getString("BCATEGORY"));
				hmap.put("btitle", rset.getString("BTITLE"));
				hmap.put("bwriter", rset.getString("NICK_NAME"));
				hmap.put("bdate", rset.getDate("BDATE"));
				hmap.put("bcount", rset.getInt("BCOUNT"));
				hmap.put("blike", rset.getInt("BLIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	
	
}
