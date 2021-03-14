package com.kuang.service.impl;

import com.kuang.dao.BookMapper;
import com.kuang.pojo.Books;
import com.kuang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    //service调用dao
    @Autowired
    private BookMapper bookMapper;


    @Override
    public int Overage(Book book) {
        return bookMapper.Overage(book);
    }
}
