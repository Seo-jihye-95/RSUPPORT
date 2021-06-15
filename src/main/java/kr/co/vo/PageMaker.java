package kr.co.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	private int startPage;	// 게시판의 화면에 보여질 시작 페이지 번호
	private int endPage;	// 게시판의 화면에 보여질 마지막 페이지 번호
	private boolean prev;	// 이전 페이지 버튼 활성화 여부
	private boolean next;	// 다음 페이지 버튼 활성화 여부
	private int total;		// 게시판 글 전체 갯수
	private Criteria cri;	// 앞에 생성한 Criteria를 주입받음
	
	public PageMaker(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
	
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
