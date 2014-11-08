/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.mapper;

import com.rplo.bioskop.extractor.MemberExtractor;
import com.rplo.bioskop.extractor.PegawaiExtractor;
import com.rplo.bioskop.model.Member;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author root
 */
public class MemberRowModel implements RowMapper<Member> {

    @Override
    public Member mapRow(ResultSet rs, int i) throws SQLException {
        MemberExtractor memberExtractor = new MemberExtractor();
        return memberExtractor.extractData(rs);
    }
    
}
