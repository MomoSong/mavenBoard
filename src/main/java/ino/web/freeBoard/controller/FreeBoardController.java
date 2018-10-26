package ino.web.freeBoard.controller;

import java.util.HashMap;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.Pagination;
import ino.web.freeBoard.service.FreeBoardService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;

	// 메인으로 들어가는 진입 포인트
	@RequestMapping("/main.ino")
	public ModelAndView main(HttpServletRequest request) {
		int page = 0;
		String url = request.getRequestURI();
		String pageFromReq = request.getParameter("page");
		String search = request.getParameter("search");
		String searchType = request.getParameter("searchType");
		
		if(pageFromReq == null){
			page = 1;
		}else{
			page = Integer.parseInt(pageFromReq);
		}
		Pagination pagination = new Pagination(page, freeBoardService.totalCount(), url);
		pagination.setSearch(search);
		pagination.setSearchType(searchType);
		String pageResult = pagination.getPagination();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardMain");
		mav.addObject("freeBoardDto", freeBoardService.selectList(pagination));
		mav.addObject("pageResult", pageResult);
		System.out.println(pagination);
		return mav;
	}

	// 상세보기 페이지
	@RequestMapping("/detail.ino")
	public ModelAndView detailView(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		return new ModelAndView("freeBoardDetail", "dto",
				freeBoardService.selectOne(num));
	}

	// 글쓰기 페이지
	@RequestMapping(value = "/insert.ino", method = RequestMethod.GET)
	public String insert() {
		return "freeBoardInsert";
	}

	// 글쓰기 페이지 pro
	@RequestMapping(value = "/insertPro.ino", method = RequestMethod.POST)
	public ModelAndView insertPro(FreeBoardDto dto) {
		freeBoardService.insert(dto);

		int maxNum = freeBoardService.maxNum();

		FreeBoardDto postDto = freeBoardService.afterInsert(maxNum);
		return new ModelAndView("freeBoardDetail", "dto", postDto);
	}

	// 글 수정 페이지
	@RequestMapping(value = "/modify.ino", method = RequestMethod.POST)
	public String modify(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		String regdate = request.getParameter("regdate");

		FreeBoardDto dto = new FreeBoardDto();
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setName(name);
		dto.setRegdate(regdate);

		freeBoardService.modify(dto);
		return "redirect:main.ino";
	}

	// 글 삭제 페이지
	@RequestMapping(value = "/delete.ino", method = RequestMethod.POST)
	public String modify(FreeBoardDto dto) {
		freeBoardService.delete(dto.getNum());
		return "redirect:main.ino";
	}

}
