/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.extractor;

import com.rplo.bioskop.model.Pegawai;
import com.rplo.bioskop.model.StudioBioskop;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author root
 */
public class StudioBioskopExtractor implements ResultSetExtractor<StudioBioskop> {
    
    @Override
    public StudioBioskop extractData(ResultSet rs) throws SQLException, DataAccessException {
        StudioBioskop studioBioskop = new StudioBioskop();
        
        studioBioskop.setmKodeStudio(rs.getString(1));
        studioBioskop.setmNamaStudio(rs.getString(2));
        
        return studioBioskop;
    }
    
}
