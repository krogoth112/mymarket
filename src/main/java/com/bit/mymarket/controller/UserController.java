package com.bit.mymarket.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.mymarket.service.UserServiceImpl;
import com.bit.mymarket.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	@RequestMapping("/joinform")
	public String joinform() {
		return "/user/joinform";
	}
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo userVo) {
		userService.join(userVo);
		return "redirect:/";
	}
	@RequestMapping("/joinsuccess")
	public String joinsuccess(@ModelAttribute UserVo userVo) {
		return "/user/joinsuccess";
	}

	@RequestMapping("/loginform")
	public String loginform() {
		return "/user/loginform";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, 
						@ModelAttribute UserVo vo) {
		UserVo userVo =  userService.getLoginInfo(vo);
		if(userVo==null){
			return "redirect:/user/loginform";
		}
		session.setAttribute("authUser", userVo);
		return "redirect:/";
	}
	
	@RequestMapping("/loginBySns")
	public String loginBySns(HttpSession session, 
							 @ModelAttribute UserVo vo){
		System.out.println(vo);
		UserVo userVo = userService.getByIdNo(vo.getIdNo());
		if(userVo==null){
			userService.join(vo);
			userVo = userService.getByIdNo(vo.getIdNo());
			session.setAttribute("authUser", userVo);
			return "redirect:/";
		}
		session.setAttribute("authUser", userVo);
		return "redirect:/";
	}


	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/";
	}



/*	@RequestMapping("/checkemail")
	@ResponseBody
	public HashMap checkEmail(@RequestParam("email") String email) {
		System.out.println("email : " + email);
		String reusltedemail = userService.getByEmail(email);
		System.out.println("reusltedemail : " + reusltedemail);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", (reusltedemail == null) ? "not exist" : "exist");
		System.out.println("map : " + map);
		return map;
	}*/
	

}
