/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package dao.impl;

import model.User;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Admin
 */
public class LoginDaoTest {
    
    public LoginDaoTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
        System.out.println("Testing is running...");
    }
    
    @AfterAll
    public static void tearDownClass() {
        System.out.println("Testing finised...");
    }

    /**
     * Test of checkLogin method, of class LoginDao.
     */
    @Test
    public void testCheckLogin() {
        System.out.println("checkLogin");
        String username = "dung";
        String password = "1";
        LoginDao instance = new LoginDao();
        User expResult = null;
        User result = instance.checkLogin(username, password);
        assertEquals(expResult, result);
    }
    
}
