package com.ssafy.happyhouse.dto;

public class BoardDto {
	private int bno; // 글번호
	private String btitle; // 제목
	private String bwriter; // 작성자
	private int breadCnt; // 조회수
	private String bwriteDate; // 작성일시
	private String bcontent;// 글 내용
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public int getBreadCnt() {
		return breadCnt;
	}

	public void setBreadCnt(int breadCnt) {
		this.breadCnt = breadCnt;
	}

	public String getBwriteDate() {
		return bwriteDate;
	}

	public void setBwriteDate(String bwriteDate) {
		this.bwriteDate = bwriteDate;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", bwriter=" + bwriter + ", breadCnt=" + breadCnt
				+ ", bwriteDate=" + bwriteDate + ", bcontent=" + bcontent + "]";
	}
}
