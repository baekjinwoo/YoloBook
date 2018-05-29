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
	
	@RequestMapping("/getProgram")
	@ResponseBody
	public List<ProgramVO> getProgram(String day, String month, String year) {
		String m="0"+month;
		System.out.println(m);
	
		String date=year+ m + day;
		System.out.println(date);
		
		List<ProgramVO> list = service.getProgram(date);
		
		System.out.println("리스트"+list);

		return list;
		
		
	}

}
