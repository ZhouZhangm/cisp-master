package com.zbin.cisp.service;

import com.zbin.cisp.domain.User;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public interface UserService {

    /**
     * 登录校验
     */
    User loginCheck(User user);

    /**
     * 用户注册
     */
    void register(User user);

    /**
     * 用户名校验
     */
    Boolean isUsernameExsit(String username);

    User getUserByUsername(String username);

    int countAll(String search);

    List<User> getUsers(String search);

    void updateUser(User user);

    User getUserById(Integer id);

    void deleteById(Integer id);
}
