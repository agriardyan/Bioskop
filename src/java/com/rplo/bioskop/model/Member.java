/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.model;

/**
 *
 * @author Agustinus Agri
 */
public class Member {
    
    private String mKodeMember;
    private String mNamaMember;  
    private String mTempatTanggalLahir;  
    private String mEmail;
    private String mNomorTelepon;
    private int mSaldo;  
    private String mNomorKartuKredit;

    public Member() {
    }

    public String getmEmail() {
        return mEmail;
    }

    public void setmEmail(String mEmail) {
        this.mEmail = mEmail;
    }

    public String getmKodeMember() {
        return mKodeMember;
    }

    public void setmKodeMember(String mKodeMember) {
        this.mKodeMember = mKodeMember;
    }

    public String getmNamaMember() {
        return mNamaMember;
    }

    public void setmNamaMember(String mNamaMember) {
        this.mNamaMember = mNamaMember;
    }

    public String getmNomorKartuKredit() {
        return mNomorKartuKredit;
    }

    public void setmNomorKartuKredit(String mNomorKartuKredit) {
        this.mNomorKartuKredit = mNomorKartuKredit;
    }

    public String getmNomorTelepon() {
        return mNomorTelepon;
    }

    public void setmNomorTelepon(String mNomorTelepon) {
        this.mNomorTelepon = mNomorTelepon;
    }

    public int getmSaldo() {
        return mSaldo;
    }

    public void setmSaldo(int mSaldo) {
        this.mSaldo = mSaldo;
    }

    public String getmTempatTanggalLahir() {
        return mTempatTanggalLahir;
    }

    public void setmTempatTanggalLahir(String mTempatTanggalLahir) {
        this.mTempatTanggalLahir = mTempatTanggalLahir;
    }
    
    
    
}
