package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	
	// 게시물 리스트
	@GetMapping("/boardList")
	public void boardList(Model model , BoardVO boardVo, Criteria cri) throws Exception {
		log.info("list");
		
		model.addAttribute("list", service.boardList(cri));
	
		int total = service.getTotalCount(cri);
		log.info(total + "total");

		model.addAttribute("pageMaker", new PageMaker(cri, total));
	}
	
	// 게시물 등록 화면
	@GetMapping("/registerView")
	public void registerView() throws Exception {
		log.info("registerView");
	}
	
	// 게시물 등록
	@PostMapping("/register")
	public String register(BoardVO boardVo, RedirectAttributes rttr) throws Exception {
		log.info("register");
		
		service.register(boardVo);
		rttr.addFlashAttribute("result", boardVo.getBno());
		
		return "redirect:/board/boardList";
	}
	
	// 게시물 조회
	@GetMapping({"/read", "/update"})
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
		log.info("read , update");
		
		model.addAttribute("board",service.read(bno));
	}
	
	// 게시물 수정
	@PostMapping("/update")
	public String update(BoardVO boardVo, RedirectAttributes rttr) throws Exception {
		log.info("update");
		
		if(service.update(boardVo)) {
			rttr.addFlashAttribute("result","success");
		} 
		
		return "redirect:/board/boardList";
	}
	
	
	@PostMapping("/delete")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		
		log.info("delete");
		
		if(service.delete(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/board/boardList";
	}
	
}
