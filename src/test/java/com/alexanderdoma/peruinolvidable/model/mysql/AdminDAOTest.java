package com.alexanderdoma.peruinolvidable.model.mysql;

import org.junit.Ignore;
import org.junit.Test;

public class AdminDAOTest {
    
    public AdminDAOTest() {
    }
    
    @Test
    @Ignore
    public void testLogin() throws Exception {
        System.out.println("login");
        String username = "test_username";
        String password = "test_password";
        AdminDAO instance = new AdminDAO();
        System.out.println(instance.login(username, password).toString());
    }
}
