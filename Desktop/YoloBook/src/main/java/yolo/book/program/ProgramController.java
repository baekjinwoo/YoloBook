package yolo.book.program;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

//기본적으로 mvc는 jps->controller시 get,post메소드 사용필수
@Controller
@SessionAttributes("vo")
public class ProgramController {
	// @Autowired
	// ProgramService service;

	@Autowired
	SqlSession session;

	//0. main 이동
	@RequestMapping(value="/main")
	public String GoMain(){
		return "program/main";
	}
	//1. main_ajax
	@RequestMapping(value="/showperson", method = RequestMethod.POST)
	@ResponseBody
	public void ShowMain() {
		
	}
	
//////////////////////////////////////////////////////////////////////////////////////
/////// 1. MEMBER 컨트롤러 -시영
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginsucess(String id, String pw, Model model) { //LoginSucess
		ModelAndView mv = new ModelAndView();
		MemberVO vo = session.selectOne("member.loginCheck", id);
		
		System.out.println("입력id"+vo.getId()+":"+vo.getPw()+pw);
		//////////
		String loginFailMsg="";
		if(vo==null) {
			loginFailMsg="id없음";
			mv.addObject("loginFailMsg", loginFailMsg);
			//mv.setViewName("member/loginfail");
		}
		else if (vo.getId().equals("admin") && vo.getPw().equals("admin")) {
			mv.setViewName("program/main");
		}
		else if (vo.getPw().equals(pw)) {
			mv.setViewName("redirect:/mainPage");
			model.addAttribute("vo", vo); //로그인된 유저의 객체를 받아오기위하여
		}
		else if (!vo.getPw().equals("pw")) {
			loginFailMsg="pw틀림";
			mv.addObject("loginFailMsg", loginFailMsg);
			mv.setViewName("member/loginfail");
		}
	/*	///////////////
		if (vo.pw.equals(pw)) {
			if (vo.id.equals("admin")) {
				mv.setViewName("program/main");
			} else {
				mv.setViewName("redirect:/mainPage");
				model.addAttribute("vo", vo); //로그인된 유저의 객체를 받아오기위하여
			}
		} else {
			mv.setViewName("member/loginfail");
		}*/

		return mv;
	}

	@ModelAttribute("memberlist")
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = session.selectList("member.all");
		return list;
	}

	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public String memberList() {

		return "member/memberlist";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {

		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinsuccess(MemberVO vo) {

		session.insert("member.join", vo);

		return "redirect:/login";
	}
	//2. 회원정보 삭제
	@RequestMapping(value = "/mdelete", method = RequestMethod.GET)
	public String DeleteMember() {
		return "member/delete";
	}

	@RequestMapping(value = "/mdelete", method = RequestMethod.POST)
	public String DeleteMemberResult(String id, String pw) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		session.delete("member.delete", map);
		return "redirect:/memberlist";
	}

	//3. 회원정보 수정
	@RequestMapping(value="/mupdate",method=RequestMethod.GET)
	public String UpdateMember(){
		return "member/update";
	}
	
	@RequestMapping(value="/mupdate",method=RequestMethod.POST)
	public ModelAndView UpdateMember(String id, String pw, String phone, String username, String email){
		ModelAndView mv = new ModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("email", email);
		map.put("username", username);
		map.put("phone", phone);
		
		session.update("member.update", map);
		mv.setViewName("redirect:/main");
		return mv;
	}
	
	//4. 중복체크
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {
		System.out.println(id);
		String idcheck = session.selectOne("member.idCheck", id);
		System.out.println(idcheck); 
		
		return idcheck;
	}
	
//////////////////////////////////////////////////////////////////////////////////////
	//////// 0-a. 프로그램 전체조회
	@ModelAttribute("menulist")
	public List<ProgramVO> getProgramList() {
		List<ProgramVO> list = session.selectList("program.selectAll");
		return list;
	}

	@RequestMapping(value = "/pselect", method = RequestMethod.GET)
	public String SelectProgram() {

		return "program/select";
	}
	//////// 0-b. 일부조회
	// @RequestMapping(value="/select",method=RequestMethod.POST)
	// public ModelAndView SelectProgramResult(){
	// ModelAndView mv = new ModelAndView();
	//
	// List<ProgramVO> list = session.selectOne("program.selectAll");
	// mv.addObject("volist",list);
	//
	// mv.setViewName("select");
	// return mv;
	// }

	//////// 1. 프로그램 삽입
	@RequestMapping(value = "/pinsert", method = RequestMethod.GET)
	public String InsertProgram() {
		return "program/insert"; 
	}

	// @RequestMapping(value="/insert",method=RequestMethod.POST)
	// public ModelAndView InsertProgramResult(HttpServletRequest request){
	// ModelAndView mv = new ModelAndView();
	//
	// Map<String, String> map = new HashMap<String,String>();
	// map.put("pname", request.getParameter("pname"));
	// map.put("starttime", request.getParameter("starttime"));
	// map.put("endtime", request.getParameter("endtime"));
	// map.put("day", request.getParameter("day"));
	// map.put("price", request.getParameter("price"));
	// map.put("limit", request.getParameter("limit"));
	//
	// session.insert("program.insert",map);
	// mv.setViewName("redirect:/insert");
	// return mv;
	// }

	@RequestMapping(value = "/pinsert", method = RequestMethod.POST)
	public ModelAndView InsertProgramResult(String pname, String starttime, String endtime, String day, String price,
			String limit) {

		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();

		map.put("pname", pname);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("day", day);
		map.put("price", price);
		map.put("limit", limit);

		session.insert("program.insert", map);
		mv.setViewName("redirect:/pinsert");
		return mv;
	}

	////// 2. 삭제
	@RequestMapping(value = "/pdelete", method = RequestMethod.GET)
	public String DeleteProgram(String number) {
		System.out.println(number);
		
		return "program/delete"; //jsp파일로 이동 delete.jsp
	}

	@RequestMapping(value = "/pdelete", method = RequestMethod.POST)
	public String DeleteProgramResult(String number) {
		
		session.delete("program.delete", number);
		return "redirect:/pselect"; //controller 메소드의 매핑값으로 이동. url => pinsert로 이동
	}

	/////// 3. 수정
	@RequestMapping(value = "/pupdate", method = RequestMethod.GET)
	public String UpdateProgram() {
		return "program/update";
	}

	@RequestMapping(value = "/pupdate", method = RequestMethod.POST)
	public ModelAndView UpdateProgramResult(String pnumber1, String price1, String time1, String time2) {

		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();

		map.put("pnumber", pnumber1);
		map.put("price", price1);
		map.put("starttime", time1);
		map.put("endtime", time2);

		session.update("program.update", map);
		mv.setViewName("redirect:/pinsert");
		return mv;
	}
}
