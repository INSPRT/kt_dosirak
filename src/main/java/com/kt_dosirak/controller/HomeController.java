package com.kt_dosirak.controller;

import com.kt_dosirak.domain.ProductDto;
import com.kt_dosirak.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    ProductService productService;

    @GetMapping("/")
    public String item(Model m){

        try {
            Map map = new HashMap();
            map.put("offset", 0);
            map.put("pageSize", 21);

            List<ProductDto> homeList = productService.readHomePage(map);
            m.addAttribute("homeList", homeList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "kt_home";
    }
}
