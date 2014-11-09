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
