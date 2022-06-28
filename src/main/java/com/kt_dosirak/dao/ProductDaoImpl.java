package com.kt_dosirak.dao;

import com.kt_dosirak.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.kt_dosirak.dao.ProductMapper.";

    @Override
    public int countChest() throws Exception{
        return session.selectOne(namespace+"countChest");
    }

    @Override
    public int countDosirak() throws Exception{
        return session.selectOne(namespace+"countDosirak");
    }

    @Override
    public int countBeverage() throws Exception{
        return session.selectOne(namespace+"countBeverage");
    }

    @Override
    public int countMealkit() throws Exception{
        return session.selectOne(namespace+"countMealkit");
    }


    @Override
    public int insert(ProductDto productDto) throws Exception {
        return session.insert(namespace+"insert", productDto);
    }

    @Override
    public List<ProductDto> selectHomePage(Map map) throws Exception {
        return session.selectList(namespace+"selectHomePage", map);
    }

    @Override
    public List<ProductDto> selectChestPage(Map map) throws Exception {
        return session.selectList(namespace+"selectChestPage", map);
    }

    @Override
    public List<ProductDto> selectDosirakPage(Map map) throws Exception {
        return session.selectList(namespace+"selectDosirakPage", map);
    }

    @Override
    public List<ProductDto> selectBeveragePage(Map map) throws Exception {
        return session.selectList(namespace+"selectBeveragePage", map);
    }

    @Override
    public List<ProductDto> selectMealkitPage(Map map) throws Exception {
        return session.selectList(namespace+"selectMealkitPage", map);
    }

    @Override
    public ProductDto select(String product_id) throws Exception{
        return session.selectOne(namespace+"select", product_id);
    }
    @Override
    public List<ProductDto> selectAll() throws Exception{
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public int delete(String id) throws Exception {
        return session.delete(namespace+"delete", id);
    }

    @Override
    public int deleteChestAll() throws Exception{
        return session.delete(namespace+"deleteChestAll");
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int update(ProductDto productDto) throws Exception{
        return session.update(namespace+"update", productDto);
    }
}
