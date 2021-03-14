package com.kuang.service.impl;

import com.kuang.dao.UserMapper;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    public UserMapper userMapper;

    public User loginUser(User user) {
        return userMapper.loginUser(user);
    }

    @Override
    public User registerUser(User user) {
        return userMapper.registerUser(user);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public List<User> queryUserByName(String username) {
        return userMapper.queryUserByName(username);
    }

    @Override
    public Books queryBookById(int id) {
        return userMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return userMapper.queryAllBook();
    }

    @Override
    public List<Books> queryBookByName(String bookName) {
        return userMapper.queryBookByName(bookName);
    }

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public String queryNumByName(String username) {
        return userMapper.queryNumByName(username);
    }

    @Override
    public List<String>  queryUserBook(String studentNum) {
        return userMapper.queryUserBook(studentNum);
    }

    @Override
    public List<Books> queryBookByBookName(List<String> bookName) {
        return userMapper.queryBookByBookName(bookName);
    }

}
