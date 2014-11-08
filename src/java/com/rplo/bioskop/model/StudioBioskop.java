/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
 * @author root
 */
public class StudioBioskop {
    
    private String mKodeStudio;  
    private String mNamaStudio;  

    public StudioBioskop() {
    }

    public String getmKodeStudio() {
        return mKodeStudio;
    }

    public void setmKodeStudio(String mKodeStudio) {
        this.mKodeStudio = mKodeStudio;
    }

    public String getmNamaStudio() {
        return mNamaStudio;
    }

    public void setmNamaStudio(String mNamaStudio) {
        this.mNamaStudio = mNamaStudio;
    }
    
    public static void simpanData(StudioBioskop pStudioBioskop) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO studio_bioskop VALUES(?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pStudioBioskop.getmKodeStudio(),
                    pStudioBioskop.getmNamaStudio()
                });
    }
    
    public static List<StudioBioskop> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List pegawaiList = new ArrayList();

        String sql = "SELECT * FROM studio_bioskop";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new PegawaiRowMapper());
        return pegawaiList;
    }
    
}
