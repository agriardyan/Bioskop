/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.mapper;

import com.rplo.bioskop.extractor.PegawaiExtractor;
import com.rplo.bioskop.model.Pegawai;
import com.rplo.bioskop.model.StudioBioskop;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author basisb07la
 */
public class StudioBioskopRowMapper implements RowMapper<StudioBioskop> {

    @Override
    public StudioBioskop mapRow(ResultSet rs, int i) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
