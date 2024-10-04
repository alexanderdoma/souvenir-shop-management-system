package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.model.entity.Category;
import java.util.List;
import org.junit.Test;
import org.junit.Ignore;

public class CategoryDAOTest {
    
    public CategoryDAOTest() {
    }

    @Test
    @Ignore
    public void testAdd() throws Exception {
        System.out.println("add");
        Category o = new Category();
        o.setName("test_category");
        CategoryDAO instance = new CategoryDAO();
        instance.add(o);
    }

    @Test
    @Ignore
    public void testUpdate() throws Exception {
        System.out.println("update");
        Category o = new Category();
        o.setName("test_category_modded");
        o.setId(2); //pick up a id
        CategoryDAO instance = new CategoryDAO();
        instance.update(o);
    }

    @Test
    @Ignore
    public void testDelete() throws Exception {
        System.out.println("delete");
        int id = 2; // pick up a id
        CategoryDAO instance = new CategoryDAO();
        instance.delete(id);
    }

    @Test
    @Ignore
    public void testGetAll() throws Exception {
        System.out.println("getAll");
        CategoryDAO instance = new CategoryDAO();
        List<Category> result = instance.getAll();
        for (Category object : result){
            System.out.println(object.toString());
        }   
    }

    @Test
    @Ignore
    public void testGetById() throws Exception {
        System.out.println("getById");
        int id = 1;
        CategoryDAO instance = new CategoryDAO();
        System.out.println(instance.getById(id).toString());
    }
}
