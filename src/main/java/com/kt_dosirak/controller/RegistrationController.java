package com.kt_dosirak.controller;

import com.kt_dosirak.domain.UserDto;
import com.kt_dosirak.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegistrationController {
    @Autowired
    UserService userService;

    @GetMapping("/register/add")
    public String register(){
        return "kt_registration";
    }


    //    @RequestMapping(value = "/register/receive", method= RequestMethod.POST)
    //    @RequestParam(value="userDto", required = true)
    @PostMapping("/register/receive")
    public String regi_receive(UserDto userDto) {

        try {
            if(userService.register(userDto)!=1){
                return "redirect:/register/add";
            }
        } catch (Exception e) {
            System.out.println("ResgistrationController 에러");
        }

        return "redirect:/";
    }

    @PostMapping("/user/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("id") String id){

        Integer cnt;

//        ㅠㅠㅠㅠ
        if(id.equals("")){
            cnt = null;
            return String.valueOf(cnt);
        }
        cnt = userService.idCheck(id);

        return String.valueOf(cnt);
    }
}
