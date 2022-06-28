package com.kt_dosirak.dao;

import com.kt_dosirak.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductDao {
    int countChest() throws Exception;

    int countDosirak() throws Exception;

    int countBeverage() throws Exception;

    int countMealkit() throws Exception;

    int insert(ProductDto productDto) throws Exception;

    List<ProductDto> selectHomePage(Map map) throws Exception;

    List<ProductDto> selectChestPage(Map map) throws Exception;

    List<ProductDto> selectDosirakPage(Map map) throws Exception;

    List<ProductDto> selectBeveragePage(Map map) throws Exception;

    List<ProductDto> selectMealkitPage(Map map) throws Exception;

    ProductDto select(String id) throws Exception;

    List<ProductDto> selectAll() throws Exception;

    int delete(String id) throws Exception;

    int deleteChestAll() throws Exception;

    int deleteAll() throws Exception;

    int update(ProductDto productDto) throws Exception;
}
