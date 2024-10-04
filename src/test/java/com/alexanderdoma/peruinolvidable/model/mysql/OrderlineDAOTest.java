package com.alexanderdoma.peruinolvidable.model.mysql;

import com.alexanderdoma.peruinolvidable.model.entity.Orderline;
import com.alexanderdoma.peruinolvidable.model.entity.Product;
import com.alexanderdoma.peruinolvidable.model.entity.Order;
import java.util.List;
import org.junit.Ignore;
import org.junit.Test;

public class OrderlineDAOTest {
    
    public OrderlineDAOTest() {
    }
    
    @Test
    @Ignore
    public void testAdd() throws Exception {
        System.out.println("add");
        Product objProduct = new Product();
        objProduct.setId(1);
        Order objOrder = new Order();
        objOrder.setId(10);
        Orderline objOrderline = new Orderline();
        objOrderline.setQuantity(2);
        objOrderline.setTotal(100);
        objOrderline.setProduct(objProduct);
        objOrderline.setOrder(objOrder);
        OrderlineDAO instance = new OrderlineDAO();
        instance.add(objOrderline);
    }
    
    @Test
    @Ignore
    public void testDelete() throws Exception {
        System.out.println("delete");
        int order_id = 10;
        OrderlineDAO instance = new OrderlineDAO();
        instance.delete(order_id);
    }

    @Test
    @Ignore
    public void testGetAll() throws Exception {
        System.out.println("getAll");
        OrderlineDAO instance = new OrderlineDAO();
        List<Orderline> result = instance.getAll();
    }

    @Test
    @Ignore
    public void testGetById() throws Exception {
        System.out.println("getById");
        int id = 5; //pick up an id
        OrderlineDAO instance = new OrderlineDAO();
        System.out.println(instance.getById(id).toString());
    }
}
