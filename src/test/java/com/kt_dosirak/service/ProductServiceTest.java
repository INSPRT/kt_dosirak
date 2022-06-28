package com.kt_dosirak.service;

import com.kt_dosirak.domain.ProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertEquals;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductServiceTest {
    @Autowired
    ProductService productService;

    @Test
    public void insert() throws Exception {
        ProductDto productDto = null;
//        for(int i=1; i<300; i++){
//            productDto = new ProductDto("dakChest"+i, "촉촉닭가슴살"+i, "001", 1900+i, 10, 180+i, "<img src=\"../../resources/img/product/dakChest.jpeg\">");
//            assertEquals(1, productService.write(productDto));
//        }

        for(int i=10; i<17; i++){
            productDto = new ProductDto("mealkit"+i, "완소밀키트"+i, "004", 5300+i, 10, 480+i, "<img src=\"../../resources/img/product/mealkit.jpeg\">");
            assertEquals(1, productService.write(productDto));
        }

    }

    @Test
    public void count() throws Exception{
        int cnt = productService.chestCount();

        assertEquals(31, cnt);
    }
    @Test
    public void insertChest() throws Exception {
        ProductDto productDto = null;
        productDto = new ProductDto("dakChest08", "heodak8", "001", 2450, 10, 190, "<img src=\"../../resources/img/product/dakChest.jpeg\">");
        assertEquals(1, productService.write(productDto));
    }
    @Test
    public void selectPage() throws Exception {
        ProductDto productDto = productService.read("item1");
        assertEquals("item1", productDto.getProduct_id());
    }

    @Test
    public void select() throws Exception {
        ProductDto productDto = productService.read("dakChest01");
        System.out.println(productDto.getProduct_name());
        assertEquals("dakChest01", productDto.getProduct_id());
    }

    @Test
    public void delete() throws Exception{
        productService.removeChestAll();
    }
}