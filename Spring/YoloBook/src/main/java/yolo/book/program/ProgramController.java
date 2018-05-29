package yolo.book.program;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProgramController {
	@Autowired 
	SqlSession session;

	//main으로 가는 화면
	
	
	//신규프로그램 입력
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String InsertProgram(){
		return "insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String InsertProgram(ProgramVO vo){
		//사진추가할 예정
		
		return null;
	}
	///삭제
	
	
	//수정 기능
	
	//예약현황 조회 기능
}
