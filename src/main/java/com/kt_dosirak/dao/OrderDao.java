package com.kt_dosirak.dao;

import com.kt_dosirak.domain.OrderDto;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    int insert(OrderDto orderDto) throws Exception;

    List<OrderDto> select(Map map) throws Exception;
}
