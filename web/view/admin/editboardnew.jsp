<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <div class="card-title">Sửa tin tức</div>
                        <hr>
                        <form action="${pageContext.request.contextPath}/admin/new/edit" method="post" enctype='multipart/form-data'>
                            <div class="form-group">
                                <label for="input-1">ID</label>
                                <input type="text" class="form-control" readonly id="input-1" placeholder="ID" value="${boardnew.id}" name="new-id">
                            </div>
                            <div class="form-group">
                                <label for="input-2">Tên tin tức</label>
                                <input type="text" class="form-control" id="input-2" placeholder="Tên tin tức" pattern="^.{1,}$" value="${boardnew.title}"name="new-title" required>
                            </div>
                            <div class="form-group">
                                <label for="input-3">Nội dung</label>
                                <textarea style="display: none" class="form-control" rows="4" id="content-boardnew" name="new-content">${boardnew.content}</textarea>
                                <textarea class="form-control" rows="4" id="editor"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="input-4">Người đăng</label>
                                <div>
                                    <c:forEach items="${admins}" var="admin">
                                        <c:if test="${admin.id == boardnew.author}">
                                            <input type="text" class="form-control" id="input-10" placeholder="Tác giả" value="${admin.username}" name="new-author" readonly>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-5">Ngày đăng</label>
                                <input type="date" class="form-control" id="input-5" value="${boardnew.created}" name="new-created" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label>Hình ảnh tin tức</label>
                                <div class="aa-product-img-avatar">
                                    <img id="image" src="${pageContext.request.contextPath}/view/client/assets/images/news/${boardnew.image_link}" alt="Ảnh đại diện">
                                    <input type="file" id="image-upload" placeholder="Tên hình" name="new-image_link" onchange="preview()">
                                    <label for="image-upload">
                                        <p id="btn-choose-image">Chọn ảnh</p>
                                    </label>
                                </div>                              
                            </div>
                            <script>
                                CKEDITOR.replace("editor");
                                CKEDITOR.instances.editor.setData(document.getElementById("content-boardnew").value);
                            </script>  
                            <div class="form-footer">
                                <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/product/list">Hủy</a></button>
                                <button class="btn btn-success">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay toggle-menu"></div>
    </div>
</div>
<script>
    function preview() {
        document.getElementById("image").src = URL.createObjectURL(event.target.files[0]);
    }
    
    for (var i in CKEDITOR.instances) {

        CKEDITOR.instances[i].on('change', function () {
            var content = CKEDITOR.instances.editor.getData();
            document.getElementById("content-boardnew").value = content;
        });

    }
</script>
<jsp:include page = "./footer/footer.jsp" flush = "true" />