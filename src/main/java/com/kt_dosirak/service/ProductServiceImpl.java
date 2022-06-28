package com.kt_dosirak.service;

import com.kt_dosirak.dao.ProductDao;
import com.kt_dosirak.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDao productDao;

    @Override
    public int chestCount() throws Exception{
        return productDao.countChest();
    }

    @Override
    public int dosirakCount() throws Exception{
        return productDao.countDosirak();
    }

    @Override
    public int beverageCount() throws Exception{
        return productDao.countBeverage();
    }

    @Override
    public int mealkitCount() throws Exception{
        return productDao.countMealkit();
    }

    @Override
    public int write(ProductDto productDto) throws Exception{
        return productDao.insert(productDto);
    }

    @Override
    public int removeChestAll() throws Exception{
        return productDao.deleteChestAll();
    }

    @Override
    public int removeAll() throws Exception{
        return productDao.deleteAll();
    }

    @Override
    public int remove(String product_id) throws Exception{
        return productDao.delete(product_id);
    }

    @Override
    public ProductDto read(String product_id) throws Exception{
        return productDao.select(product_id);
    }

    @Override
    public List<ProductDto> readAll() throws Exception{
        return productDao.selectAll();
    }

    @Override
    public List<ProductDto> readHomePage(Map map) throws Exception{
        return productDao.selectHomePage(map);
    }

    @Override
    public List<ProductDto> readChestPage(Map map) throws Exception{
        return productDao.selectChestPage(map);
    }

    @Override
    public List<ProductDto> readDosirakPage(Map map) throws Exception{
        return productDao.selectDosirakPage(map);
    }

    @Override
    public List<ProductDto> readBeveragePage(Map map) throws Exception{
        return productDao.selectBeveragePage(map);
    }

    @Override
    public List<ProductDto> readMealkitPage(Map map) throws Exception{
        return productDao.selectMealkitPage(map);
    }

    @Override
    public int modify(ProductDto productDto) throws Exception{
        return productDao.update(productDto);
    }


}


