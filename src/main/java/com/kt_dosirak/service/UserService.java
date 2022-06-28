package com.kt_dosirak.service;

import com.kt_dosirak.domain.UserDto;

public interface UserService {
    int register(UserDto userDto) throws Exception;

    UserDto selectUser(String id) throws Exception;

    int updateUser(UserDto userDto) throws Exception;

    int dropUser(String id) throws Exception;

    int idCheck(String id);
}
