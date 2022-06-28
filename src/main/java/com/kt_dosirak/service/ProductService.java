package com.kt_dosirak.service;

import com.kt_dosirak.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductService {
    int chestCount() throws Exception;

    int dosirakCount() throws Exception;

    int beverageCount() throws Exception;

    int mealkitCount() throws Exception;

    int write(ProductDto productDto) throws Exception;

    int removeChestAll() throws Exception;

    int removeAll() throws Exception;

    int remove(String product_id) throws Exception;

    ProductDto read(String product_id) throws Exception;

    List<ProductDto> readAll() throws Exception;

    List<ProductDto> readHomePage(Map map) throws Exception;

    List<ProductDto> readChestPage(Map map) throws Exception;

    List<ProductDto> readDosirakPage(Map map) throws Exception;

    List<ProductDto> readBeveragePage(Map map) throws Exception;

    List<ProductDto> readMealkitPage(Map map) throws Exception;

    int modify(ProductDto productDto) throws Exception;
}
