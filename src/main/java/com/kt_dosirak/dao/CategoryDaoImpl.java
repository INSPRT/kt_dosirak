package com.kt_dosirak.dao;

import com.kt_dosirak.domain.CategoryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.kt_dosirak.dao.CategoryMapper.";

    public int insert(CategoryDto categoryDto) throws Exception{
        return session.insert(namespace+"insert", categoryDto);
    }

    public CategoryDto select(String id) throws Exception{
        return session.selectOne(namespace+"select", id);
    }

    public int deleteAll() throws Exception{
        return session.delete(namespace+"delete");
    }

}
