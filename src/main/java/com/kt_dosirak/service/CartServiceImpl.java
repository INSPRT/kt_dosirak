package com.kt_dosirak.service;

import com.kt_dosirak.dao.CartDao;
import com.kt_dosirak.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartDao cartDao;

    @Override
    public int addCart(CartDto cartDto) throws Exception{
        try {
            CartDto chkCart = cartDao.cartChk(cartDto);
            if (chkCart != null) {
                return 2;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            return cartDao.insert(cartDto);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public int modifyAmount(CartDto cartDto) throws Exception{
        return cartDao.update(cartDto);
    }

    @Override
    public List<CartDto> listCart(String cart_user_id) throws Exception{
        return cartDao.cartList(cart_user_id);
    }

    @Override
    public CartDto chkCart(CartDto cartDto) throws Exception{
        return cartDao.cartChk(cartDto);
    }

    @Override
    public int deleteCart(int cart_id) throws Exception{
        return cartDao.delete(cart_id);
    }

    @Override
    public int deleteAll(String cart_user_id) throws Exception{
        return cartDao.deleteAll(cart_user_id);
    }
}
