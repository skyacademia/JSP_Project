package com.fpp.dao;

import java.sql.Connection;

public class PagingDAO {
	private int page; // 현재 페이지 번호
	private int countList = 12; // 한 페이지에 출력될 게시물 수
	private int countPage = 10; // 한 화면에 출력될 페이지 수
	private int totalCount; // 포스터 DB에 저장되는 갯수
	private int totalPage; // 총 페이지 수

	private int startPage; // 시작페이지
	private int endPage; // 끝페이지

	public PagingDAO(int totalCount, int page) {
		this.page = page;
		this.totalCount = totalCount;
		totalPage = totalCount / countList;
		if (totalCount % countList > 0) {
			totalPage++;
		}
		if (totalPage < page) {
			this.page = totalPage;
		}
		// 어느 페이지에 들어갔을 때 출력되야하는 페이지
		startPage = ((this.page - 1) / 10) * 10 + 1;
		endPage = startPage + countPage - 1;
		// 접속한 페이지가 마지막 페이지일 경우
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
	public int[] getPages(){
		int[] startEndPoint = new int[2];
		startEndPoint[0] = startPage;
		startEndPoint[1] = endPage;
		return startEndPoint;
	}
	public int getCountList() {
		return countList;
	}

}
