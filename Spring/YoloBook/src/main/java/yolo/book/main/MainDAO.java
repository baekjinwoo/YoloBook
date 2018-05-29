package yolo.book.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.book.program.ProgramVO;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSession session;
	
	public List<ProgramVO> getProgram (String date){
		return session.selectList("ajax.selectAll", date);
	}

}
