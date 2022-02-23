package com.zbin.cisp.dao;

import com.zbin.cisp.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
@Mapper
@Repository
public interface UserMapper {

    User selectByUsername(String username);

    int insert(User user);

    int countAll(@Param("search") String search);

    List<User> getUsers(@Param("search") String search);

    void updateUser(User user);

    User getUserById(Integer id);

    void deleteById(Integer id);
}
