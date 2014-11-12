/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Agustinus Agri
 */
public class DataPegawai {

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

        OPERATOR, ADMIN;
    }

    public DataPegawai() {
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

    public static void simpanData(DataPegawai pPegawai) {
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

    public static List<DataPegawai> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPegawai> pegawaiList = new ArrayList<DataPegawai>();

        String sql = "SELECT * FROM pegawai";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());
        return pegawaiList;
    }

    /**
     * Memvalidasi login user, akan mengembalikan nilai int sesuai dengan hasil
     * validasi
     *
     * @param pUsername username yang diinputkan user
     * @param pPassword password yang diinputkan user
     * @return 0 - unregistered username; 1 - wrong username/password; 2 - login
     * as PEGAWAI accepted; 3 - login as ADMIN accepted;
     */
    public static int validateLoginCredential(String pUsername, String pPassword) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPegawai> pegawaiList = new ArrayList<DataPegawai>();

        String sql = "SELECT * FROM pegawai WHERE username_pegawai = \'" + pUsername.toUpperCase() + "\'";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());

        if (pegawaiList.get(0) != null) {
            String username = pegawaiList.get(0).getmUsernamePegawai();
            String password = pegawaiList.get(0).getmPaswordPegawai();
            String role = pegawaiList.get(0).getmRolePegawai();
            if (pUsername.equalsIgnoreCase(username) && pPassword.equals(password)) {
                System.out.println("ROLE : " + role);
                if (role.equals(ROLE.OPERATOR.toString())) {
                    return 2;
                } else {
                    return 3;
                }
            } else {
                System.out.println("WRONG USERNAME/PASSWORD");
                return 1;
            }
        } else {
            System.out.println("UNREGISTERED USERNAME");
            return 0;
        }
    }

    public static void updateData(DataPegawai pPegawai) {
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

    public static class PegawaiRowMapper implements RowMapper<DataPegawai> {

        @Override
        public DataPegawai mapRow(ResultSet rs, int i) throws SQLException {
            PegawaiExtractor pegawaiExtractor = new PegawaiExtractor();
            return pegawaiExtractor.extractData(rs);
        }

    }

    public static class PegawaiExtractor implements ResultSetExtractor<DataPegawai> {

        @Override
        public DataPegawai extractData(ResultSet rs) throws SQLException, DataAccessException {
            DataPegawai pegawai = new DataPegawai();

            pegawai.setmKodePegawai(rs.getString(1));
            pegawai.setmUsernamePegawai(rs.getString(2));
            pegawai.setmPaswordPegawai(rs.getString(3));
            pegawai.setmNamaPegawai(rs.getString(4));
            pegawai.setmTempatTanggalLahir(rs.getString(5));
            pegawai.setmAlamatPegawai(rs.getString(6));
            pegawai.setmEmailPegawai(rs.getString(7));
            pegawai.setmNomorTelepon(rs.getString(8));
            pegawai.setmRolePegawai(rs.getString(9));

            return pegawai;
        }

    }

}
