package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.model.entity.User;
import java.util.List;
import org.junit.Ignore;
import org.junit.Test;

public class UserDAOTest {
    
    public UserDAOTest() {
    }
    
    @Test
    @Ignore
    public void testGetAll() throws Exception {
        System.out.println("getAll");
        UserDAO instance = new UserDAO();
        List<User> result = instance.getAll();
        for (User object : result){
            System.out.println(object.toString());
        }  
    }

    @Test
    @Ignore
    public void testAdd() throws Exception {
        System.out.println("add");
        User o = new User();
        o.setName("test_name");
        o.setLastname("test_lastname");
        o.setUsername("test_username");
        o.setPassword("test_password");
        o.setEmail("test_email");
        UserDAO instance = new UserDAO();
        instance.add(o);
    }

    @Test
    @Ignore
    public void testUpdate() throws Exception {
        System.out.println("update");
        User o = new User();
        o.setName("test_name_modded");
        o.setLastname("test_lastname_modded");
        o.setUsername("test_username_modded");
        o.setPassword("test_password_modded");
        o.setEmail("test_email_modded");
        o.setId(2); // Pick up a id
        UserDAO instance = new UserDAO();
        instance.update(o);
    }

    @Test
    @Ignore
    public void testDelete() throws Exception {
        System.out.println("delete");
        int id = 2; // Pick up a id
        UserDAO instance = new UserDAO();
        instance.delete(id);
    }

    @Test
    @Ignore
    public void testGetById() throws Exception {
        System.out.println("getById");
        int id = 1;
        UserDAO instance = new UserDAO();
        System.out.println(instance.getById(id).toString());
    }

    @Test
    @Ignore
    public void testLogin() throws Exception {
        System.out.println("login");
        String username = "alexanderdoma";
        String password = "admin123";
        UserDAO instance = new UserDAO();
        System.out.println(instance.login(username, password).toString());
    }
}
