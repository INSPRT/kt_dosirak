package com.kt_dosirak.controller;

import com.kt_dosirak.domain.CartDto;
import com.kt_dosirak.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @PostMapping("/cart/add")
    @ResponseBody
    public String addCart(CartDto cartDto, HttpServletRequest request, Model m) {

        if (!loginCheck(request)) {
            HttpSession session = request.getSession();
            session.invalidate();
            return "5";
        }
        try {
            int result = cartService.addCart(cartDto);
            return result + "";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @GetMapping("/cart/add")
    public String directOrder(){

        return "redirect:/cart/cartlist";
    }

    @PostMapping("/cart/update")
    public String updateCart(CartDto cartDto) throws Exception{

        cartService.modifyAmount(cartDto);


        return "kt_cart";
    }

    @PostMapping("/cart/remove")
    public String removeCart(int cart_id){
        try {
            cartService.deleteCart(cart_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/cart/cartlist";
    }

    @PostMapping("/cart/removeAll")
    public String removeAll(String cart_user_id){

        try {
            cartService.deleteAll(cart_user_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/cart/cartlist";
    }

    @GetMapping("/cart/cartlist")
    public String item(HttpServletRequest request, Model m) {
        if (!loginCheck(request)) {
            HttpSession session = request.getSession();
            session.invalidate();

            return "redirect:/login/login?toURL=" + request.getRequestURL();
        } else {
            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("id");
            try {
                List<CartDto> cartList = cartService.listCart(user_id);
                m.addAttribute("cartList", cartList);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            return "kt_cart";
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }

}
