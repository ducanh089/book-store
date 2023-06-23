/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import model.Boardnew;
import model.Ordered;
import model.Product;
import model.Transactions;
import model.User;
import service.BoardnewService;
import service.OrderedService;
import service.ProductService;
import service.TransactionService;
import service.UserService;
import service.impl.BoardnewServicesImpl;
import service.impl.OrderedServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.TransactionServicesImpl;
import service.impl.UserServicesImpl;

/**
 *
 * @author Admin
 */
public class Test {

    private static final long serialVersionUID = 1L;
    static TransactionService transactionService = new TransactionServicesImpl();
    static OrderedService catalogService = new OrderedServiceImpl();
    static ProductService productService = new ProductServiceImpl();
    static UserService userService = new UserServicesImpl();
    static BoardnewService boardnewService = new BoardnewServicesImpl();

    public static void main(String[] args) {
        Boardnew boardnew = new Boardnew();
        boardnew.setId("41");
        boardnew.setTitle("Samsung tung video “nhá hàng” Galaxy S22 series, dòng s?n ph?m dáng mong d?i nh?t n?a d?u nam 2022");
        boardnew.setContent("Hạ giá");
        boardnew.setAuthor("1");
        boardnew.setCreated("2022-05-10");
        boardnew.setImage_link("2223137-768x480.jpeg");
        boardnewService.edit(boardnew);
    }
}
