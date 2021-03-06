package com.zbin.cisp.service;

import com.zbin.cisp.domain.Comment;
import com.zbin.cisp.vo.CommentVO;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public interface CommentService {

    void create(Comment comment);

    List<CommentVO> getCommentByArticleId(Integer articleId);

    int countAllComment();

    void delete(Comment comment);
}
