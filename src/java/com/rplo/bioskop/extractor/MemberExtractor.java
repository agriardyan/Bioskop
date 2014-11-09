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
        member.setmUsernameMember(rs.getString(2));
        member.setmPasswordMember(rs.getString(3));
        member.setmNamaMember(rs.getString(4));
        member.setmTempatTanggalLahir(rs.getString(5));
        member.setmAlamatMember(rs.getString(6));
        member.setmEmail(rs.getString(7));
        member.setmNomorTelepon(rs.getString(8));
        member.setmSaldo(rs.getInt(9));
        member.setmNomorKartuKredit(rs.getString(10));
        
        return member;
    }
    
}
