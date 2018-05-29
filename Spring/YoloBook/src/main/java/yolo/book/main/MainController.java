package yolo.book.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yolo.book.program.ProgramVO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	
	@RequestMapping("/calendar")
	public String getCalendar() {
		return "main/calendar";
	}
	
	@RequestMapping("/getdate")
	@ResponseBody
	public List<ProgramVO> getDate(String day, String month, String year) {
		//ModelAndView mv=new ModelAndView();
		System.out.println("드루와");
		
		
		String date=year+ month + day;
		List<ProgramVO> list = service.getProgram(date);

		return list;
		
		
	}

}
