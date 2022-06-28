package com.kt_dosirak.service;

import com.kt_dosirak.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserServiceTest {
    @Autowired
    UserService userService;


    @Test
    public void register() throws Exception {

        Date date = new Date(1990, Calendar.OCTOBER, 25);

        UserDto userDto = new UserDto("admin", "admin", "권태헌", "01025550260", "대구", "aaa@aaa.com",
                                         date, "male", 0, 0, 0);

        assertEquals(1, userService.register(userDto));

    }
}