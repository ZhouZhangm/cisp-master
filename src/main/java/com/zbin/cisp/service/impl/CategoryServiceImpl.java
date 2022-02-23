package com.zbin.cisp.service.impl;

import com.zbin.cisp.dao.CategoryMapper;
import com.zbin.cisp.domain.Category;
import com.zbin.cisp.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    CategoryMapper categoryMapper;

    @Override
    public List<Category> getAllCategory() {
        return categoryMapper.getAllCategory();
    }

    @Override
    public void create(Category category) {
        categoryMapper.create(category);
    }

    @Override
    public void deleteById(Integer id) {
        categoryMapper.deleteById(id);
    }

    @Override
    public void updateById(Category category) {
        categoryMapper.updateById(category);
    }
}
