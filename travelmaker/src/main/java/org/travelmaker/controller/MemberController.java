package org.travelmaker.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.travelmaker.domain.MemberVO;
import org.travelmaker.service.SocialLoginService;
import org.travelmaker.service.MemberService;

import com.fasterxml.jackson.databind.JsonNode;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	private static String REDIRECT_MY_INFO_PAGE = "redirect:/member/getMember?email=";
	private final MemberService service;
	private final SocialLoginService socialLoginService;
	
	public MemberController(MemberService memberService, SocialLoginService socialLoginService) {
		this.service = memberService;
		this.socialLoginService = socialLoginService;
	}
	

	// 회원가입
	@RequestMapping(value = "/joinMember", method = RequestMethod.POST)
	public String joinMember(MemberVO mVO, HttpSession session, RedirectAttributes rttr, HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");
		
		// 이메일, 닉네임 한번 더 중복체크
		if(service.isDuplicateCheck(mVO, rttr)) {
			return "redirect:" + referer;
		}
		
		service.join(mVO); 
		rttr.addFlashAttribute("msg", "여행의정석 가족이 되신걸 환영합니다. 로그인 해주세요");
		return "redirect:/main/index";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO mVO, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		
		String referer = request.getHeader("Referer");
		
		// 유효한 회원인지 검사
		if(service.isValidMember(mVO, rttr)) {
			return "redirect:" + referer; 
		}
		
		// email 저장하기 여부
		service.rememberEmail(mVO.getEmail(), request, response);	

		if(service.isAdminLogin(mVO, session)) {
			return "redirect:/admin/main";
		}
		return "redirect:" + referer; 
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) throws Exception{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	// 회원 조회
	@RequestMapping(value = "/getMember", method = RequestMethod.GET)
	public String getMember(String email, Model model, HttpSession session) {
		
		model.addAttribute("member", service.getMember(email));
		
		// 소셜회원은 소셜정보조회페이지로 이동
		if(service.isApiLoginCheck(email)) {
			return "/member/apiMemberInfo";
		}
		
		return "/member/memberInfo";
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
	public String modifyPwd(String newPwd, String inputPwd, String email, HttpSession session, RedirectAttributes rttr) {
		
		try {
			
			// 정보변경 시, 입력한 내용이 유효한지 검사(이메일, 비밀번호 *개발자도구로 값바꾸는거 막자)
			if(service.isValidInputCheck(email, inputPwd, newPwd, session, rttr)) {
				return REDIRECT_MY_INFO_PAGE + session.getAttribute("email");
			}
	
			service.modifyPwd(newPwd, email);
			
			// 변경된 회원의 정보를 출력한다.
			rttr.addFlashAttribute("msg", "정보를 정상적으로 변경하였습니다.");
			rttr.addFlashAttribute("member", service.getMember(email));
			
		}catch (NullPointerException npe) {
			npe.getStackTrace();
			rttr.addFlashAttribute("msg", "세션이 만료되었습니다.");
			return "redirect:/main/index";
		}
		
		return REDIRECT_MY_INFO_PAGE + session.getAttribute("email");
	}
	
	
	// Ajax Email체크
	@RequestMapping("/hasEmail")
    @ResponseBody
    public String hasEmail(@RequestParam("email") String email) {
        String cnt = ""+service.hasEmail(email);
        return cnt;
    }
	
	// Ajax 닉네임 체크(memberInfo)
	@RequestMapping("/hasNickname")
	@ResponseBody
	public String hasNickname(@RequestParam("nickname") String nickname) {
		String cnt = "" + service.hasNickname(nickname);
		return cnt;
	}
	
	//aJax 금액 충전
	@RequestMapping("/pointCharging")
	@ResponseBody
	public void pointCharging(@RequestParam("point") long point, @RequestParam String email) {
		log.info("충전 금액 " + point + "원");
		service.pointCharging(point, email);
		
	}
	
	// 정보수정 -> 저장하기 누르면 실행
	@RequestMapping(value = "/saveMember", method = RequestMethod.POST)
	public String saveMember(String nickname, String email, HttpSession session, RedirectAttributes rttr) {
		
		try {
			MemberVO member = service.getMember(email);
			
			service.doubleCheckOnesNickname(nickname, member, rttr);
			
		}catch (NullPointerException npe) {
			npe.getStackTrace();
			rttr.addFlashAttribute("msg", "세션이 만료되었습니다.");
			return "redirect:/main/index";
		}catch (Exception e) {
			e.getStackTrace();
			rttr.addFlashAttribute("msg", "예상치못한 에러가 발생했습니다. 홈페이지로 이동합니다");
			return "redirect:/main/index";
		}
		
		// 중복이 없다면 정보가 정상적으로 저장되었습니다.
		return REDIRECT_MY_INFO_PAGE + session.getAttribute("email");
	}
	
	
	// 회원탈퇴
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String deleteMember(String pwd, String email, HttpSession session, RedirectAttributes rttr) {
			
		if(service.isDoubleCheckOnesPwd(pwd, email, rttr, session)) {
			return REDIRECT_MY_INFO_PAGE + session.getAttribute("email");
		}
		return "redirect:/main/index";
	}
	
	// api 회원탈퇴
	@RequestMapping(value = "/deleteApiMember", method = RequestMethod.POST)
	public String deleteApiMember(String email, HttpSession session, RedirectAttributes rttr) {
		
		service.deleteApiMember(email, rttr, session);
		return "redirect:/main/index";
	}
	

	// 카카오 로그인 시작
	 @RequestMapping(value="/kakao",method= RequestMethod.GET)
	 public String kakaoConnect(HttpServletRequest request, HttpSession session) {
		 
		 String referer = request.getHeader("Referer"); // 로그인하는 페이지의 주소를 저장한다.
		 session.setAttribute("referer", referer);		// 현재 주소를 세션에 저장하자
		 StringBuffer url = socialLoginService.getKakaoConnect();  // 카카오 소셜로그인 url 얻어오기
		  
		  return "redirect:" + url.toString();
	 }
	 
		 
	 @RequestMapping(value="/kakaoLogin",produces="application/json",method= {RequestMethod.GET, RequestMethod.POST})
	 public String kakaoLogin(@RequestParam("code")String code, RedirectAttributes rttr, HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model)throws IOException {
			 
		 String referer = (String)session.getAttribute("referer"); // 세션에 저장한 주소를 변수에 저장한다.
		  
		 JsonNode access_token = socialLoginService.getKakaoToken(code); // 카카오 토큰을 얻어온다
		 JsonNode userProfile = socialLoginService.getKakaoUserProfile(access_token); // 카카오 로그인 정보를 가져온다.
		 String email = userProfile.path("kakao_account").get("email").textValue(); // 프로필에서 이메일을 가져온다.
		         
	  		// 회원이 아니면 회원가입해주세요
	  		if(service.isKakaoApiJoinCheck(userProfile, model)) {
	  			return "/member/apiRegister";
	  		}
	  		
	  		// 탈퇴한 계정이면 로그인 안됩니다.
	  	    if(service.isDeleteAlready(email, rttr)) { 
		    	return "redirect:" + referer;
		    }
	  		
	  	// 이미 회원이면 로그인 처리
	  	session.setAttribute("email", email);
	  	service.setLoginDateToToday(email); // 최종 로그인은 오늘..
	  	log.info("카카오 로그인한 회원의 번호 : " + service.getMember(email).getMemNo());
	  	
	  	return "redirect:" + referer;
	  
	 }
    
}