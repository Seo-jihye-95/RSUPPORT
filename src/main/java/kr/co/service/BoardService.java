package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

public interface BoardService {
	
	// 게시글 작성 
	public void register(BoardVO boardVo) throws Exception;
	
	// 게시글 리스트 조회 
	//public List<BoardVO> boardList(BoardVO boardVo) throws Exception;
	
	// 게시글 리스트 조회 페이징
	public List<BoardVO> boardList(Criteria cri) throws Exception;
	
	// 게시글 갯수
	public int getTotalCount(Criteria cri) throws Exception;
	
	// 게시글 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시글 수정 
	public boolean update(BoardVO boardVo) throws Exception;
	
	// 게시글 삭제 
	public boolean delete(int bno) throws Exception;

}
