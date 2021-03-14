package com.kuang.service;

import com.kuang.pojo.Books;
import com.kuang.pojo.BorrowBook;
import org.apache.ibatis.annotations.Param;

/**
 * @author ktf-cool@github.com
 * @date 2020/11/9 15:15
 */
public interface BorrowBookService {

    /**
     * 添加借阅信息
     */
    void borrowBook(BorrowBook borrowBook);

    /**
     * 归还图书
     */
    void returnBook(BorrowBook borrowBook);
}
