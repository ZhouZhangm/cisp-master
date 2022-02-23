package com.zbin.cisp.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public class PasswordUtil {

    /**
     * 加密密码
     */
    public static String bryptPwd(String pwd) {
        return BCrypt.hashpw(pwd, BCrypt.gensalt());
    }

    /**
     * 校验密码
     */
    public static boolean validPwd(String pwd, String hashed) {
        try {
            return BCrypt.checkpw(pwd, hashed);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
