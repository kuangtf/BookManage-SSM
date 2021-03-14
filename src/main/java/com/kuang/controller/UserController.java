package com.kuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.service.UserService;
import com.kuang.utils.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController extends HttpServlet {

    @Autowired
    private UserService userService;

    static String username;

    /**
     * 跳转登录页面
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "user/login";
    }

    /**
     * 用户登录
     */
    @RequestMapping("/loginUser")
    public String loginUser(User user, HttpServletRequest request) {
        username = request.getParameter("username");
        User userFinded = userService.loginUser(user);
        System.err.println(userFinded);
        if (userFinded == null) {
            request.setAttribute("msg", "用户名或密码有误，请重新输入。");
            return "user/login";
        } else {
            request.getSession().setAttribute("user", userFinded);
            request.setAttribute("msg", "登录成功。");
            return "user/user";
        }
    }

    /**
     * 验证码实现
     */
    @RequestMapping(value = "/captcha", method = RequestMethod.GET)
    public void captcha(@RequestParam(value = "time") String time, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ValidateCode code= new ValidateCode(130,35,30,"validateCode");
        code.getCode(request,response);
    }

    /**
     * 跳转学生主页面
     */
    @RequestMapping("/toUser")
    public String toUser(){
        return "user/user";
    }

    /**
     * 查询当前用户
     */
    @RequestMapping("/User")
    public String listUser(Model model){
        List<User> list = userService.queryUserByName(username);
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",list);
        return "user/user";
    }

    /**
     * 跳转更新页面  并回显页面信息
     */
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(int id,Model model){
        User user = userService.queryUserById(id);
        System.err.println("toUpdateUser=>" + user);
        model.addAttribute("QUser",user);
        return "user/updateUser";
    }

    /**
     * 更新学生信息
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUser(user);
        return "redirect:/user/User";//重定向查询请求中
    }

    /**
     * 查询全部的书籍，并返回到一个书籍展示页面（无分页查询）
     */
    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list = userService.queryAllBook();
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",list);
        return "user/allBookUser";
    }


    /**
     * 跳转到学生已借阅的图书的页面
     */
    @RequestMapping("/borrowBooks")
    public String borrowBooks(){
        return "user/borrowBook";
    }

    /**
     * 根据图书名 --> 条件查询图书
     */
    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        List<Books> books = userService.queryBookByName("%"+queryBookName+"%");
        System.err.println("queryBook=>"+books);

        if (books == null){
            return "redirect:/user/allBook";
        }

        PageHelper.startPage(pn,5);
        PageInfo pageInfo = new PageInfo(books,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",books);
        return "user/allBookUser";
    }

    /**
     * 查询用户已借的书籍名字
     */
    @RequestMapping("/userBook")
    public String queryUserBook(Model model) {
        String studentNum = userService.queryNumByName(username);
        List<String>  bookName = userService.queryUserBook(studentNum);
        List<Books> books = userService.queryBookByBookName(bookName);
        PageInfo pageInfo = new PageInfo(books,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",books);
        return "user/borrowBook";
    }

}
