package com.kh.redding.board.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.dao.BoardDao;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.board.model.vo.Reply;

public class BoardService {
	//게시물 수 조회용 메소드
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectBoardList(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoardList(con, pi);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectOne(int num, BoardPageInfo pi) {
		Connection con = getConnection();
		
		HashMap<String, Object> boardMap = new HashMap<String, Object>();
		
		int result = new BoardDao().updateCount(con, num);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		HashMap<String, Object> boardDetail = new BoardDao().selectOne(con, num);
		
		int bid = 0;
		
		if(boardDetail != null && boardDetail.size() > 0) {
			
			Board board = (Board)boardDetail.get("board");
			
			bid = board.getBid();
			
			boardMap.put("board", boardDetail);
			
			ArrayList<Attachment> attachlist = new BoardDao().selectAttachment(con, bid);
			
			boardMap.put("attachlist", attachlist);
			
			ArrayList<HashMap<String, Object>> replylist = new BoardDao().selectReply(con, bid , pi);
			
			boardMap.put("replylist", replylist);
		}
		
		close(con);
		
		return boardMap;
	}

	//공지사항 insert
	public int insertNotice(String noticeTitle, String noticeContent, int writer) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertNotice(con, noticeTitle , noticeContent , writer);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//공지사항 리스트 가져오기
	public ArrayList<HashMap<String, Object>> selectNotice(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> NoticeList = new BoardDao().selectNotice(con, pi);
		
		close(con);
		
		return NoticeList;
	}

	//공지사항 갯수
	public int getAllNoticeListCount() {
		Connection con = getConnection();
		
		int result = new BoardDao().selectNoticeListCount(con);
		
		close(con);
		
		return result;
	}
	
	
	//공지사항 한개의 값 가져오기 - 상세
	public Board selectNoticeOne(int bid) {
		Connection con = getConnection();
		
		Board selectBoard = new BoardDao().selectNoticeOne(con , bid);
		
		close(con);
		
	
		return selectBoard;
	}

	//공지사항 수정
	public int UpdateNotice(int bid, String btitle, String bcontent) {
		Connection con = getConnection();
		
		int result = new BoardDao().UpdateNotice(con,bid,btitle,bcontent);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
	//조회 수 증가
	public int updateNoticeCount(int bid) {
		Connection con = getConnection();
		
		//조회 수 조회
		int count = new BoardDao().selectNoticeCount(con, bid);
		
		int result = new BoardDao().updateNoticeCount(con, bid ,count);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		int resultcount = new BoardDao().selectNoticeCount(con, bid);
		
		close(con);
		
		return resultcount;
	}

	//공지사항 글 한개 삭제
	public int deleteNoticeOne(int bid) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteNoticeOne(con, bid);
		
		if (result > 0) {
			commit(con);
		}else { 
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
	//자주하는 질문 추가
	public int insertFAQ(String noticeTitle, String noticeContent, int writer) {
		Connection con = getConnection();
		
		
		int result = new BoardDao().insertFAQ(con,noticeTitle, noticeContent , writer);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		return result;
	}

	//자주하는 질문 갯수
	public int getAllFAQListCount() {
		Connection con = getConnection();
		
		int result = new BoardDao().selectFAQListCount(con);
		
		close(con);
		
		return result;
	}

	//자주하는 질문 리스트 
	public ArrayList<Board> selectFAQList(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Board> FAQList = new BoardDao().selectFAQList(con, pi);
		
		close(con);
		
		return FAQList;
	}

	//문의글 작성
	public int insertQnA(int mno, String conTitle, String contact, String category) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertQnA(con, mno , conTitle , contact , category);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//QnA 리스트 불러오기
	public ArrayList<HashMap<String, Object>> selectQnAList(int mno, BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String , Object>> QnAlist = new BoardDao().selectQnAList(con, mno , pi);
		
		close(con);
		
		return QnAlist;
	}

	public int getQnACountSelect(int mno) {
		Connection con = getConnection();
		
		int count = new BoardDao().selectQnaCount(con, mno);
		
		close(con);
		
		return count;
	}

	public int getQnAAllCountSelect() {
		Connection con = getConnection();
		
		int count = new BoardDao().selectQnaAllCount(con);
		
		close(con);
		
		return count;
	}

	//관리자 믄의 전체 리스트 조회
	public ArrayList<HashMap<String, Object>> selectAllQnAList(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String , Object>> QnAlist = new BoardDao().selectQnAAllList(con, pi);
		
		close(con);
		
		return QnAlist;
	}

	public int insertQnaBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertQnaBoard(con, b);
		
		if(result > 0) {
			commit(con);
		}else {
			System.out.println("nnn");
			rollback(con);
		}
		
		return result;
	}
    
	public int getQnACompleteSelect() {
		Connection con = getConnection();
		
		int result = new BoardDao().selectQnACompleteSelect(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> SelectQnAOneDetail(int bid) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> QnAList = new BoardDao().selectQnAOneDetail(con,bid);
		
		close(con);
		
		return QnAList;
	}

	public int insertQnAReply(int bid, int mno, String replyContent) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertQnAReply(con,bid,mno,replyContent);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		
		return result;
	}

	//회원이 일대일 문의 내역을 삭제하는 메소드
	public int DeleteMemberQnA(int bid) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteMemberQnA(con, bid);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

	//지원 - 진행 중인 문의
	public ArrayList<HashMap<String, Object>> selectQnAProgress(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String , Object>> QnAlist = new BoardDao().selectQnAProgressList(con, pi);
		
		close(con);
		
		return QnAlist;
	}

	//지원 - 진행완료 문의
	public ArrayList<HashMap<String, Object>> selectQnAComplete(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String , Object>> QnAlist = new BoardDao().selectQnACompleteList(con, pi);
		
		close(con);
		
		return QnAlist;
	}

	//지원-문의 검색
	public ArrayList<HashMap<String, Object>> selectQnASearch(BoardPageInfo pi, String searchType, String searchText) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String , Object>> QnAlist = new BoardDao().selectQnASearchList(con, pi , searchType , searchText);
		
		close(con);
		
		return QnAlist;
	}

	
	//지원 - 커뮤니티 insert
	public int insertBoard(int mno, String content, String title, String category, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, mno, title , category , content);
		
		int totalresult = 0;
		if (result > 0) {
			
			int bid = new BoardDao().selectBid(con);
			
			totalresult += new BoardDao().insertBoardAttachment(con, bid , fileList);
			
			
		}
		
		
		if (totalresult == fileList.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return totalresult;
	}

	//지원 - 게시판 댓글 총 갯수
	public int getReplyCount(int num) {
		Connection con = getConnection();
		
		int result = new BoardDao().getReplyCount(con, num);
		
		close(con);
		
		return result;
	}

	public int UpdateBoardLike(int bid) {
		Connection con = getConnection();
		
		int blike = new BoardDao().selectBoardLike(con, bid);
	
		int result = new BoardDao().updateBoardLike(con, bid, blike);
		
		int likecount  = 0 ;
		if (result > 0) {
			commit(con);
			
			likecount = new BoardDao().selectBoardLike(con , bid);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return likecount;
	}

	public int updateBoardReply(int replycode, String replycontent) {
		Connection con = getConnection();
		
		int result = new BoardDao().updateBoardReply(con , replycode , replycontent);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteBoardReply(int replycode) {
		Connection con = getConnection(); 
		
		int result = new BoardDao().deleteBoardReply(con,replycode);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

	//커뮤니티 글 삭제 
	public int deleteBoard(int bid) {
		Connection con = getConnection();

		ArrayList<Attachment> attach = null;
		
		attach = new BoardDao().selectAttachment(con, bid);
		
		int result = new BoardDao().deleteMemberQnA(con, bid);
		
		if (result > 0) {
			
			for (int i = 0 ; i < attach.size() ; i++) {
				Attachment at = new Attachment();
				System.out.println("at :" + at);
						
				File failedFile = new File(at.getFilepath() + at.getChangename());
						
				failedFile.delete();
			}
					
			commit(con);
			
		}else {
			rollback(con);
		}
			
		
	
		return result;
		
	}

	public ArrayList<HashMap<String, Object>> selectManyLookUp(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoardManyLookup(con, pi);
		
		close(con);
		
		return list;
		
		
	}

	public ArrayList<HashMap<String, Object>> selectManyLike(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoardManyLike(con, pi);
		
		close(con);
		
		return list;
	}

	public int getBoardchatterbox(String bcategory) {
		Connection con = getConnection();
		
		int count = new BoardDao().getBoardChatterBox(con ,bcategory);
		
		close(con);
		
		return count;
	}

	public ArrayList<HashMap<String, Object>> selectBoardchatterbox(BoardPageInfo pi, String bcategory) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoardChatterBox(con, pi , bcategory);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> boardDetail(int bid) {
		Connection con = getConnection();
		
		HashMap<String, Object> boardMap = new HashMap<String, Object>();
		
		HashMap<String, Object> boardDetail = new BoardDao().selectOne(con, bid);
				
		if(boardDetail != null && boardDetail.size() > 0) {
			
			Board board = (Board)boardDetail.get("board");
			
			bid = board.getBid();
			
			boardMap.put("board", boardDetail);
			
			ArrayList<Attachment> attachlist = new BoardDao().selectAttachment(con, bid);
			
			boardMap.put("attachlist", attachlist);
		}
		
		close(con);
		
		return boardMap;
	}

	public ArrayList<HashMap<String, Object>> selectBoardSearch(BoardPageInfo pi, String selectType,
			String serachText) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = null;
		
		if (selectType.equals("Title")) {
			list = new BoardDao().selectBoardTitleList(con, pi , serachText);			
		}else if (selectType.equals("Writer")) {
			list = new BoardDao().selectBoardWriterList(con, pi , serachText);		
		}else if (selectType.equals("Content")) {
			list = new BoardDao().selectBoardContentList(con, pi ,serachText);		
		}
		
		close(con);
		
		return list;
		
		
		
	}



}
