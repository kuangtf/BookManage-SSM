package com.kuang.service;

import com.kuang.pojo.Admin;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AdminService {

    // 管理员登录
    Admin loginAdmin(Admin admin);

    // 管理员信息
    List<Admin> queryAdminByName(@Param("name") String name);

    //查询一个管理员
    Admin queryAdminById(@Param("id") int id);

    //修改一个管理员
    void updateAdmin(Admin admin);

    //添加学生
    void addUser(User user);

    //删除学生
    void deleteUserById(@Param("id") int id);

    //修改一个学生
    void updateUser(User user);

    //查询一个学生
    User queryUserById(@Param("id") int id);

    //查询全部的学生
    List<User> queryAllUser();

    //根据学生名查询信息
    List<User> queryUserByName(@Param("username") String username);

    //添加一本书
    void addBook(Books books);

    //删除一本书
    void deleteBookById(@Param("bookId") int id);

    //修改一本书
    void updateBook(Books books);

    //查询一本书
    Books queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Books> queryAllBook();

    //根据图书名查询信息
    List<Books> queryBookByName(@Param("bookName") String bookName);
}
