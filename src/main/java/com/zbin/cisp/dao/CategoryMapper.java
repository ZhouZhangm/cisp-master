package com.zbin.cisp.dao;

import com.zbin.cisp.domain.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zbin on 2019-02-16
 */
@Repository
@Mapper
public interface CategoryMapper {

    List<Category> getAllCategory();

    void create(Category category);

    void deleteById(Integer id);

    void updateById(Category category);
}
