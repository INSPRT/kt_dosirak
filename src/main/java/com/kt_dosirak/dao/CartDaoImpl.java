package com.kt_dosirak.dao;

import com.kt_dosirak.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.kt_dosirak.dao.CartMapper.";

    @Override
    public int insert(CartDto cartDto) throws Exception{
        return session.insert(namespace+"insert", cartDto);
    }

    @Override
    public int update(CartDto cartDto) throws Exception{
        return session.update(namespace+"update", cartDto);
    }

    @Override
    public List<CartDto> cartList(String cart_user_id) throws Exception{
        return session.selectList(namespace+"getCart", cart_user_id);
    }

    @Override
    public CartDto cartChk(CartDto cartDto) throws Exception{
        return session.selectOne(namespace+"checkCart", cartDto);
    }

    @Override
    public int delete(int cart_id) throws Exception{
        return session.delete(namespace+"delete", cart_id);
    }

    @Override
    public int deleteAll(String cart_user_id) throws Exception{
        return session.delete(namespace+"deleteAll", cart_user_id);
    }
}
