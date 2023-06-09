package com.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.sql.SqlInjectionUtils;
import com.entity.Book;
import com.exception.SelfExcept;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ansi.AnsiOutput;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RestController
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    StringRedisTemplate stringRedisTemplate;

    private final static ObjectMapper om = new ObjectMapper();

//    @ResponseBody

    /**
     * 从redis中读取mysqlbook表的缓存，后续判断更新及删除操作时redis库的数据操作
     *
     * @param searchName
     * @param BookpageNo
     * @return
     */
    @CrossOrigin
    @GetMapping("/book")
    private List<Book> index(String searchName, Integer BookpageNo) {
        ListOperations<String, String> redisList = stringRedisTemplate.opsForList();
        List<Book> all = null;

        if (BookpageNo == null) {
            BookpageNo = 1;
        }

        try {
            if (StringUtils.isEmpty(searchName)) {
                searchName = "";
            } else {
                List<String> list = redisList.range("books", 0, -1);
                ArrayList<Book> books = new ArrayList<>();
                if (list.size()!=0 && list != null) {
                    String finalSearchName = searchName;
                    list.stream().forEach(li -> {
                        Book book = null;
                        try {
                            book = om.readValue(li, Book.class);
                            if (book.getBookName().equals(finalSearchName)){
                                books.add(book);
                            }
                        } catch (JsonProcessingException e) {
                            throw new RuntimeException(e);
                        }
                    });
                    return books;
                }
            }
//                session.setAttribute("BookpageNo", BookpageNo);
//            页数所计算的页面显示条数，limit bookNumber，5
            int bookNumber = (BookpageNo - 1) * 5;

            List<String> list = redisList.range("books", 0, -1);
            ArrayList<Book> books = new ArrayList<>();
            if (list.stream().count() != 0) {
                list.stream().forEach(li -> {
                    Book book = null;
                    try {
                        book = om.readValue(li, Book.class);
                        books.add(book);
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                });
                all = books;
            } else {
                all = bookService.getAll(searchName, bookNumber);
                ArrayList<String> redisBooks = new ArrayList<>();
                all.stream().forEach(a -> {
                    try {
                        String s = om.writeValueAsString(a);
                        redisBooks.add(s);
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                });
                redisList.leftPushAll("books", redisBooks);
            }

//            数据库数据总数量
            long count = bookService.getCount(searchName);
            long pagecount = (count + 4) / 5;
//            session.setAttribute("Bookpagecount", pagecount);


            return all;
        } catch (Exception e) {
            throw new SelfExcept("bookController的index出现的问题" + e);
        }
    }


    @ResponseBody
    @GetMapping("/lookup")
    private Book lookUp(Integer bookId) {
        Book book = bookService.getById(bookId);
        return book;
    }

    @ResponseBody
    @GetMapping("/selectBySeries")
    private List<Book> selectBySeries(String seriesName) {
        List<Book> bookList = bookService.selectBySeries(seriesName);
        System.out.println(bookList);
        return bookList;
    }

//    @CrossOrigin
//    @ResponseBody
//    @GetMapping("/lookup/byType")
//    private List<Book> typeLookUp(String bookType) {
//        try {
////            List<Book> byType = bookService.getByType(bookType);
////            return byType;
//        } catch (Exception e) {
//            throw new SelfExcept("bookController的typelookup出现的问题");
//        }
//    }


    @PostMapping("/book")
    public ResponseEntity<String> addBook(@RequestBody Book book) {
        try {
            stringRedisTemplate.delete("books");
            boolean addBook = bookService.addBook(book);
            if (addBook) {
                return ResponseEntity.ok("添加成功");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("添加失败");
            }
        } catch (Exception e) {
            System.out.println(e);
            throw new SelfExcept("bookController的add出现的问题" + e);
        }
    }

    @DeleteMapping("/book")
    public ResponseEntity<String> deleteBook(Integer bookId) {
        try {
            stringRedisTemplate.delete("books");
            //            删除前检查购物车
//            Long aLong = bookService.checkBagData(bookId);
//            if (aLong > 0) {
//                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("删除失败,改图书被某些用户加入购物车!");
//            } else {
            boolean deleteBook = bookService.deleteBook(bookId);
            if (deleteBook) {
                return ResponseEntity.ok("删除成功");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("删除失败");
            }
//            }
        } catch (Exception e) {
            throw new SelfExcept("bookController的delete出现的问题"+e);
        } finally {
//            GetDriver.closeresource(getconnection, null);
        }
    }


    @PutMapping("/book")
    public ResponseEntity<String> updateBook(@RequestBody Book book) {
        try {
            stringRedisTemplate.delete("books");
            boolean alterBook = bookService.updateBook(book);
            if (alterBook) {
//                添加书籍封面时是否可以返回一个url通过路由进行编程式跳转或者刷新
                return ResponseEntity.ok("修改成功");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("修改失败");
            }
        } catch (Exception e) {
            System.out.println(e);
            throw new SelfExcept("bookController的update出现的问题");
        }
    }


//    @GetMapping("/book/update")
//    public String alterBook(HttpServletRequest req, Integer BookId) {
//        try {
//            Book byId = bookService.getById(BookId);
//            return "book/alterBook";
//        } catch (Exception e) {
//            throw new SelfExcept("bookController的alter出现的问题");
//        }
//    }

    //    bookNo, bookName, bookAuthor, bookPicture, bookFactory, bookPrice, bookSeriesName,bookAddDate)


//    使用vue进行管理用户登陆之后就不需要专门的退出方法了
//    public String loginOutPage() {
//        return "loginOut:book.do";
//    }


    //    使用了element导航后是否还需要单独设置一个首页
//    @GetMapping("/admin/index")
//    public String adminIndex(HttpServletRequest req, String searchName, String oper, Integer AdminBookpageNo) {
//        Connection getconnection = null;
//        HttpSession session = req.getSession();
//        if (AdminBookpageNo == null) {
//            AdminBookpageNo = 1;
//        }
//
//        try {
//            if (StringEmpty.isNotEmpty(oper) && oper.equals("getByName")) {
//                if (StringEmpty.isEmpty(searchName)) {
//                    searchName = "";
//                }
//                session.setAttribute("BookAdminkeyword", searchName);
//            } else {
//                String keyword = (String) session.getAttribute("BookAdminkeyword");
//                if (StringEmpty.isNotEmpty(keyword)) {
//                    searchName = keyword;
//                } else {
//                    searchName = "";
//                }
//                session.setAttribute("AdminBookpageNo", AdminBookpageNo);
//            }
//            getconnection = ConnectionUtil.getConn();
//            List<Book> all = book.getAll(getconnection, searchName, AdminBookpageNo);
//            session.setAttribute("list", all);
//
//            long count = book.getCount(getconnection, searchName);
//            long pagecount = (count + 4) / 5;
//            System.out.println(pagecount);
//            session.setAttribute("AdminBookpagecount", pagecount);
//
//            return "book/manageBook";
//
//        } catch (Exception e) {
//            throw new SelfExcept("bookController的adminIndex出现的问题");
//        } finally {
////            GetDriver.closeresource(getconnection, null);
//        }
//    }

}
