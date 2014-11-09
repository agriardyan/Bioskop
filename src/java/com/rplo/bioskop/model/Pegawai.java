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
    private String mUsernamePegawai;
    private String mPaswordPegawai;
    private String mNamaPegawai;
    private String mTempatTanggalLahir;
    private String mAlamatPegawai;
    private String mEmailPegawai;
    private String mNomorTelepon;
    private String mRolePegawai;

    /**
     * 1 : PEGAWAI 2 : ADMIN
     */
    public enum ROLE {

        PEGAWAI, ADMIN;
    }

    public Pegawai() {
    }

    public String getmKodePegawai() {
        return mKodePegawai;
    }

    public void setmKodePegawai(String mKodePegawai) {
        this.mKodePegawai = mKodePegawai;
    }

    public String getmUsernamePegawai() {
        return mUsernamePegawai;
    }

    public void setmUsernamePegawai(String mUsernamePegawai) {
        this.mUsernamePegawai = mUsernamePegawai;
    }

    public String getmPaswordPegawai() {
        return mPaswordPegawai;
    }

    public void setmPaswordPegawai(String mPaswordPegawai) {
        this.mPaswordPegawai = mPaswordPegawai;
    }

    public String getmNamaPegawai() {
        return mNamaPegawai;
    }

    public void setmNamaPegawai(String mNamaPegawai) {
        this.mNamaPegawai = mNamaPegawai;
    }

    public String getmTempatTanggalLahir() {
        return mTempatTanggalLahir;
    }

    public void setmTempatTanggalLahir(String mTempatTanggalLahir) {
        this.mTempatTanggalLahir = mTempatTanggalLahir;
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

    public String getmNomorTelepon() {
        return mNomorTelepon;
    }

    public void setmNomorTelepon(String mNomorTelepon) {
        this.mNomorTelepon = mNomorTelepon;
    }

    public String getmRolePegawai() {
        return mRolePegawai;
    }

    public void setmRolePegawai(String mRolePegawai) {
        this.mRolePegawai = mRolePegawai;
    }

    public static void simpanData(Pegawai pPegawai) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO pegawai VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pPegawai.getmKodePegawai(),
                    pPegawai.getmUsernamePegawai(),
                    pPegawai.getmPaswordPegawai(),
                    pPegawai.getmNamaPegawai(),
                    pPegawai.getmTempatTanggalLahir(),
                    pPegawai.getmAlamatPegawai(),
                    pPegawai.getmEmailPegawai(),
                    pPegawai.getmNomorTelepon(),
                    pPegawai.getmRolePegawai()
                });
    }

    public static List<Pegawai> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<Pegawai> pegawaiList = new ArrayList<Pegawai>();

        String sql = "SELECT * FROM pegawai";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());
        return pegawaiList;
    }

    public static boolean validateLoginCredential(String pUsername, String pPassword) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<Pegawai> pegawaiList = new ArrayList<Pegawai>();

        String sql = "SELECT * FROM pegawai WHERE username_pegawai = \'" + pUsername.toUpperCase() + "\'";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());

        if (pegawaiList.get(0) != null) {
            String username = pegawaiList.get(0).getmUsernamePegawai();
            String password = pegawaiList.get(0).getmPaswordPegawai();
            String role = pegawaiList.get(0).getmRolePegawai();
            if (pUsername.equalsIgnoreCase(username) && pPassword.equals(password)) {
                System.out.println("ROLE : " + role);
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

    public static void updateData(Pegawai pPegawai) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "UPDATE pegawai SET "
                + "username_pegawai = ?, "
                + "password_pegawai = ?, "
                + "nama_pegawai = ?, "
                + "ttl_pegawai = ?, "
                + "alamat_pegawai = ?, "
                + "email_pegawai = ?, "
                + "no_telp_pegawai = ?, "
                + "role_pegawai = ? "
                + "WHERE kode_pegawai = ?";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        jdbcTemplate.update(sql,
                new Object[]{
                    pPegawai.getmUsernamePegawai(),
                    pPegawai.getmPaswordPegawai(),
                    pPegawai.getmNamaPegawai(),
                    pPegawai.getmTempatTanggalLahir(),
                    pPegawai.getmAlamatPegawai(),
                    pPegawai.getmEmailPegawai(),
                    pPegawai.getmNomorTelepon(),
                    pPegawai.getmKodePegawai(),
                    pPegawai.getmRolePegawai()
                });
    }

    public static void deleteData(String pKodePegawai) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "DELETE FROM pegawai WHERE kode_pegawai = \'" + pKodePegawai + "\'";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }

}
