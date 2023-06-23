package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import model.Admin;
import model.Catalog;
import service.AdminService;
import service.impl.AdminServicesImpl;

/**
 * Servlet implementation class CategoryListController
 */
public class AdminListController extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    AdminService adminService = new AdminServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String indexPage = req.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
//        String department = (String) req.getSession().getAttribute("department_id");
        int index = Integer.parseInt(indexPage);
        int sumProducts;
        List<Admin> adminList;
        sumProducts = adminService.getToltal();
        adminList = adminService.paging(index);
        req.setAttribute("adminlist", adminList);
        int maxPage = sumProducts / 12;
        if (sumProducts % 12 != 0) {
            maxPage++;
        }
        int endPage;
        if (maxPage > 7) {
            endPage = 7;
        } else {
            endPage = maxPage;
        }
        int beginPage = 1;
        int midPage = (endPage + beginPage) / 2;
        int sumPage = 0;
        if (index > midPage) {
            sumPage = index - midPage;
        }
        int check = endPage + sumPage;
        if (check <= maxPage) {
            beginPage = beginPage + sumPage;
            endPage = endPage + sumPage;
        } else {
            beginPage = maxPage - (endPage - 1);
            endPage = maxPage;
        }
        System.out.println(adminList);
        req.setAttribute("beginP", beginPage);
        req.setAttribute("endP", endPage);
        req.setAttribute("maxP", endPage);
        req.setAttribute("tag", index);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/admin.jsp");
        dispatcher.forward(req, resp);
    }
}
