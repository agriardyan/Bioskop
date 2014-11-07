/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.extractor;

import com.rplo.bioskop.model.Member;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author root
 */
public class MemberExtractor implements ResultSetExtractor<Member> {

    @Override
    public Member extractData(ResultSet rs) throws SQLException, DataAccessException {
        Member member = new Member();
        
        member.setmKodeMember(rs.getString(1));
        member.setmNamaMember(rs.getString(2));
        member.setmTempatTanggalLahir(rs.getString(3));
        member.setmEmail(rs.getString(4));
        member.setmNomorTelepon(rs.getString(5));
        member.setmSaldo(rs.getInt(6));
        member.setmNomorKartuKredit(rs.getString(7));
        
        return member;
    }
    
}
