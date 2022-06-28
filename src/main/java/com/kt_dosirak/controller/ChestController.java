package com.kt_dosirak.controller;

import com.kt_dosirak.domain.PageHandler;
import com.kt_dosirak.domain.ProductDto;
import com.kt_dosirak.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/chest")
public class ChestController {
    @Autowired
    ProductService productService;

    @GetMapping("/itemlist")
    public String itemlist(Integer page, Integer pageSize, String id, Model m){

        if(page==null){
            page = 1;
        }
        if(pageSize==null){
            pageSize = 12;
        }

        String mode = null;
        try {

            int totalCnt = productService.chestCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1) * pageSize);
            map.put("pageSize", pageSize);

            List<ProductDto> chestList = productService.readChestPage(map);

            m.addAttribute("ph", pageHandler);
            m.addAttribute("chestList", chestList);
            m.addAttribute("mode", mode);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "kt_chest";
    }

    @GetMapping("/detail")
    public String read(String product_id, Model m){

        String mode = null;
        m.addAttribute("mode", mode);

        ProductDto productDto = null;
        try {
            productDto = productService.read(product_id);
            m.addAttribute("productDto", productDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "kt_product_detail";
    }

    @GetMapping("/write")
    public String write(Model m) throws Exception{

        return "kt_product_write";
    }

    @PostMapping("/write")
    public String write(ProductDto productDto, Model m, HttpSession session){

        try {
            productService.write(productDto);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        m.addAttribute(productDto);

//        return "kt_product_detail";
        return "redirect:/chest/detail?product_id="+productDto.getProduct_id();
    }

    @PostMapping("/remove")
    public String remove(String product_id) throws Exception{

        productService.remove(product_id);

        return "redirect:/chest/itemlist";
    }

    @GetMapping("/modify")
    public String modify(String product_id, Model m) throws Exception{

        ProductDto productDto = null;
        try {
            productDto = productService.read(product_id);
            m.addAttribute("productDto", productDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "kt_product_modify";
    }

    @PostMapping("/modify")
    public String modifySubmit(ProductDto productDto, Model m) throws Exception{

        productService.modify(productDto);

        return "redirect:/chest/detail?product_id="+productDto.getProduct_id();
    }


}

