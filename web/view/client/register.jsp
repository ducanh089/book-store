<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>

<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/view/client/assets/images/archive-banner.png" alt="banner blog">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Đăng ký</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>                   
                    <li style="color:#fff">Đăng ký tài khoản</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">         
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-register">                 
                                <h4>Đăng ký</h4>
                                <form name="formRegister" class="aa-login-form" method="post" action="${pageContext.request.contextPath}/view/client/register" >
                                    <label for="">Họ tên<span>*</span></label>
                                    <input type="text" placeholder="FullName" name="name" 
                                           pattern="^[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+[a-zA-ZÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s]{1,}$" title="Nhập đúng định dạng họ tên" required autocomplete="off">   
                                    <label for="">Email <span>*</span></label>
                                    <input type="text" placeholder="useremail@gmail.com" pattern="^[\w]{1,}[\w.+-]{0,}@[\w-]{2,}([.][a-zA-Z]{2,}|[.][\w-]{2,}[.][a-zA-Z]{2,})$" 
                                           title="Sai định dạng email" name="email" required autocomplete="off">
                                    <label for="">Số điện thoại<span>*</span></label>
                                    <input type="text" placeholder="Số điện thoại" pattern="^\d{10}$" title="Số điện thoại chỉ bao gồm 10 số" name="phone" required autocomplete="off">
                                    <label for="">Địa chỉ<span>*</span></label>
                                    <select id="address" name="address">
                                        <option value="hide" hidden>-- City --</option>
                                        <c:forEach items="${city}" var="i">
                                            <option value="${i.cityName}">${i.cityName}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="">Username<span>*</span></label>
                                    <input type="text" placeholder="Username" name="username" pattern="^[A-Za-z][A-Za-z0-9_]{7,}$" 
                                           title="Tên đăng nhập ít nhất 7 ký tự bắt đầu bằng chữ cái và không chứa ký tự đặc biệt" required autocomplete="off">
                                    <label for="">Mật khẩu<span>*</span></label>  
                                    <input type="password" placeholder="Password" name="password" 
                                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[(?=.*[!@#$%^&*_])(?=.*[A-Z]).{8,}" 
                                           title="Phải chứa ít nhất một số và một chữ hoa và chữ thường, một ký tự đặc biệt và ít nhất 8 ký tự trở lên"
                                           required autocomplete="off">     
                                    <input type="date" style="display: none" placeholder="create" name="created" id="the-date">        

                                    <p style="color:red; display: block;"><%=(request.getAttribute("errMessage") == null) ? ""
                                                : request.getAttribute("errMessage")%></p>
                                    <p style="color:red; display: block;"><%=(request.getAttribute("Message") == null) ? ""
                                                : request.getAttribute("Message")%></p>      
                                    <button type="reset" class="aa-browse-btn" value="Reset">Đặt lại</button>  
                                    <button type="submit" class="aa-browse-btn">Đăng ký</button>                         
                                </form>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<!--  end content-->
<script>
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;

    var today = year + "-" + month + "-" + day;


    document.getElementById('the-date').value = today;
</script>
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->


