package com.kuang.dao;

import org.springframework.stereotype.Repository;

import java.awt.print.Book;

@Repository
public interface BookMapper {

    // 图书的剩余数量
    int Overage(Book book);


}
