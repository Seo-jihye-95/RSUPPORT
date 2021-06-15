package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.BoardMapper;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	@Setter(onMethod_ = @Autowired) 
	private BoardMapper mapper;
	 

	// 게시글 작성
	@Override
	public void register(BoardVO boardVo) throws Exception {
		log.info("regist");
		mapper.registerSelectKey(boardVo);
	}

	// 게시글 리스트 조회
	@Override
	public List<BoardVO> boardList(Criteria cri) throws Exception {
		log.info("boardList");
		
		return mapper.boardList(cri);
	}

	// 게시글 갯수
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		log.info("getTotalCount");
		
		return mapper.getTotalCount(cri);
	}
	
	// 게시글 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		log.info("read");
		return mapper.read(bno);
	}

	// 게시글 수정
	@Override
	public boolean update(BoardVO boardVo) throws Exception {
		log.info("update");
		return mapper.update(boardVo) == 1 ;
	}

	// 게시글 삭제
	@Override
	public boolean delete(int bno) throws Exception {
		log.info("delete");
		return mapper.delete(bno) == 1;
	}


}
