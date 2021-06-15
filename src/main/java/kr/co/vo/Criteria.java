package kr.co.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this.pageNum = 1;	// 페이지 번호
		this.amount = 10;	// 한페이지에 보여지는 데이터 수
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}