package kr.co.mapper;

import java.util.List;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

public interface BoardMapper {
	
	// 리스트
	//public List<BoardVO> boardList();
	
	// 페이징 리스트
	public List<BoardVO> boardList(Criteria cri);
	
	// 게시물 갯수
	public int getTotalCount(Criteria cri);

	// bno 값을 미리 생성하여 게시물 입력
	public void registerSelectKey(BoardVO boardVo);
	
	// 게시물 조회
	public BoardVO read(int bno);
	
	// 게시글 삭제
	public int update (BoardVO boardVo);
	
	// 게시글 삭제
	public int delete (int bno);
}
