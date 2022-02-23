package com.zbin.cisp.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        boolean flag;
        if (request.getRequestURI().startsWith("/admin")
                && request.getSession().getAttribute("adminUser") == null) {
            response.sendRedirect("/admin");
            flag = false;
        } else if (request.getSession().getAttribute("user") == null
                && request.getSession().getAttribute("adminUser") == null) {
            response.sendRedirect("/login");
            flag = false;
        } else {
            flag = true;
        }
        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {

    }

}