package com.kuang.pojo;

public class BorrowBook {

	public BorrowBook(String studentNum, String bookName) {
		this.studentNum = studentNum;
		this.bookName = bookName;
	}

	private String studentNum;
	private String bookName;

	public String getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
