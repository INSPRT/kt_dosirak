package com.kt_dosirak.controller;

import com.kt_dosirak.domain.CartDto;
import com.kt_dosirak.domain.OrderDto;
import com.kt_dosirak.domain.ProductDto;
import com.kt_dosirak.service.CartService;
import com.kt_dosirak.service.OrderService;
import com.kt_dosirak.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    CartService cartService;
    @Autowired
    OrderService orderService;

    @Autowired
    ProductService productService;

    @GetMapping("/order")
    public String orderPage(HttpServletRequest request, Model m) {

        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("id");
        try {
            List<CartDto> cartList = cartService.listCart(user_id);
            m.addAttribute("cartList", cartList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
        String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String subNum = "";

        for(int i = 1; i <= 6; i ++) {
            subNum += (int)(Math.random() * 10);
        }
        String order_id = ymd + "_" + subNum;
        m.addAttribute("order_id", order_id);

        return "kt_order";
    }


    @PostMapping("/order/pay")
    public String orderPay(OrderDto orderDto, HttpServletRequest request, Model m) {

        try {
            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("id");

            String[] ids = orderDto.getOrder_product_id().split(",");
            String[] stacks = orderDto.getOrder_amount().split(",");
            String[] product_names = orderDto.getOrder_product_name().split(",");

                for(int j = 0; j<ids.length; j++) {
                    ProductDto productDto = productService.read(ids[j]);

                    int num = Integer.parseInt(stacks[j]);

                    if(productDto.getProduct_stock() < num){
                        m.addAttribute("left_stock", productDto.getProduct_stock());
                        m.addAttribute("empty_item_names", productDto.getProduct_name());
                        m.addAttribute("order_item_names", product_names[j]);
                        m.addAttribute("order_items_cnt", stacks[j]);
                        return "kt_emptyProduct";
                    }
                        productDto.setProduct_id(ids[j]);
                        productDto.setProduct_stock(num);

                        orderService.stackUpdate(productDto);
                }

            if(orderService.doOrder(orderDto)==1){
               cartService.deleteAll(user_id);
            }
        } catch (Exception e) {

        }

        return "redirect:/order/history";
    }

    @GetMapping("/order/history")
    public String orderHistory(HttpServletRequest request, HttpServletResponse response, Model m) throws IOException {
        HttpSession session = request.getSession();
        String order_user_id = (String) session.getAttribute("id");

        Map map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 30);
        map.put("order_user_id", order_user_id);
        try {
            List<OrderDto> orderList = orderService.printOrder(map);
            m.addAttribute("orderList", orderList);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "kt_orderHistory";
    }


        private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }

}