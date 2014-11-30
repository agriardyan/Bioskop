/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
public class Film {
    
    private String mKodeFilm;
    private String mJudulFilm;
    private double mDurasi;
    private String mGenre;  

    public Film() {
    }

    public String getmKodeFilm() {
        return mKodeFilm;
    }

    public void setmKodeFilm(String mKodeFilm) {
        this.mKodeFilm = mKodeFilm;
    }

    public String getmJudulFilm() {
        return mJudulFilm;
    }

    public void setmJudulFilm(String mJudulFilm) {
        this.mJudulFilm = mJudulFilm;
    }

    public double getmDurasi() {
        return mDurasi;
    }

    public void setmDurasi(double mDurasi) {
        this.mDurasi = mDurasi;
    }

    public String getmGenre() {
        return mGenre;
    }

    public void setmGenre(String mGenre) {
        this.mGenre = mGenre;
    }
    
    public static void simpanData(Film pFilm)
    {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO film_bioskop VALUES(?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pFilm.getmKodeFilm(),
                    pFilm.getmJudulFilm(),
                    pFilm.getmDurasi(),
                    pFilm.getmGenre()
                });
    }
    
    public static List<Film> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<Film> filmList = new ArrayList<Film>();

        String sql = "SELECT * FROM film_bioskop";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        filmList = jdbcTemplate.query(sql, new FilmRowMapper());
        return filmList;
    }
    
    public static List<Film> getDataListbyKode(String kode) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<Film> filmList = new ArrayList<Film>();

        String sql = "SELECT * FROM film_bioskop WHERE kode_film = '"+ kode +"'";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        filmList = jdbcTemplate.query(sql, new FilmRowMapper());
        return filmList;
    }
    
    public static class FilmRowMapper implements RowMapper<Film> {

        @Override
        public Film mapRow(ResultSet rs, int i) throws SQLException {
            FilmExtractor filmExtractor = new FilmExtractor();
            return filmExtractor.extractData(rs);
        }
        
    }

    public static class FilmExtractor implements ResultSetExtractor<Film> {

        @Override
        public Film extractData(ResultSet rs) throws SQLException, DataAccessException {
            Film film = new Film();
            
            film.setmKodeFilm(rs.getString(1));
            film.setmJudulFilm(rs.getString(2));
            film.setmDurasi(rs.getDouble(3));
            film.setmGenre(rs.getString(4));
            
            return film;
        }
        
    }
    
}
