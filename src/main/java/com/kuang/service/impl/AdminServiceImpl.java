package com.kuang.service.impl;

import com.kuang.dao.AdminMapper;
import com.kuang.dao.UserMapper;
import com.kuang.pojo.Admin;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.service.AdminService;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin loginAdmin(Admin admin) {
        return adminMapper.loginAdmin(admin);
    }

    @Override
    public List<Admin> queryAdminByName(String name) {
        return adminMapper.queryAdminByName(name);
    }

    @Override
    public Admin queryAdminById(int id) {
        return adminMapper.queryAdminById(id);
    }

    @Override
    public void updateAdmin(Admin admin) {
        adminMapper.updateAdmin(admin);
    }

    @Override
    public void addUser(User user) {
        adminMapper.addUser(user);
    }

    @Override
    public void deleteUserById(int id) {
        adminMapper.deleteUserById(id);
    }

    @Override
    public void updateUser(User user) {
        adminMapper.updateUser(user);
    }

    @Override
    public User queryUserById(int id) {
        return adminMapper.queryUserById(id);
    }

    @Override
    public List<User> queryAllUser() {
        return adminMapper.queryAllUser();
    }

    @Override
    public List<User> queryUserByName(String username) {
        return adminMapper.queryUserByName(username);
    }

    @Override
    public void addBook(Books books) {
        adminMapper.addBook(books);
    }

    @Override
    public void deleteBookById(int id) {
        adminMapper.deleteBookById(id);
    }

    @Override
    public void updateBook(Books books) {
        adminMapper.updateBook(books);
    }

    @Override
    public Books queryBookById(int id) {
        return adminMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return adminMapper.queryAllBook();
    }

    @Override
    public List<Books> queryBookByName(String bookName) {
        return adminMapper.queryBookByName(bookName);
    }
}
