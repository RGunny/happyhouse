package com.ssafy.happyhouse.dto;

public class QnADto {
	private int bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bwriteDate;
	private int breadCnt;
	
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
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriteDate() {
		return bwriteDate;
	}
	public void setBwriteDate(String bwriteDate) {
		this.bwriteDate = bwriteDate;
	}
	public int getBreadCnt() {
		return breadCnt;
	}
	public void setBreadCnt(int breadCnt) {
		this.breadCnt = breadCnt;
	}
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontent=" + bcontent
				+ ", bwriteDate=" + bwriteDate + ", breadCnt=" + breadCnt + "]";
	}
	
	

}
