package com.kt_dosirak.service;

import com.kt_dosirak.dao.UserDao;
import com.kt_dosirak.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public int register(UserDto userDto) throws Exception {
        return userDao.insert(userDto);
    }

    @Override
    public UserDto selectUser(String id) throws Exception {
        return userDao.select(id);
    }

    @Override
    public int updateUser(UserDto userDto) throws Exception{
        return userDao.update(userDto);
    }

    @Override
    public int dropUser(String id) throws Exception{
        return userDao.delete(id);
    }

    @Override
    public int idCheck(String id) {
        return userDao.idCheck(id);
    }
}
