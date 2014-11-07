/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.model;

import com.rplo.bioskop.mapper.PegawaiRowMapper;
import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;

/**
 *
 * @author Agustinus Agri
 */
public class Pegawai {

    private String mKodePegawai;
    private String mUserName;
    private String mNamaPegawai;
    private String mTempatTanggalLahir;
    private String mAlamatPegawai;
    private String mEmailPegawai;
    private String mNomorTelepon;

    /**
     * 0 : REGULAR CUSTOMER & GUEST 1 : MEMBER 2 : PEGAWAI 3 : ADMIN
     */
    public enum ROLE {

        GUEST, MEMBER, PEGAWAI, ADMIN;
    }

    public Pegawai() {
    }

    public String getmAlamatPegawai() {
        return mAlamatPegawai;
    }

    public void setmAlamatPegawai(String mAlamatPegawai) {
        this.mAlamatPegawai = mAlamatPegawai;
    }

    public String getmEmailPegawai() {
        return mEmailPegawai;
    }

    public void setmEmailPegawai(String mEmailPegawai) {
        this.mEmailPegawai = mEmailPegawai;
    }

    public String getmKodePegawai() {
        return mKodePegawai;
    }

    public void setmKodePegawai(String mKodePegawai) {
        this.mKodePegawai = mKodePegawai;
    }

    public String getmNamaPegawai() {
        return mNamaPegawai;
    }

    public void setmNamaPegawai(String mNamaPegawai) {
        this.mNamaPegawai = mNamaPegawai;
    }

    public String getmNomorTelepon() {
        return mNomorTelepon;
    }

    public void setmNomorTelepon(String mNomorTelepon) {
        this.mNomorTelepon = mNomorTelepon;
    }

    public String getmTempatTanggalLahir() {
        return mTempatTanggalLahir;
    }

    public void setmTempatTanggalLahir(String mTempatTanggalLahir) {
        this.mTempatTanggalLahir = mTempatTanggalLahir;
    }

    public String getmUserName() {
        return mUserName;
    }

    public void setmUserName(String mUserName) {
        this.mUserName = mUserName;
    }

    public void simpanData(Pegawai pPegawai) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO pegawai VALUES(?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    this.getmKodePegawai(),
                    this.getmUserName(),
                    this.getmNamaPegawai(),
                    this.getmTempatTanggalLahir(),
                    this.getmAlamatPegawai(),
                    this.getmEmailPegawai(),
                    this.getmNomorTelepon()
                });
    }

    public List<Pegawai> getPegawaiList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List pegawaiList = new ArrayList();

        String sql = "SELECT * FROM pegawai";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());
        return pegawaiList;
    }

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

    public void deleteData(String pKodePegawai) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        
        String sql = "DELETE FROM pegawai WHERE kode_pegawai=" + pKodePegawai;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }
    
}