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
		System.out.println("다오 안");
		return session.selectList("main.getProgram", date);
	}
	

	public void insertBook(int[] bookArray) {
		session.insert("main.insertBook", bookArray);

	}

	public ProgramVO showBookResult(int pnumber) {
		return session.selectOne("main.showBookResult", pnumber);

	}
}