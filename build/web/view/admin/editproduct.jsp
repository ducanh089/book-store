<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value = "/view/client/assets" var="url"/>
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
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Sửa sản phẩm</div>
                        <hr>
                        <form action="${pageContext.request.contextPath}/admin/product/edit" method="POST" enctype='multipart/form-data'>

                            <div class="form-group">
                                <label for="input-1">Mã sản phẩm</label>
                                <input type="text" class="form-control" readonly="readonly" id="input-1" placeholder="Mã sản phẩm" name="product-sku" value="${product.id}">
                            </div>

                            <div class="form-group">
                                <label for="input-1">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="input-1" placeholder="Tên sản phẩm" name="product-name" value="${product.name}">
                            </div>

                            <div class="form-group">
                                <label for="input-2">Chuyên mục</label>
                                <div>
                                    <select class="form-control valid" id="input-6" name="product-cate" aria-invalid="false">
                                        <c:forEach items="${catelist}" var="cate">
                                            <c:if test="${cate.id == product.catalog_id}">
                                                <option value="${cate.id}" selected="selected">${cate.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-1">Ngày</label> 
                                <input type="date" class="form-control" id="input-1" placeholder="Ngày đăng" name="product-day" value="${product.created}">
                            </div>
                            <div class="form-group">
                                <label for="input-1">Giá</label>
                                <input type="text" class="form-control" id="input-1" placeholder="Giá" name="product-price" value="${product.price}">
                            </div> 

                            <div class="form-group">
                                <label for="input-2">Trạng thái</label>
                                <div>
                                    <select class="form-control valid" id="input-6" name="product-status" required aria-invalid="false">
                                        <option value="1">Còn hàng</option>
                                        <option value="0" >Hết hàng</option>
                                        <c:choose>
                                            <c:when test="${product.inventory != 0}">
                                                <option value="1" selected="selected">Còn hàng</option>
                                                <option value="0" >Hết hàng</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1" >Còn hàng</option>
                                                <option value="0" selected="selected">Hết hàng</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-1">Đã bán</label>
                                <input type="text" class="form-control" readonly="readonly" id="input-1" placeholder="Sản phẩm" name="product-sold" value="${product.sold}">
                            </div>
                            <div class="form-group">
                                <label for="input-1">Tồn kho</label>
                                <input type="text" class="form-control" readonly="readonly" id="input-1" placeholder="Sản phẩm" name="product-inventory" value="${product.inventory}">
                            </div>
                            <div class="form-group">
                                <label for="input-2">Giảm giá</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Giảm ... %" name="product-discount" value="${product.discount}">
                                    <div class="input-group-append">
                                        <button class="btn btn-light" type="button">%</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-2" class="col-form-label">Mô tả</label>
                                <div>
                                    <textarea class="form-control" rows="4" id="input-17" name="product-desc">${product.description}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input-2" class="col-form-label">Nội dung</label>
                                <div>
                                    <textarea style="display: none" class="form-control" id="content-product" name="product-content">${product.content}</textarea>
                                    <textarea class="form-control" rows="4" id="editor"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Hình ảnh sản phẩm</label>
                                <div class="aa-product-img-avatar">
                                    <img id="image" src="${pageContext.request.contextPath}/view/client/assets/images/products/img-test/${product.image_link}" alt="Ảnh đại diện">
                                    <input type="file" id="image-upload" placeholder="Tên hình" name="product-image" onchange="preview()">
                                    <label for="image-upload">
                                        <p id="btn-choose-image">Chọn ảnh</p>
                                    </label>
                                </div>                              
                            </div>
                            <script>
                                CKEDITOR.replace("editor");
                                CKEDITOR.instances.editor.setData(document.getElementById("content-product").value);
                            </script>
                            <div class="form-footer">
                                <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/product/list">Hủy</a></button>
                                <button type="submit" class="btn btn-success">Cập nhật</button>
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
            document.getElementById("content-product").value = content;
        });

    }
</script>
<jsp:include page = "./footer/footer.jsp" flush = "true" />