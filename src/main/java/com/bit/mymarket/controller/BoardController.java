package com.bit.mymarket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.mymarket.service.BoardService;
import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ReplyVo;
import com.bit.mymarket.vo.UserVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	int s_page;
	int c_m_page;

	public BoardController() {
		s_page = 1;
		c_m_page = 10;
	}

	class page {
		final static int pagePerboardCNT = 10;
		int skip;
		int t_page;

		public int countrow() {
			return (int) Math.ceil((boardService.countrow() / (double) 6));
		}

	}

	@Autowired
	BoardService boardService;

	@RequestMapping("/{no}")
	public String list(@PathVariable("no") Integer c_page,
			@RequestParam(required = false) String kwd, Model model) {
		int skip = (c_page - 1) * page.pagePerboardCNT;
		List<BoardVo> list = kwd == null ? boardService.list(skip,
				page.pagePerboardCNT) : boardService.list(skip, 10, kwd);
		System.out.println("kwd " + kwd);
		// List<BoardVo> list = boardService.list(skip, 6);
		int t_page = (int) Math
				.ceil((boardService.countrow() / (double) page.pagePerboardCNT));

		
		if (c_page < 11) {
			c_m_page = 10;
			s_page = 1;
		}

		if (c_page % 10 == 1 && c_page > 10) {
			System.out.println("c_page % 10 == 1 !!!");
			s_page = c_page;
			c_m_page = s_page + 9;
			
			if (c_m_page > t_page){
				System.out.println("c_m_page>t_page !! ");
				c_m_page = t_page;
			}
		}

		System.out.println("시작페이지는 " + s_page);
		System.out.println("현재 페이지는(c_page) " + c_page);
		System.out.println("현재 표시할 맥스 페이지는  (c_m_page)" + c_m_page);
		System.err.println("t_page : " + t_page);
		model.addAttribute("c_page", c_page);
		model.addAttribute("s_page", s_page);
		model.addAttribute("c_m_page", c_m_page);
		model.addAttribute("t_page", t_page);
		model.addAttribute("list", list);
		return "/board/list";
	}

	@RequestMapping("/writeform")
	public String writeform() {
		return "/board/write";

	}

	@RequestMapping("/write")
	public String write(@RequestParam String content, String title,
			HttpSession session) {
		System.out.println("!!!!");
		UserVo userVo = (UserVo) session.getAttribute("authUser");

		if (userVo == null)
			return "redirct:/user/loginform";

		BoardVo boardVo = new BoardVo();

		boardVo.setContent(content);
		boardVo.setTitle(title);
		System.out.println(boardVo);
		boardService.write(boardVo);

		return "redirect:/board/1";
	}

	@RequestMapping("/delete/{no}")
	public String delete(@PathVariable Long no, HttpSession session) {
		if (no == null && session == null)
			return "redirect:/board/";
		System.out.println("글의 no: " + no + ", " + session);
		boardService.delete(no);
		return "redirect:/board/1";

	}

	@RequestMapping("/view/{no}")
	public String view(@PathVariable Long no, Model model) {

		model.addAttribute("vo", boardService.view(no));
		model.addAttribute("replyList", boardService.getReplyList(no));

		return "/board/view";
	}

	@RequestMapping("/addreply/{no}")
	public String addReply(@PathVariable Long no,
			@RequestParam(required = false) String content, HttpSession session) {

		if (session.getAttribute("authUser") == null) {
			return "redirect:/user/loginform";
		}
		System.out.println("!!!");
		System.out.println((UserVo) session.getAttribute("authUser"));
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		ReplyVo vo = new ReplyVo();
		vo.setContent(content);
		vo.setBoardNo(no);
		vo.setUserNo(userVo.getNo());
		System.out.println("저장할 vo의 값 : " + vo);

		boardService.addreply(vo);

		return "redirect:/board/view/" + no;

	}

	@RequestMapping("/deletereply/{no}")
	public String deleteReply(@PathVariable Long no,
			@RequestParam Long articleNo) {
		boardService.delreply(no);

		return "redirect:/board/view/" + articleNo;
	}

	@RequestMapping("/replyreplyform")
	public String replyreplyform(@RequestParam Long replyNo,
			@RequestParam Long articleNo, Model model) {

		model.addAttribute("replyNo", replyNo);

		return "/board/replyreplyform";
	}

	@RequestMapping("/replyreply")
	public String replyreply(@RequestParam Long replyNo,
			@RequestParam String replyContent, Model model, HttpSession session) {
		if (session == null)
			return "redirect:/user/loginform";
		System.out.println("replyNo : " + replyNo);
		ReplyVo tatgetReplyVo = boardService.getReply(replyNo);
		System.out.println(tatgetReplyVo);

		UserVo userVo = (UserVo) session.getAttribute("authUser");
		System.out.println("userVo : " + userVo);
		ReplyVo rereplyVo = new ReplyVo();

		rereplyVo.setGroupNo(tatgetReplyVo.getGroupNo());
		rereplyVo.setOrderNo(tatgetReplyVo.getOrderNo() + 1);
		rereplyVo.setDepth(tatgetReplyVo.getDepth() + 1);

		System.out.println("rereplyVo : " + rereplyVo);
		boardService.addReReply(rereplyVo);

		model.addAttribute("rereplyVo", rereplyVo);

		return "redirect:/board/view/" + rereplyVo.getBoardNo();
	}

}
