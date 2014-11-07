/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.mapper;

import com.rplo.bioskop.model.Pegawai;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author basisb07la
 */
public class PegawaiRowMapper implements RowMapper<Pegawai> {

    @Override
    public Pegawai mapRow(ResultSet rs, int i) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
