package yolo.book.program;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//main으로 가는 화면
@Controller
public class ProgramController {
	//@Autowired
	//ProgramService service;
	
	@Autowired 
	SqlSession session;
	
////////1. 신규프로그램 입력 ; 사진추가할 예정
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String InsertProgram(){
		return "program/insert";
	}
	
//	@RequestMapping(value="/insert",method=RequestMethod.POST)
//	public ModelAndView InsertProgramResult(HttpServletRequest request){
//		ModelAndView mv = new ModelAndView();
//
//		Map<String, String> map = new HashMap<String,String>();
//		map.put("pname", request.getParameter("pname"));
//		map.put("starttime", request.getParameter("starttime"));
//		map.put("endtime", request.getParameter("endtime"));
//		map.put("day", request.getParameter("day"));
//		map.put("price", request.getParameter("price"));
//		map.put("limit", request.getParameter("limit"));
//		
//		session.insert("program.insert",map);
//		mv.setViewName("redirect:/insert");
//		return mv;
//	}

	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ModelAndView InsertProgramResult(String pname, String starttime, String endtime, String day, String price, String limit){
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("pname", pname);
		map.put("starttime", starttime);
		map.put("endtime", endtime);
		map.put("day", day);
		map.put("price", price);
		map.put("limit", limit);
		
		session.insert("program.insert",map);
		mv.setViewName("redirect:/insert");
		return mv;
	}
	
	
//////2. 삭제
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String DeleteProgram(){
		return "program/delete";
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String DeleteProgramResult(int number){
		session.delete("program.delete",number);
		return "redirect:/insert";
	}
	
///////3. 수정
	@RequestMapping(value="update",method=RequestMethod.GET)
	public String UpdateProgram(){
		return "program/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public ModelAndView UpdateProgramResult(String day1, String time1, String time2){
		
		ModelAndView mv = new ModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("day1", day1);
		map.put("time1", time1);
		map.put("time2", time2);
		
		session.update("program.update",map);
		mv.setViewName("redirect:/insert");
		return mv;
	}
	
//////4. 예약현황 조회 기능
}
