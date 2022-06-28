package com.kt_dosirak.controller;

import com.kt_dosirak.dao.UserDao;
import com.kt_dosirak.domain.UserDto;
import com.kt_dosirak.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserDao userDao;
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String loginForm(){
        return "kt_login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 1. 세션을 종료
        session.invalidate();
        // 2. 홈으로 이동
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pass, String toURL, boolean rememberId,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {

        UserDto userDto = userService.selectUser(id);
        PrintWriter out = response.getWriter();

        if(loginCheck(id, pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("name", userDto.getName());
        }else{
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
            out.println("history.go(-1); </script>");
            out.close();
            return "redirect:/login/login";

        }

        if(rememberId) {
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;

        return "redirect:"+toURL;
    }

    private boolean loginCheck(String id, String pass) {
        UserDto userDto = null;

        try {
            userDto = userService.selectUser(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return userDto!=null && userDto.getPass().equals(pass);
    }

}
