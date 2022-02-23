package com.zbin.cisp.service;

import com.zbin.cisp.domain.Category;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public interface CategoryService {

    List<Category> getAllCategory();

    void create(Category category);

    void deleteById(Integer id);

    void updateById(Category category);
}
