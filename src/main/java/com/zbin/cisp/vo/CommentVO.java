package com.zbin.cisp.vo;

import com.zbin.cisp.domain.Comment;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public class CommentVO extends Comment {

    private String nickname;
    private String avatar;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
