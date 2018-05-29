package yolo.book.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@RequestMapping("/calendar")
	public String getCalendar() {
		return "main/calendar";
	}
	
	@RequestMapping("/getdate")
	@ResponseBody
	public String getDate(String month, String day) {
		//ModelAndView mv=new ModelAndView();
		System.out.println("드루와");
		String date=month+day;
		System.out.println("테스트:"+date);
		
		return date;
		
		
	}

}
