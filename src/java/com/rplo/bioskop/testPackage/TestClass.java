/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.testPackage;

import com.rplo.bioskop.model.DatabaseConnection;
import com.rplo.bioskop.model.Member;
import com.rplo.bioskop.model.Pegawai;
import java.util.List;

/**
 *
 * @author root
 */
public class TestClass {
    
    public static void main(String[] args) {
        DatabaseConnection databaseConnection = new DatabaseConnection();
        boolean validateLoginCredential = Pegawai.validateLoginCredential("p003", "P003");
        
        System.out.println("LOGIN STATUS : "+validateLoginCredential);
        
        List<Pegawai> dataList = Pegawai.getDataList();
        
        for (int i = 0; i < dataList.size(); i++) {
            System.out.println(dataList.get(i).getmNamaPegawai()+" ");
        }
    }
    
}
