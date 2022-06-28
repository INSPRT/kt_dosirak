package com.kt_dosirak.dao;

import com.kt_dosirak.domain.OrderDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.kt_dosirak.dao.OrderMapper.";

    @Override
    public int insert(OrderDto orderDto) throws Exception{
        return session.insert(namespace+"insert", orderDto);
    }

    @Override
    public List<OrderDto> select(Map map) throws Exception{
        return session.selectList(namespace+"select", map);
    }
}
