package com.kuang.test;

import com.kuang.dao.BookMapper;
import com.kuang.dao.UserMapper;
import com.kuang.pojo.Books;
import com.kuang.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    /*
        问题： bean不存在

        排错步骤：
        1.查看bean注入是否成功，
        2.Junit单元测试，看看自己的代码是否能够查询出数据
        3.问题一定不是我们的底层，是spring出现了问题。
        4.SpringMVC,整合的时候没调用到我们的service层的bean。
            1.application.xml中没有注入bean
            2.web.xml中，我们也绑定过配置文件，发现问题所在：就是我们配置的是spring-mvc.xml，确实没有service  bean，所以空指针。
     */
    @Autowired
    BookMapper bookMapper;

    @Autowired
    UserMapper userMapper;

    @Test
    public void test1() {

        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl = (UserService) context.getBean("userServiceImpl");
        for (Books books : userServiceImpl.queryAllBook()) {
            System.out.println(books);
        }
    }
}