package com.kt_dosirak.service;

import com.kt_dosirak.domain.OrderDto;

import java.util.List;
import java.util.Map;

public interface OrderService {
    int doOrder(OrderDto orderDto) throws Exception;

    List<OrderDto> printOrder(Map map) throws Exception;
}
