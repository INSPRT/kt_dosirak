package com.kt_dosirak.dao;

import com.kt_dosirak.domain.CategoryDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CategoryDaoImplTest {

    @Autowired
    CategoryDaoImpl categoryDaoImpl;

    @Test
    public void insert() throws Exception {
        CategoryDto categoryDto = new CategoryDto("004", "밀키트");
        assertEquals(1, categoryDaoImpl.insert(categoryDto));
    }

    @Test
    public void select() throws Exception{
        CategoryDto categoryDto = categoryDaoImpl.select("001");

        assertEquals("001", categoryDto.getId());
    }
}