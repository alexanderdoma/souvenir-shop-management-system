package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.model.entity.Product;
import com.alexanderdoma.peruinolvidable.model.entity.Category;
import java.util.List;
import org.junit.Test;
import org.junit.Ignore;

public class ProductDAOTest {
    
    public ProductDAOTest() {
    }

    @Test
    @Ignore
    public void testAdd() throws Exception {
        System.out.println("add");
        Category c = new Category();
        c.setId(1);
        Product p = new Product();
        p.setName("test_name");
        p.setDescription("test_description");
        p.setPrice(100.00);
        p.setBrand("test_brand");
        p.setStock(100);
        p.setIsActive(true);
        p.setImage("test_image");
        p.setCategory(c);
        ProductDAO instance = new ProductDAO();
        instance.add(p);
    }

    @Test
    @Ignore
    public void testUpdate() throws Exception {
        System.out.println("update");
        Category c = new Category();
        c.setId(1); //pick up a  id
        Product p = new Product();
        p.setId(2); //pick up a id
        p.setName("test_name_modded");
        p.setDescription("test_description_modded");
        p.setPrice(100.00);
        p.setBrand("test_brand_modded");
        p.setStock(100);
        p.setIsActive(true);
        p.setImage("test_image_modded");
        p.setCategory(c);
        ProductDAO instance = new ProductDAO();
        instance.update(p);
    }

    @Test
    @Ignore
    public void testDelete() throws Exception {
        System.out.println("delete");
        int id = 2;
        ProductDAO instance = new ProductDAO();
        instance.delete(id);
    }

    @Test
    @Ignore
    public void testGetAll() throws Exception {
        System.out.println("getAll");
        ProductDAO instance = new ProductDAO();
        List<Product> result = instance.getAll();
        for (Product object : result){
            System.out.println(object.toString());
        }
    }

    @Test
    @Ignore
    public void testGetById() throws Exception {
        System.out.println("getById");
        int id = 1;
        ProductDAO instance = new ProductDAO();
        System.out.println(instance.getById(id).toString());
    }
}
