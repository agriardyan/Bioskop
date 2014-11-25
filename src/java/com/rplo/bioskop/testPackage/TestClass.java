/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.testPackage;

import com.rplo.bioskop.model.DataPegawai;
import com.rplo.bioskop.model.DatabaseConnection;
import java.util.List;

/**
 *
 * @author Agustinus Agri
 */
public class TestClass {
    
    public static void main(String[] args) {
        
        DatabaseConnection databaseConnection = new DatabaseConnection();
        
        int validateLoginCredential = DataPegawai.validateLoginCredential("p009", "P009", "ADMIN");
        
        System.out.println("LOGIN STATUS : "+validateLoginCredential);
        
        List<DataPegawai> dataList = DataPegawai.getDataList();
        
        for (int i = 0; i < dataList.size(); i++) {
            System.out.println(dataList.get(i).getmNamaPegawai()+" ");
        }
    }
    
}
