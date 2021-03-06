package com.zbin.cisp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zbin.cisp.domain.Article;
import com.zbin.cisp.domain.Category;
import com.zbin.cisp.domain.User;
import com.zbin.cisp.service.*;
import com.zbin.cisp.vo.ArticleVO;
import com.zbin.cisp.vo.CommentVO;
import org.flowable.task.api.Task;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
@Controller
public class PageController {

    @Resource
    CategoryService categoryService;

    @Resource
    private FlowableService flowableService;

    @Resource
    UserService userService;

    @Resource
    ArticleService articleService;

    @Resource
    CommentService commentService;

    @RequestMapping("/")
    public void test(HttpServletResponse response) throws Exception {
        response.sendRedirect("/index");
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request, @RequestParam(required = false) Integer cId,
                        @RequestParam(required = false) String order, @RequestParam(required = false) String search,
                        @RequestParam(required = false) Integer page) {
        int pageIndex = 0;
        // 一页显示10篇文章
        if (page != null) {
            pageIndex = (page - 1) * 10;
        }
        List<Article> hotArticles = articleService.getHotArticles();
        List<Category> list = categoryService.getAllCategory();
        request.setAttribute("category", list);
        List<ArticleVO> articleList;
        int count = 0;
        if (search == null) {
            if (cId == null || cId == 0) {
                // 通过页数得到首页文章
                articleList = articleService.getIndexArticles(pageIndex);
                count = articleService.countIndexArticles();
                for (ArticleVO articleVO : articleList) {
                    // 给文章设置评论数量
                    articleVO.setCommentCount(commentService.getCommentByArticleId(articleVO.getId()).size());
                }
            } else {
                articleList = articleService.getArticlesByCategoryId(cId, pageIndex);
                count = articleService.countArticleByCateId();
                for (ArticleVO articleVO : articleList) {
                    articleVO.setCommentCount(commentService.getCommentByArticleId(articleVO.getId()).size());
                }
            }
            if ("hot".equals(order)) {
                articleList.sort(Comparator.comparing(ArticleVO::getCommentCount).reversed());
            }
            if ("new".equals(order)) {
                articleList.sort(Comparator.comparing(ArticleVO::getCreateTime).reversed());
            }
        } else {
            articleList = articleService.searchArticle(null, null, null, search);
        }
        List<ArticleVO> topArticleList = articleService.getTopArticle();
        if (topArticleList.size() > 0) {
            request.setAttribute("topArticleList", topArticleList);
        }
        request.setAttribute("cId", cId);
        request.setAttribute("order", order);
        request.setAttribute("page", page);
        request.setAttribute("articleList", articleList);
        request.setAttribute("articleCount", count);
        request.setAttribute("hotArticles", hotArticles);
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "frontend/user/login";
    }

    @RequestMapping("/register")
    public String register() {
        return "frontend/user/reg";
    }

    @RequestMapping("/403")
    public String error403() {
        return "403";
    }

    @RequestMapping("/404")
    public String error404() {
        return "404";
    }

