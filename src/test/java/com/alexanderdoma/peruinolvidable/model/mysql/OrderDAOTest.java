package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.model.entity.Order;
import com.alexanderdoma.peruinolvidable.model.entity.Orderline;
import com.alexanderdoma.peruinolvidable.model.entity.Product;
import com.alexanderdoma.peruinolvidable.model.entity.User;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.Ignore;

public class OrderDAOTest {

    public OrderDAOTest() {
        
    }

    private Orderline getOrderline(){
        Product product = new Product();
        product.setId(1);
        Orderline orderline = new Orderline();
        orderline.setQuantity(100);
        orderline.setTotal(100.00);
        orderline.setProduct(product);
        return orderline;
    }

    @Test
    @Ignore
    public void testAdd() throws Exception {
        System.out.println("add");
        User u = new User();
        u.setId(1);
        Order o = new Order();
        o.setDate(Date.valueOf(LocalDate.now()));
        o.setTotal(100.00);
        o.setSubtotal(100.00);
        o.setStatus("COMPLETED");
        o.setPayment_id("test_payment_id");
        o.setUser(u);
        List<Orderline> orderlines = new ArrayList<>();
        orderlines.add(getOrderline());
        OrderDAO instance = new OrderDAO();
        instance.add(o, orderlines);
    }

    @Test
    @Ignore
    public void testDelete() throws Exception {
        System.out.println("delete");
        int id =11; //pick up a id
        OrderDAO instance = new OrderDAO();
        instance.delete(id);
    }

    @Test
    @Ignore
    public void testGetAll() throws Exception {
        System.out.println("getAll");
        OrderDAO instance = new OrderDAO();
        List<Order> result = instance.getAll();
        for (Order object : result){
            System.out.println(object.toString());
        }
    }

    @Test
    @Ignore
    public void testGetById() throws Exception {
        System.out.println("getById");
        int id = 10;
        OrderDAO instance = new OrderDAO();
        System.out.println(instance.getById(id).toString());
    }
}
