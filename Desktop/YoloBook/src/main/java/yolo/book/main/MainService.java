package yolo.book.main;

import java.util.List;

import yolo.book.program.ProgramVO;

public interface MainService {
	public List<ProgramVO> getProgram(String date);
	public void insertBook(int[] bookArray);
	public ProgramVO showBookResult(int pnumber);
}