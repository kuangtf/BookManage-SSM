package com.kuang.dao;

import com.kuang.pojo.BorrowBook;
import org.springframework.stereotype.Repository;

/**
 * @author ktf-cool@github.com
 * @date 2020/11/9 15:11
 */
@Repository
public interface BorrowBookMapper {

    /**
     * 添加借阅信息
     */
    void borrowBook(BorrowBook borrowBook);

    /**
     * 归还图书
     */
    void returnBook(BorrowBook borrowBook);
}
