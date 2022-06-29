package com.kt_dosirak.service;

import com.kt_dosirak.dao.OrderDao;
import com.kt_dosirak.domain.OrderDto;
import com.kt_dosirak.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    @Override
    public int doOrder(OrderDto orderDto) throws Exception{
        return orderDao.insert(orderDto);
    }

    @Override
    public List<OrderDto> printOrder(Map map) throws Exception{
        return orderDao.select(map);
    }

    @Override
    public int stackUpdate(ProductDto productDto) throws Exception{
        return orderDao.updateStack(productDto);
    }

}
