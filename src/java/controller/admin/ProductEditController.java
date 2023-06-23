package controller.admin;

import controller.UserEditProfileController;
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

import model.Catalog;
import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.CategoryService;
import service.FileService;
import service.ProductService;
import service.impl.CategoryServicesImpl;
import service.impl.FileServicesImpl;
import service.impl.ProductServiceImpl;

public class ProductEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ProductService productService = new ProductServiceImpl();
    FileService fileService = new FileServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryService cateService = new CategoryServicesImpl();
        List<Catalog> cateList = cateService.getAll();
        req.setAttribute("catelist", cateList);
        String id = req.getParameter("id");
        Product product = productService.get(Integer.parseInt(id));
        req.setAttribute("product", product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/editproduct.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String avatarProduct = "";
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
                    File path = new File(root + "/view/client/assets/images/products/img-test");
                    if (!path.exists()) {
                        boolean status = path.mkdirs();
                    }
                    avatarProduct = item.getName();
                    File fileSaved = fileService.uploadFile(item, path.getAbsolutePath());
                    File real = new File(root + "../../web/view/client/assets/images/products/img-test/" + avatarProduct);
                    fileService.copyFile(fileSaved, real);
                } else {
                    fields.put(item.getFieldName(), item.getString("UTF-8"));
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(UserEditProfileController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UserEditProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Product product = new Product();
        product.setId(fields.get("product-sku"));
        product.setCatalog_id(fields.get("product-cate"));
        product.setName(fields.get("product-name"));
        product.setPrice(fields.get("product-price"));
        product.setStatus(fields.get("product-status"));
        product.setDescription(fields.get("product-desc"));
        product.setContent(fields.get("product-content"));
        product.setDiscount(fields.get("product-discount"));
        product.setCreated(fields.get("product-day"));
        product.setSold(Long.parseLong(fields.get("product-sold")));
        product.setInventory(Integer.parseInt(fields.get("product-inventory")));
        if (!avatarProduct.equals("")) {
            product.setImage_link(avatarProduct);
        }
        productService.edit(product);
        resp.sendRedirect(req.getContextPath() + "/admin/product/list");
    }
}
