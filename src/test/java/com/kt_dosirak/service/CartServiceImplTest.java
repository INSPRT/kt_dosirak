package com.kt_dosirak.service;

import com.kt_dosirak.domain.CartDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartServiceImplTest {
    @Autowired
    CartService cartService;

    @Test
    public void addCart() throws Exception {
        String cart_user_id = "admin";
        String cart_product_id = "dakChest01";
        int cart_amount = 10;

        CartDto cartDto = new CartDto();
        cartDto.setCart_user_id(cart_user_id);
        cartDto.setCart_product_id(cart_product_id);
        cartDto.setCart_amount(cart_amount);


        assertEquals(1, cartService.addCart(cartDto));
        assertEquals(1, cartService.modifyAmount(cartDto));
    }

    @Test
    public void deleteCart() throws Exception{
        int cart_id = 1;
        cartService.deleteCart(cart_id);
    }
    @Test
    public void setAmount() throws Exception{
        int cart_id = 2;
        int count = 5;

        CartDto cartDto = new CartDto();
        cartDto.setCart_id(cart_id);
        cartDto.setCart_amount(count);

        assertEquals(1, cartService.modifyAmount(cartDto));
    }

    @Test
    public void listCart() throws Exception{
        String cart_user_id = "admin";

        List<CartDto> list = cartService.listCart(cart_user_id);
        for(CartDto cartDto : list) {
            System.out.println(cartDto);
        }
    }

    @Test
    public void chkCart()throws Exception{
        String user_id = "admin";
        String product_id = "dakChest01";

        CartDto cartDto = new CartDto();
        cartDto.setCart_user_id(user_id);
        cartDto.setCart_product_id(product_id);

        CartDto resutlCart = cartService.chkCart(cartDto);
        System.out.println("결과 : " + resutlCart);
    }



}