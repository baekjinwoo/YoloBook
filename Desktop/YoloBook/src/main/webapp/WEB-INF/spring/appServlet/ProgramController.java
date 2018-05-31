package yolo.book.program;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//main�쑝濡� 媛��뒗 �솕硫�
@Controller
public class ProgramController {
	// @Autowired
	// ProgramService service;

	@Autowired
	SqlSession session;

	
	//main
	@RequestMapping(value="/main")
	public String GoMain(){
		return "program/main";
	}
	
	// MEMBER 컨트롤러 -시영
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "program/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginsucess(String id, String pw) {

		ModelAndView mv = new ModelAndView();
		MemberVO vo = session.selectOne("member.loginCheck", id);
		if (vo.pw.equals(pw)) {
			if (vo.id.equals("admin")) {
				mv.setViewName("program/main");
			} else {
				mv.setViewName("main/calendar");
			}
		} else {
			mv.setViewName("program/loginfail");
		}

		return mv;
	}

	@ModelAttribute("memberlist")
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = session.selectList("member.all");
		return list;
	}

	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public String memberList() {

		return "program/memberlist";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {

		return "program/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinsuccess(MemberVO vo) {

		session.insert("member.join", vo);

		return "redirect:/login";
	}
	
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {
		System.out.println(id);
		
		String idcheck = session.selectOne("member.idCheck",id);
		
		System.out.println(idcheck);
		
		return idcheck;
	}

	//////// 0-a. �삁�빟�쁽�솴 議고쉶 湲곕뒫(�쟾泥댁“�쉶)
	@ModelAttribute("menulist")
	public List<ProgramVO> getProgramList() {
		List<ProgramVO> list = session.selectList("program.selectAll");
		return list;
	}

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String SelectProgram() {

		return "program/select";
	}
	//////// 0-b. �씪遺�議고쉶
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

	//////// 1. �떊洹쒗봽濡쒓렇�옩 �엯�젰 ; �궗吏꾩텛媛��븷 �삁�젙
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
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

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
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
		mv.setViewName("redirect:/insert");
		return mv;
	}

	////// 2. �궘�젣
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String DeleteProgram() {
		return "program/delete";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String DeleteProgramResult(int number) {
		session.delete("program.delete", number);
		return "redirect:/insert";
	}

	/////// 3. �닔�젙
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String UpdateProgram() {
		return "program/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView UpdateProgramResult(String pnumber1, String price1, String time1, String time2) {

		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();

		map.put("pnumber", pnumber1);
		map.put("price", price1);
		map.put("starttime", time1);
		map.put("endtime", time2);

		session.update("program.update", map);
		mv.setViewName("redirect:/insert");
		return mv;
	}

}
