<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <div class="card-title">Thêm chuyên mục</div>
                        <hr>
                        <form action="${pageContext.request.contextPath}/admin/cate/add" method="post">

                            <div class="form-group">
                                <label for="input-1">Tên chuyên mục</label>
                                <input type="text" class="form-control" id="input-1" placeholder="Tên chuyên mục" pattern="^[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]{1,}$" title="Tên chuyên mục chỉ chứa kí tự chữ cái" name="cate-name" required>
                            </div>
                            <div class="form-group">
                                <label for="input-2">Chuyên mục cha</label>
                                <div>
                                    <select class="form-control valid" id="input-6" name="parent-id" required aria-invalid="false">
                                        <option value="0">NULL</option>
                                        <option value="1">Sản phẩm mới</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-footer">
                                <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i> Hủy</button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Thêm</button>
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