package com.kt_dosirak.dao;

import com.kt_dosirak.domain.CartDto;

import java.util.List;

public interface CartDao {
    int insert(CartDto cartDto) throws Exception;

    int update(CartDto cartDto) throws Exception;

    List<CartDto> cartList(String cart_user_id) throws Exception;

    CartDto cartChk(CartDto cartDto) throws Exception;

    int delete(int cart_id) throws Exception;

    int deleteAll(String cart_user_id) throws Exception;
}
