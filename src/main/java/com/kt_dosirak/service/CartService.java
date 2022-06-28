package com.kt_dosirak.service;

import com.kt_dosirak.domain.CartDto;

import java.util.List;

public interface CartService {
    int addCart(CartDto cartDto) throws Exception;

    int modifyAmount(CartDto cartDto) throws Exception;

    List<CartDto> listCart(String cart_user_id) throws Exception;

    CartDto chkCart(CartDto cartDto) throws Exception;

    int deleteCart(int cart_id) throws Exception;

    int deleteAll(String cart_user_id) throws Exception;
}
