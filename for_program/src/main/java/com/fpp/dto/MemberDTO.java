package com.fpp.dto;

public class MemberDTO {
    private static String mID;
    private static String mPW;
    private static String mName;
    private static String mTel;
    private static String mMail;
    private static String mAddress;
    private static String mText;
    private static String mCompany;
    private static String mThum;

    public void setMember(String mID, String mPW, String mName, String mTel, String mMail, String mAddress,
            String mText,
            String mCompany) {
        this.mID = mID;
        this.mPW = mPW;
        this.mName = mName;
        this.mTel = mTel;
        this.mMail = mMail;
        this.mAddress = mAddress;
        this.mText = mText;
        this.mCompany = mCompany;
    }

    public String getmID() {
        return mID;
    }

    public void setmID(String mID) {
        this.mID = mID;
    }

    public String getmPW() {
        return mPW;
    }

    public void setmPW(String mPW) {
        this.mPW = mPW;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmTel() {
        return mTel;
    }

    public void setmTel(String mTel) {
        this.mTel = mTel;
    }

    public String getmMail() {
        return mMail;
    }

    public void setmMail(String mMail) {
        this.mMail = mMail;
    }

    public String getmAddress() {
        return mAddress;
    }

    public void setmAddress(String mAddress) {
        this.mAddress = mAddress;
    }

    public String getmText() {
        return mText;
    }

    public void setmText(String mText) {
        this.mText = mText;
    }

    public static String getmCompany() {
		return mCompany;
	}

	public static void setmCompany(String mCompany) {
		MemberDTO.mCompany = mCompany;
	}

	public static String getmThum() {
		return mThum;
	}

	public static void setmThum(String mThum) {
		MemberDTO.mThum = mThum;
	}

	public String toString(String mID, String mPW, String mName, String mTel, String mMail, String mAddress,
            String mText, String mSkill, String mCompany, String mThum) {

        return this.mID + this.mPW + this.mName + this.mTel + this.mMail + this.mAddress + this.mText +  this.mCompany + this.mThum;
    }
}