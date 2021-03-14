package com.kuang.dao;

import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    // 学生登录
    User loginUser(User user);

    // 学生注册
    User registerUser(User user);

    //修改一个学生
    void updateUser(User user);

    //查询学生自己的信息
    List<User> queryUserByName(@Param("username") String username);

    //查询一本书
    Books queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Books> queryAllBook();

    //根据图书名查询信息
    List<Books> queryBookByName(@Param("bookName") String bookName);

    // 根据用户id查询信息
    User queryUserById(int id);

    // 查询学生一个信息
    String queryNumByName(@Param("username") String username);

    // 查询学生已借阅的图书名称
    List<String> queryUserBook(@Param("studentNum") String studentNum);

    // 根据学生查阅的图书名称得到书籍的全部信息
    List<Books> queryBookByBookName(@Param("bookName") List<String> bookName);


}
