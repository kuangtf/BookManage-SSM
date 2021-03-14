package com.kuang.service.impl;

import com.kuang.dao.BorrowBookMapper;
import com.kuang.pojo.Books;
import com.kuang.pojo.BorrowBook;
import com.kuang.service.BorrowBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ktf-cool@github.com
 * @date 2020/11/9 15:15
 */
@Service
public class BorrowBookServiceImpl implements BorrowBookService {

    @Autowired
    private BorrowBookMapper borrowBookMapper;

    @Override
    public void borrowBook(BorrowBook borrowBook) {
         borrowBookMapper.borrowBook(borrowBook);
    }

    @Override
    public void returnBook(BorrowBook borrowBook) {
         borrowBookMapper.returnBook(borrowBook);
    }
}
