/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.model;

import com.rplo.bioskop.mapper.MemberRowMapper;
import com.rplo.bioskop.mapper.PegawaiRowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author Agustinus Agri
 */
public class Member {

    private String mKodeMember;
    private String mUsernameMember;
    private String mPasswordMember;
    private String mNamaMember;
    private String mTempatTanggalLahir;
    private String mAlamatMember;
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

    public String getmAlamatMember() {
        return mAlamatMember;
    }

    public void setmAlamatMember(String mAlamatMember) {
        this.mAlamatMember = mAlamatMember;
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
    
    public String getmUsernameMember() {
        return mUsernameMember;
    }

    public void setmUsernameMember(String mUsernameMember) {
        this.mUsernameMember = mUsernameMember;
    }

    public String getmPasswordMember() {
        return mPasswordMember;
    }

    public void setmPasswordMember(String mPasswordMember) {
        this.mPasswordMember = mPasswordMember;
    }

    public static void simpanData(Member pMember) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pMember.getmKodeMember(),
                    pMember.getmUsernameMember(),
                    pMember.getmPasswordMember(),
                    pMember.getmNamaMember(),
                    pMember.getmTempatTanggalLahir(),
                    pMember.getmAlamatMember(),
                    pMember.getmEmail(),
                    pMember.getmNomorTelepon(),
                    pMember.getmSaldo(),
                    pMember.getmNomorKartuKredit()
                });
    }

    public static List<Member> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List memberList = new ArrayList();

        String sql = "SELECT * FROM member";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        memberList = jdbcTemplate.query(sql, new MemberRowMapper());
        return memberList;
    }
    
    public static boolean validateLoginCredential(String pUsername, String pPassword) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<Member> memberList = new ArrayList<Member>();

        String sql = "SELECT * FROM member WHERE username_member = \'" + pUsername.toUpperCase() + "\'";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        memberList = jdbcTemplate.query(sql, new MemberRowMapper());

        if (memberList.get(0) != null) {
            String username = memberList.get(0).getmUsernameMember();
            String password = memberList.get(0).getmPasswordMember();
            if (pUsername.equalsIgnoreCase(username) && pPassword.equals(password)) {
                System.out.println("SUKSES LOGIN MEMBER");
                return true;
            } else {
                System.out.println("WRONG USERNAME/PASSWORD");
                return false;
            }
        } else {
            System.out.println("UNREGISTERED USERNAME");
            return false;
        }
    }

    public static void updateData(Member pMember) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "UPDATE member SET "
                + "username_member = ?, "
                + "password_member = ?, "
                + "nama_member = ?, "
                + "ttl_member = ?, "
                + "alamat_member = ?, "
                + "email_member = ?, "
                + "no_telp_member = ?, "
                + "saldo_member = ?, "
                + "no_kartu_kredit = ? "
                + "WHERE kode_member = ?";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        jdbcTemplate.update(sql,
                new Object[]{
                    pMember.getmUsernameMember(),
                    pMember.getmPasswordMember(),
                    pMember.getmNamaMember(),
                    pMember.getmTempatTanggalLahir(),
                    pMember.getmAlamatMember(), 
                    pMember.getmEmail(),
                    pMember.getmNomorTelepon(),
                    pMember.getmSaldo(),
                    pMember.getmNomorKartuKredit(),
                    pMember.getmKodeMember()
                });
    }

    public static void deleteData(String pKodeMember) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "DELETE FROM member WHERE kode_member = " + pKodeMember;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }

}
