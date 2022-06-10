package com;

/**
 * @author 인공지능프로그래밍실습실
 *
 */
public class Member {
	String mID;
	String mPW;
	String mName;
	String mTel;
	String mMail;
	String mAddress;
	String mText; //자기소개 글
	String mSkill;
	
	public String getmID() {return mID;}
	public String getmPW() {return mPW;}
	public String getmName() {return mName;}
	public String getmTel() {return mTel;}
	public String getmMail() {return mMail;}
	public String getmAddress() {return mAddress;}
	public String getmText() {return mText;}
	public String getmSkill() {return mSkill;}
	
	public void setmPW(String mPW) {this.mPW = mPW;}
	public void setmID(String mID) {this.mID = mID;}
	public void setmName(String mName) {this.mName = mName;}
	public void setmTel(String mTel) {this.mTel = mTel;}
	public void setmMail(String mMail) {this.mMail = mMail;}
	public void setmAddress(String mAddress) {this.mAddress = mAddress;}
	public void setmText(String mText) {this.mText = mText;}
	public void setmSkill(String mSkill) {this.mSkill = mSkill;}
	
	public Member(String id,String pw, String name, String tel, String add, String text, String skill) {
		super();
	}
	public Member() {
		
	}
	
}
