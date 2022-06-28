package com.kt_dosirak.dao;

import com.kt_dosirak.domain.UserDto;

public interface UserDao {
    int insert(UserDto userDto) throws Exception;

    UserDto select(String id) throws Exception;

    int update(UserDto userDto) throws Exception;

    int delete(String id) throws Exception;

    int idCheck(String id);
}
