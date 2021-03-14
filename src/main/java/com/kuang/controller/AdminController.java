package com.kuang.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kuang.pojo.Admin;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.service.AdminService;
import com.kuang.service.UserService;
import com.kuang.utils.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    static String name;

    static String username;

    /**
     * 跳转登录页面
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "admin/login";
    }

    /**
     * 管理员登录
     */
    @RequestMapping("/loginAdmin")
    public String loginUser(Admin admin, HttpServletRequest request) {
        name = request.getParameter("name");
        Admin adminFinded = adminService.loginAdmin(admin);
        System.err.println(adminFinded);
        if (adminFinded == null) {
            request.setAttribute("msg", "用户名或密码有误，请重新输入。");
            return "admin/login";
        } else {
            request.getSession().setAttribute("user", adminFinded);
            request.setAttribute("msg", "登录成功。");
            return "admin/admin";
        }
    }

    /**
     * 查询当前管理员
     */
    @RequestMapping("/admin")
    public String listAdmin(Model model){
        List<Admin> list = adminService.queryAdminByName(name);
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",list);
        return "admin/admin";
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
     * 跳转更新页面  并回显页面信息
     */
    @RequestMapping("/toUpdateAdmin")
    public String toUpdateUser(String id,Model model){
        List<Admin> admin = adminService.queryAdminByName(name);
        System.err.println("toUpdateUser=>" + admin);
        model.addAttribute("QAdmin",admin);
        return "admin/updateAdmin";
    }

    /**
     * 更新管理员信息
     */
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Admin admin){
        adminService.updateAdmin(admin);
        return "redirect:/admin/admin";//重定向查询请求中
    }

// ==================  对学生的操作   ===================================

    /**
     * 查询全部的用户，并返回到一个用户展示页面（无分页查询）
     */
    @RequestMapping("/allUser")
    public String listUser(Model model){
        List<User> list = adminService.queryAllUser();
        model.addAttribute("list",list);
        return "admin/allUser";
    }

    /**
     * 跳转更新页面  并回显页面信息
     */
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(int id,Model model){
        User user = adminService.queryUserById(id);
        System.err.println("toUpdateUser=>" + user);
        model.addAttribute("QUser",user);
        return "admin/updateUser";
    }

    /**
     * 更新学生信息
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        adminService.updateUser(user);
        return "redirect:/admin/allUser";//重定向查询请求中
    }

    /**
     * 删除学生信息
     */
    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int id){
        adminService.deleteUserById(id);
        return "redirect:/admin/allUser";//重定向查询请求中
    }

    /**
     * 根据学生名 --> 条件查询学生信息
     */
    @RequestMapping("/queryUser")
    public String queryUser(String queryUserName,Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        List<User> user = adminService.queryUserByName("%"+queryUserName+"%");
        System.err.println("queryUser=>"+user);

        if (user == null){
            return "redirect:/user/allUser";
        }
        PageHelper.startPage(pn,5);
        PageInfo pageInfo = new PageInfo(user,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",user);
        return "admin/allUser";
    }

    /**
     * 查询书籍数据（包含分页）
     */
    @RequestMapping("/allUsers")
    public String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn , Model model){
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<User> list = adminService.queryAllUser();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/allUser";
    }

// =========================== 对书籍的操作  =====================================
    /**
     * 查询全部的书籍，并返回到一个书籍展示页面（无分页查询）
     */
    @RequestMapping("/allBook")
    public String listBook(Model model){
        List<Books> list = adminService.queryAllBook();
        model.addAttribute("list",list);
        return "admin/allBookAdmin";
    }

    /**
     * 跳转添加图书页面
     */
    @RequestMapping("/toAddBook")
    public String toAddPageBook(){
        return "admin/addBook";
    }

    /**
     * 添加图书信息
     */
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println("addBook=>" +books);
        adminService.addBook(books);
        return "admin/allBookAdmin";//重定向查询请求中
    }

    /**
     * 跳转更新页面  并回显页面信息
     */
    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(int id,Model model){
        Books books = adminService.queryBookById(id);
        System.err.println("toUpdateBook=>" + books);
        model.addAttribute("QBook",books);
        return "admin/updateBook";
    }

    /**
     * 更新图书信息
     */
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        adminService.updateBook(books);
        return "admin/allBookAdmin";
    }

    /**
     * 删除图书信息
     */
    //@RequestMapping("/deleteBook/{bookId}")  @PathVariable("bookId")
    @RequestMapping("/deleteBook")
    public String deleteBook(int id){
        adminService.deleteBookById(id);
        return "/admin/allBookAdmin";
    }

    /**
     * 查询书籍数据（包含分页）
     */
    @RequestMapping("/allBooks")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1") Integer pn , Model model){
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Books> list = adminService.queryAllBook();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(list,3);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/allBookAdmin";
    }

    /**
     * 根据图书名 --> 条件查询图书
     */
    @RequestMapping("/queryBook")
    public String queryBook(String queryBookName,Model model,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        List<Books> books = adminService.queryBookByName("%"+queryBookName+"%");
        System.err.println("queryBook=>"+books);

        if (books == null){
            return "redirect:/admin/allBookAdmin";
        }
        PageHelper.startPage(pn,5);
        PageInfo pageInfo = new PageInfo(books,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",books);
        return "admin/allBookAdmin";
    }

    /**
     * 跳转添加学生页面
     */
    @RequestMapping("/toAddUser")
    public String toAddPageUser(){
        return "user/register";
    }

    /**
     * 添加学生信息
     */
    @RequestMapping("/addUser")
    public String addUser(User user){
        System.out.println("addUser=>" +user);
        adminService.addUser(user);
        return "redirect:/user/allUser";//重定向查询请求中
    }

    /**
     * 查询用户已借的图书
     */
    @RequestMapping("/userBook")
    public String queryUserBook(Model model, HttpServletRequest request) {
        username = request.getParameter("username");
        String studentNum = userService.queryNumByName(username);
        List<String>  bookName = userService.queryUserBook(studentNum);
        List<Books> books = userService.queryBookByBookName(bookName);
        PageInfo pageInfo = new PageInfo(books,3);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("list",books);
        return "user/borrowBook";
    }






}
