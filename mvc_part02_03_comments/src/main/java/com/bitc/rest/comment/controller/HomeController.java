package com.bitc.rest.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitc.board.util.Criteria;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		// Export 시킨 pageMaker.jar 파일 확인 
		/*
		Criteria cri = new Criteria();
		System.out.println(cri);
		*/
		return "home";
	}
	
}
