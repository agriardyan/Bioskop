/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.model;

import com.rplo.bioskop.mapper.PegawaiRowMapper;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

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

    public void simpanData(Member pMember) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pMember.getmKodeMember(),
                    pMember.getmNamaMember(),
                    pMember.getmTempatTanggalLahir(),
                    pMember.getmEmail(),
                    pMember.getmNomorTelepon(),
                    pMember.getmSaldo(),
                    pMember.getmNomorKartuKredit()
                });
    }

    public List<Pegawai> getMemberList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List memberList = new ArrayList();

        String sql = "SELECT * FROM member";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        memberList = jdbcTemplate.query(sql, new PegawaiRowMapper());
        return memberList;
    }

    /*
     * BELUM SELESAI     
     public void updateData(Pegawai pPegawai) {
     DataSource dataSource = DatabaseConnection.getmDataSource();

     String sql = "UPDATE pegawai SET "
     + "username_pegawai = ?"
     + "nama_pegawai = ?, "
     + "ttl_pegawai = ?, "
     + "alamat_pegawai = ?, "
     + "city = ?, "
     + "email_pegawai = ?, "
     + "no_telp_pegawai = ? "
     + "WHERE kode_pegawai = ?";
     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

     jdbcTemplate.update(sql,
     new Object[]{
     pPegawai.getmUserName(),
     pPegawai.getmNamaPegawai(),
     pPegawai.getmTempatTanggalLahir(),
     pPegawai.getmAlamatPegawai(),
     pPegawai.getmEmailPegawai(),
     pPegawai.getmNomorTelepon(),
     pPegawai.getmKodePegawai()
     });
     }
     */
    public void deleteData(String pKodeMember) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "DELETE FROM member WHERE kode_member=" + pKodeMember;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }

}
