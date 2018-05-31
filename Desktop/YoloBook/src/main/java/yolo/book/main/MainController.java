package yolo.book.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import yolo.book.program.ProgramVO;

@Controller
@SessionAttributes({"month", "year", "action"})
public class MainController {
	@Autowired
	MainService service;
	
	@RequestMapping("/mainPage")
	public String getMainPage(String month, String year, String action, Model model) {
		System.out.println("mainpage"+month);
		
		if(month!=null && year!=null && action!=null) {
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("action", action);
		}
	
		
		return "main/mainPage";
	}
	
	
	@RequestMapping("/calendar")
	public String getCalendar(String month, String year, String action) {
		return "main/calendar";
	}
	
	@RequestMapping("/getProgram")
	@ResponseBody
	public List<ProgramVO> getProgram(String day, String month, String year) {
		
		if(Integer.parseInt(month)>0 && Integer.parseInt(month)<10) {
			month="0"+month;
		}
		
		String date=year+month+day;
		
		System.out.println("테스트:"+date);
		
		List<ProgramVO> list = service.getProgram(date);
		
		System.out.println("리스트"+list);

		return list;	
	}
	
	@RequestMapping(value = "/book", method=RequestMethod.GET )
	public ModelAndView insertBook(int mnumber, int pnumber) {
		
		ModelAndView mv = new ModelAndView();
		List<ProgramVO> list = new ArrayList<ProgramVO>(); // view에 넘길 list
		int[] bookArray={mnumber, pnumber};
		service.insertBook(bookArray);

		ProgramVO vo = service.showBookResult(pnumber);  //pnumber에 맞는 프로그램 정보 리스트 출력
		
		mv.addObject("programvo",vo);
		mv.setViewName("/main/book");
		

		return mv;
	}
	
	@RequestMapping(value = "/calendar", method=RequestMethod.POST)
	public String returnBook() {
		
		 return "redirect:/calendar";
		
	}

}