<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("admin-username") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<!-- Start header section -->
<jsp:include page = "./header/header.jsp" flush = "true" />
<div class="content-wrapper">
    <div class="container-fluid">

        <div class="row mt-3">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Chuyên mục: Sửa Admin</div>
                        <hr>
                        <form action="${pageContext.request.contextPath}/admin/admin/edit" method="post"> 
                            <div class="form-group">
                                <label for="input-1">ID</label>
                                <input type="text" class="form-control" readonly id="input-1" placeholder="Admin ID" name="id" value="${admin.id}">
                            </div>
                            <div class="form-group">
                                <label for="input-1">Username</label>
                                <input type="text" class="form-control" id="input-1" placeholder="Username" name="username"  pattern="^admin_[a-zA-Z0-9]{1,}$" 
                                       title="Tên đăng nhập bắt đầu bằng admin_ và không chứa ký tự đặc biệt" value="${admin.username}" required>
                            </div>
                            <div class="form-group">
                                <label for="input-1">Password</label>
                                <input type="password" class="form-control" id="myinput" placeholder="Mật khẩu" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[(?=.*[!@#$%^&*_])(?=.*[A-Z]).{8,}" 
                                       title="Phải chứa ít nhất một số và một chữ hoa và chữ thường, một ký tự đặc biệt và ít nhất 8 ký tự trở lên" value="${admin.password}" required>
                                <input type="checkbox" onclick="myFunction1()">Hiển thị mật khẩu
                                <script>
                                    function myFunction1() {
                                        var x = document.getElementById("myinput");
                                        if (x.type === "password") {
                                            x.type = "text";
                                        } else {
                                            x.type = "password";
                                        }
                                    }
                                </script> 
                            </div>
                            <div class="form-group">
                                <label for="input-1">Tên Admin</label>
                                <input type="text" class="form-control" id="input-1" placeholder="Tên Admin" name="name" pattern="^[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]{1,}$" title="Nhập đúng định dạng họ tên" value="${admin.name}" required>
                            </div>
                            <div class="form-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-times"></i> Hủy </button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Sửa </button>
                            </div> 

                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div class="overlay toggle-menu"></div>
    </div>
</div>

<jsp:include page = "./footer/footer.jsp" flush = "true" />