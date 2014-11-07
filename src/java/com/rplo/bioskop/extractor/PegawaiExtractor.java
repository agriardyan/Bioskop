/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplo.bioskop.extractor;

import com.rplo.bioskop.model.Pegawai;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author basisb07la
 */
public class PegawaiExtractor implements ResultSetExtractor<Pegawai> {

    @Override
    public Pegawai extractData(ResultSet rs) throws SQLException, DataAccessException {
        Pegawai pegawai = new Pegawai();
        
        pegawai.setmKodePegawai(rs.getString(1));
        pegawai.setmUserName(rs.getString(2));
        pegawai.setmNamaPegawai(rs.getString(3));
        pegawai.setmTempatTanggalLahir(rs.getString(4));
        pegawai.setmAlamatPegawai(rs.getString(5));
        pegawai.setmEmailPegawai(rs.getString(6));
        pegawai.setmNomorTelepon(rs.getString(7));
        
        return pegawai;
    }
    
}
