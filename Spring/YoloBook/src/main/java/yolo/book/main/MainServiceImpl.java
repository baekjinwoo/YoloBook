package yolo.book.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.book.program.ProgramVO;
@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO dao;

	@Override
	public List<ProgramVO> getProgram(String date) {
		
		return dao.getProgram(date);
	}
	
	
	
	


}
