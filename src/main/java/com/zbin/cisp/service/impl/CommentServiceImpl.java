package com.zbin.cisp.service.impl;

import com.zbin.cisp.dao.ArticleMapper;
import com.zbin.cisp.dao.CommentMapper;
import com.zbin.cisp.dao.UserMapper;
import com.zbin.cisp.domain.Comment;
import com.zbin.cisp.domain.User;
import com.zbin.cisp.service.CommentService;
import com.zbin.cisp.vo.ArticleVO;
import com.zbin.cisp.vo.CommentVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    CommentMapper commentMapper;

    @Resource
    UserMapper userMapper;

    @Resource
    ArticleMapper articleMapper;

    @Override
    public void create(Comment comment) {
        commentMapper.create(comment);
        articleMapper.addComment(comment.getArticleId());
    }

    @Override
    public List<CommentVO> getCommentByArticleId(Integer articleId) {
        List<CommentVO> commentVOList = commentMapper.getCommentByArticleId(articleId);
        for (CommentVO commentVO : commentVOList) {
            User user = userMapper.getUserById(commentVO.getUserId());
            commentVO.setAvatar(user.getAvatar());
            commentVO.setNickname(user.getNickname());
        }
        return commentVOList;
    }

    @Override
    public int countAllComment() {
        List<ArticleVO> articleVOList = articleMapper.getIndexArticles(null);
        int count = 0;
        for (ArticleVO articleVO : articleVOList) {
            count += this.getCommentByArticleId(articleVO.getId()).size();
        }
        return count;
    }

    @Override
    public void delete(Comment comment) {
        Comment tmpComment = commentMapper.getById(comment.getId());
        commentMapper.delete(comment);
        articleMapper.deleteComment(tmpComment.getArticleId());
    }
}
