package com.zbin.cisp.dao;

import com.zbin.cisp.domain.Comment;
import com.zbin.cisp.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
@Repository
@Mapper
public interface CommentMapper {

    void create(Comment comment);

    List<CommentVO> getCommentByArticleId(Integer articleId);

    void delete(Comment comment);

    Comment getById(Integer id);

    void deleteByArticleId(Integer articleId);
}
