package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;

import model.Boardnew;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.AdminService;
import service.BoardnewService;
import service.FileService;
import service.impl.AdminServicesImpl;
import service.impl.BoardnewServicesImpl;
import service.impl.FileServicesImpl;

public class BoardnewEditController extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    BoardnewService boardnewService = new BoardnewServicesImpl();
    AdminService adminService = new AdminServicesImpl();
    FileService fileService = new FileServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Boardnew boardnew = boardnewService.get(Integer.parseInt(id));
        List<Admin> admins = adminService.getAll();
        req.setAttribute("boardnew", boardnew);
        req.setAttribute("admins", admins);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/editboardnew.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String avatarNews = "";
        HashMap<String, String> fields = new HashMap<>();
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(req);
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();
                System.out.println("Item : " + item);
                if (!item.isFormField()) {
                    String root = getServletContext().getRealPath("/");
                    File path = new File(root + "/view/client/assets/images/news");
                    if (!path.exists()) {
                        boolean status = path.mkdirs();
                    }
                    avatarNews = item.getName();
                    File fileSaved = fileService.uploadFile(item, path.getAbsolutePath());
                    File real = new File(root + "../../web/view/client/assets/images/news/" + avatarNews);
                    fileService.copyFile(fileSaved, real);
                } else {
                    fields.put(item.getFieldName(), item.getString("UTF-8"));
                }
            }
        } catch (FileUploadException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        Boardnew boardnew = new Boardnew();
        boardnew.setId(fields.get("new-id"));
        boardnew.setTitle(fields.get("new-title"));
        boardnew.setContent(fields.get("new-content"));
        boardnew.setAuthor(String.valueOf(adminService.get(fields.get("new-author")).getId()));
        boardnew.setCreated(fields.get("new-created"));
        if(!avatarNews.equals("")){
            boardnew.setImage_link(avatarNews);
        }
        boardnewService.edit(boardnew);
        resp.sendRedirect(req.getContextPath() + "/admin/new/list");
    }
}