    @RequestMapping("/500")
    public String error500() {
        return "500";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "backend/login";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request) {
        List<Category> list = categoryService.getAllCategory();
        request.getSession().setAttribute("category", list);
        return "frontend/article/add";
    }

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request) {
        int userCount = userService.countAll(null);
        int articleCount = articleService.countAllArticle();
        int commentCount = commentService.countAllComment();
        request.setAttribute("userCount", userCount);
        request.setAttribute("articleCount", articleCount);
        request.setAttribute("commentCount", commentCount);
        request.setAttribute("ip", request.getRemoteAddr());
        return "backend/welcome";
    }

    @RequestMapping("/admin/index")
    public String adminIndex() {
        return "backend/index";
    }

    @RequestMapping("/admin/user/userList")
    public String userManager(HttpServletRequest request, String search) {
        int userCount = userService.countAll(search);
        List<User> userList = userService.getUsers(search);
        request.getSession().setAttribute("userCount", userCount);
        request.getSession().setAttribute("userList", userList);
        return "backend/user/list";
    }

    @RequestMapping("/user/set")
    public String userSet() {
        return "frontend/user/set";
    }

    @RequestMapping("/article/{id}")
    public String articleDeatil(HttpServletRequest request, @PathVariable(value = "id") Integer id) {
        request.getSession().removeAttribute("commentVOList");
        ArticleVO articleVO = articleService.getArticleById(id);
        List<CommentVO> commentVOList = commentService.getCommentByArticleId(id);
        request.getSession().setAttribute("article", articleVO);
        if (commentVOList.size() != 0) {
            request.getSession().setAttribute("commentVOList", commentVOList);
        }
        return "/frontend/article/detail";
    }

    @RequestMapping("/user/center")
    public String userCenter(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List<ArticleVO> myArticles = articleService.getArticlesByUserId(user.getId());
        for (ArticleVO articleVO : myArticles) {
            articleVO.setCommentCount(commentService.getCommentByArticleId(articleVO.getId()).size());
        }
        request.getSession().setAttribute("myArticles", myArticles);
        return "frontend/user/center";
    }

    @RequestMapping("/notice")
    public String notice() {
        return "/notice";
    }

    @RequestMapping("/admin/article/articleList")
    public String articleList(HttpServletRequest request,
                              @RequestBody(required = false) String param) {
        List<Category> list = categoryService.getAllCategory();
        request.setAttribute("category", list);
        request.setAttribute("articleCount", articleService.countAllArticle());
        if (param != null) {
            JSONObject json = JSON.parseObject(param);
            Integer categoryId = json.getInteger("categoryId");
            String keyword = json.getString("keyword");
            String startTime = json.getString("startTime");
            String endTime = json.getString("endTime");
            List<ArticleVO> articleVOList = articleService
                    .searchArticle(categoryId, startTime, endTime, keyword);
            request.getSession().setAttribute("articleList", articleVOList);
            request.setAttribute("articleCount", articleVOList.size());
            return "/backend/article/list";
        }
        return "/backend/article/list";
    }

    @RequestMapping("/admin/article/category")
    public String categoryList(HttpServletRequest request) {
        List<Category> categoryList = categoryService.getAllCategory();
        request.getSession().setAttribute("categoryList", categoryList);
        return "/backend/article/category";
    }


    @RequestMapping("/admin/article/category/add")
    public String addCategory(HttpServletRequest request) {
        return "/backend/article/category-add";
    }

    @RequestMapping("/admin/article/category/edit")
    public String editCategory(HttpServletRequest request) {
        return "/backend/article/category-edit";
    }

    @RequestMapping( value = "/admin/article/flowable", method= RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
    public String flowableList(@RequestParam String assignee, HttpServletRequest request) {
        List<Task> tasks = flowableService.getTasks(assignee);
        request.getSession().setAttribute("tasksList", tasks);
        return "/backend/article/flowable";
    }

    @RequestMapping("/admin/article/flowable/add")
    public String addFlowable(HttpServletRequest request) {
        return "/backend/article/flowable-add";
    }

    @RequestMapping("/admin/article/flowable/edit")
    public String editFlowable(HttpServletRequest request) {
        return "/backend/article/flowable-edit";
    }

    @RequestMapping("/user/{id}")
    public String userHome(HttpServletRequest request, @PathVariable(value = "id") Integer id) {
        List<ArticleVO> articleVOList = articleService.getArticlesByUserId(id);
        for (ArticleVO articleVO : articleVOList) {
            articleVO.setCommentCount(commentService.getCommentByArticleId(articleVO.getId()).size());
        }
        User userInfo = userService.getUserById(id);
        request.getSession().setAttribute("userInfo", userInfo);
        request.getSession().setAttribute("articleVOList", articleVOList);
        return "/frontend/user/home";
    }

    @RequestMapping("/admin/user/edit")
    public String userEdit(HttpServletRequest request, @RequestParam Integer id) {
        User user = userService.getUserById(id);
        request.setAttribute("editUser", user);
        return "/backend/user/edit";
    }

    @RequestMapping("/admin/user/add")
    public String userAdd(HttpServletRequest request) {
        return "/backend/user/add";
    }

    @RequestMapping("/admin/article/edit")
    public String articleAdd(HttpServletRequest request,
                             @RequestParam(required = false) Integer articleId) {
        List<Category> list = categoryService.getAllCategory();
        request.getSession().setAttribute("category", list);
        if (articleId != null) {
            Article article = articleService.getArticleById(articleId);
            request.setAttribute("editArticle", article);
        }
        return "/backend/article/article-edit";
    }

}
