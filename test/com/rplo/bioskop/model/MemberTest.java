/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplo.bioskop.model;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Agustinus Agri
 */
public class MemberTest {
    
    
    public MemberTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        DatabaseConnection db = new DatabaseConnection();
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getmEmail method, of class Member.
     */
    @Test
    public void testGetmEmail() {
        System.out.println("getmEmail");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmEmail();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmEmail method, of class Member.
     */
    @Test
    public void testSetmEmail() {
        System.out.println("setmEmail");
        String mEmail = "";
        Member instance = new Member();
        instance.setmEmail(mEmail);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmKodeMember method, of class Member.
     */
    @Test
    public void testGetmKodeMember() {
        System.out.println("getmKodeMember");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmKodeMember();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmAlamatMember method, of class Member.
     */
    @Test
    public void testGetmAlamatMember() {
        System.out.println("getmAlamatMember");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmAlamatMember();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmAlamatMember method, of class Member.
     */
    @Test
    public void testSetmAlamatMember() {
        System.out.println("setmAlamatMember");
        String mAlamatMember = "";
        Member instance = new Member();
        instance.setmAlamatMember(mAlamatMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmKodeMember method, of class Member.
     */
    @Test
    public void testSetmKodeMember() {
        System.out.println("setmKodeMember");
        String mKodeMember = "";
        Member instance = new Member();
        instance.setmKodeMember(mKodeMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmNamaMember method, of class Member.
     */
    @Test
    public void testGetmNamaMember() {
        System.out.println("getmNamaMember");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmNamaMember();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmNamaMember method, of class Member.
     */
    @Test
    public void testSetmNamaMember() {
        System.out.println("setmNamaMember");
        String mNamaMember = "";
        Member instance = new Member();
        instance.setmNamaMember(mNamaMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmNomorKartuKredit method, of class Member.
     */
    @Test
    public void testGetmNomorKartuKredit() {
        System.out.println("getmNomorKartuKredit");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmNomorKartuKredit();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmNomorKartuKredit method, of class Member.
     */
    @Test
    public void testSetmNomorKartuKredit() {
        System.out.println("setmNomorKartuKredit");
        String mNomorKartuKredit = "";
        Member instance = new Member();
        instance.setmNomorKartuKredit(mNomorKartuKredit);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmNomorTelepon method, of class Member.
     */
    @Test
    public void testGetmNomorTelepon() {
        System.out.println("getmNomorTelepon");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmNomorTelepon();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmNomorTelepon method, of class Member.
     */
    @Test
    public void testSetmNomorTelepon() {
        System.out.println("setmNomorTelepon");
        String mNomorTelepon = "";
        Member instance = new Member();
        instance.setmNomorTelepon(mNomorTelepon);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmSaldo method, of class Member.
     */
    @Test
    public void testGetmSaldo() {
        System.out.println("getmSaldo");
        Member instance = new Member();
        int expResult = 0;
        int result = instance.getmSaldo();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmSaldo method, of class Member.
     */
    @Test
    public void testSetmSaldo() {
        System.out.println("setmSaldo");
        int mSaldo = 0;
        Member instance = new Member();
        instance.setmSaldo(mSaldo);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmTempatTanggalLahir method, of class Member.
     */
    @Test
    public void testGetmTempatTanggalLahir() {
        System.out.println("getmTempatTanggalLahir");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmTempatTanggalLahir();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmTempatTanggalLahir method, of class Member.
     */
    @Test
    public void testSetmTempatTanggalLahir() {
        System.out.println("setmTempatTanggalLahir");
        String mTempatTanggalLahir = "";
        Member instance = new Member();
        instance.setmTempatTanggalLahir(mTempatTanggalLahir);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmUsernameMember method, of class Member.
     */
    @Test
    public void testGetmUsernameMember() {
        System.out.println("getmUsernameMember");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmUsernameMember();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmUsernameMember method, of class Member.
     */
    @Test
    public void testSetmUsernameMember() {
        System.out.println("setmUsernameMember");
        String mUsernameMember = "";
        Member instance = new Member();
        instance.setmUsernameMember(mUsernameMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getmPasswordMember method, of class Member.
     */
    @Test
    public void testGetmPasswordMember() {
        System.out.println("getmPasswordMember");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getmPasswordMember();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setmPasswordMember method, of class Member.
     */
    @Test
    public void testSetmPasswordMember() {
        System.out.println("setmPasswordMember");
        String mPasswordMember = "";
        Member instance = new Member();
        instance.setmPasswordMember(mPasswordMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of validateLoginCredential method, of class Member.
     */
    @Test
    public void testValidateLoginCredential() {
        System.out.println("validateLoginCredential");
        String pUsername = "JJOHN";
        String pPassword = "JJOHN";
        int expResult = 2;
        int result = Member.validateLoginCredential(pUsername, pPassword);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }

    /**
     * Test of simpanData method, of class Member.
     */
    @Test
    public void testSimpanData() {
        System.out.println("simpanData");
        Member pMember = null;
        Member.simpanData(pMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDataList method, of class Member.
     */
    @Test
    public void testGetDataList() {
        System.out.println("getDataList");
        List<Member> expResult = null;
        List<Member> result = Member.getDataList();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateData method, of class Member.
     */
    @Test
    public void testUpdateData() {
        System.out.println("updateData");
        Member pMember = null;
        Member.updateData(pMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteData method, of class Member.
     */
    @Test
    public void testDeleteData() {
        System.out.println("deleteData");
        String pKodeMember = "";
        Member.deleteData(pKodeMember);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
