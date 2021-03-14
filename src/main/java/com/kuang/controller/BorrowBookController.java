package com.kuang.controller;

import com.kuang.pojo.BorrowBook;
import com.kuang.pojo.User;
import com.kuang.service.BorrowBookService;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


/**
 * @author ktf-cool@github.com
 * @date 2020/11/9 15:17
 */
@Controller
@RequestMapping("/borrowBook")
public class BorrowBookController {

    @Autowired
    private BorrowBookService borrowBookService;

    @Autowired
    private UserService userService;

    @RequestMapping("/borrow")
    public String Borrow(String bookName){

        String studentNum = userService.queryNumByName(UserController.username);
        BorrowBook borrowBook = new BorrowBook(studentNum, bookName);
        borrowBookService.borrowBook(borrowBook);
        return "borrow/success";
    }

    @RequestMapping("/return")
    public String Return(String bookName){
        String studentNum = userService.queryNumByName(UserController.username);
        BorrowBook borrowBook = new BorrowBook(studentNum, bookName);
        borrowBookService.returnBook(borrowBook);
        return "borrow/success";
    }

}
