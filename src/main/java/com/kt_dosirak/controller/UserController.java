package com.kt_dosirak.controller;

import com.kt_dosirak.domain.UserDto;
import com.kt_dosirak.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/user/info")
    public String userInfo(Model m, HttpServletRequest request){
        if (!loginCheck(request)) {
            HttpSession session = request.getSession();
            session.invalidate();

            return "redirect:/login/login?toURL=" + request.getRequestURL();
        }

        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");

            UserDto userDto = userService.selectUser(id);
            Date birth = userDto.getBirth();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String strNowDate = simpleDateFormat.format(birth);

            m.addAttribute(userDto);
            m.addAttribute("birth", strNowDate);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "kt_user_info";
    }

    @PostMapping("/user/drop")
    public String userDrop(HttpServletRequest request){
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");

            userService.dropUser(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();
        session.invalidate();

        return "redirect:/";
    }

    @PostMapping("/user/modify")
    public String userModify(UserDto userDto, HttpServletRequest request){
        try {
            userService.updateUser(userDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/user/info";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }
}
