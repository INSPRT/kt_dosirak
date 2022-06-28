<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="loginOut2" value="${loginId=='' ? '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' : pageContext.request.session.getAttribute('name')}"/>
<c:set var="loginOut3" value="${loginId=='' ? '' : '님.'}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <!-- Style -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/kt_style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
    <div class="wrap">
           <div class="wrapAuto">
                <div class="nav_headerWrap">
                    <div class="nav_header">
                        <ul>
                            <li>
                                <span>대한민국 No.1 다이어트 간편식</span>
                            </li>
                            <li>
                                <span>${loginOut2}${loginOut3}&nbsp;&nbsp;</span>
                                <a class="logout" href="<c:url value="${loginOutLink}"/>">${loginOut}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="nav_menuWrap">
                    <div class="nav_menu">
                        <div class="nav_left">
                            <ul>
                                <li><a href="/chest/itemlist">닭가슴살</a></li>
                                <li><a href="/dosirak/itemlist">도시락</a></li>
                                <li><a href="/beverage/itemlist">음료</a></li>
                                <li><a href="/mealkit/itemlist">밀키트</a></li>
                            </ul>
                        </div>
                        <div class="nav_center">
                            <ul class="nav_menu_ul_second">
                                <li class="nav_menu_ul_li_second"><a href="/">도시락 넘버원</a></li>
                            </ul>
                        </div>
                        <div class="nav_third">
                            <ul class="nav_menu_ul_third">
                                <li class="nav_menu_ul_li_third"><a href="#">위클리특가</a></li>
                                <li class="nav_menu_ul_li_third"><a href="#">신상품</a></li>
                            </ul>
                        </div>
                        <div class="nav_right">
                            <ul>
                                <li class="nav_menu_ul_li_last">
                                    <a href="/cart/cartlist"><div class="menu_img_cart">카트</div></a>
                                </li>
                                <li class="nav_menu_ul_li_last">
                                    <a href="<c:url value="/user/info"/>"><div class="menu_img_client">회원</div></a>
                                </li>
                                <li class="nav_menu_ul_li_last">
                                    <a href=""><div class="menu_img_noti">종종</div></a>
                                </li>
                                <li class="nav_menu_ul_li_last">
                                    <a href="#"><div class="menu_img_menu">메뉴</div></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modify_wrap">
                    <div class="product_header_modify">상품 수정</div>
                    <div class="product_subtitle_modify">간편하게 선택하고, 칼로리를 계산해 보세요</div>
                </div>
               <form id="form" action="" method="post">
<%--           <form action="<c:url value="/chest/modify"/>" method="post">--%>
                    <div class="tableWrap">
                        <table class="writeTable" cellspacing="20px" >
                            <tr>
                                <td align="center">고유번호</td>
                                <td><input type="text" name="product_id" readonly value="${productDto.product_id}"></td>
                            </tr>
                            <tr>
                                <td align="center">품명</td>
                                <td><input type="text" name="product_name" value="${productDto.product_name}"></td>
                            </tr>
                            <input type="hidden" name="product_category_id_fk" value="${productDto.product_category_id_fk}">

<%--                            <tr>--%>
<%--                                <td align="center">카테고리</td>--%>
<%--                                <td>--%>
<%--&lt;%&ndash;                                    <select name="product_category_id_fk" id="product_category_id_fk">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        ${productDto.product_category_id_fk=="001" ? "<option value='001'>-닭가슴살-</option>" : ''}&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        ${productDto.product_category_id_fk=="002" ? "<option value='002'>-도시락-</option>" : ''}&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        ${productDto.product_category_id_fk=="003" ? "<option value='003'>-음료-</option>" : ''}&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        ${productDto.product_category_id_fk=="004" ? "<option value='004'>-밀키트-</option>" : ''}&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="001">닭가슴살</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="002">도시락</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="003">음료</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="004">밀키트</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </select>&ndash;%&gt;--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td align="center">가격</td>
                                <td><input type="text" name="product_price" value="${productDto.product_price}"></td>
                            </tr>
                            <tr>
                                <td align="center">수량</td>
                                <td><input type="text" name="product_stock" value="${productDto.product_stock}"></td>
                            </tr>
                            <tr>
                                <td align="center">칼로리</td>
                                <td><input type="text" name="product_calories" value="${productDto.product_calories}"></td>
                            </tr>
                            <tr>
                                <td align="center">이미지</td>
                                <td><input type="text" name="product_desc" value=""></td>
                            </tr>
                        </table>
                        <div class="modify_imgWrap">
                            ${productDto.product_desc}
                        </div>
                        <input type="button" class="product_return_btn_modify" value="돌아가기">
                        <input type="button" id="modifyBtn" class="product_regi_btn_mofify" value="등록">
                    </div>
               </form>
                </div>
            </div>
<script>
    $(document).ready(function() {
        let formCheck = function () {
            let form = document.getElementById("form");
            if (form.product_name.value == "") {
                alert("상품명을 입력해 주세요.");
                form.product_name.focus();
                return false;
            }
            if (form.product_price.value == "") {
                alert("금액을 입력해 주세요.");
                form.product_price.focus();
                return false;
            }
            if (form.product_stock.value == "") {
                alert("수량을 입력해 주세요.");
                form.product_stock.focus();
                return false;
            }
            if (form.product_calories.value == "") {
                alert("칼로리를 입력해 주세요.");
                form.product_calories.focus();
                return false;
            }
            if (form.product_desc.value == "") {
                alert("이미지를 입력해 주세요.");
                form.product_desc.focus();
                return false;
            }
            return true;
        }

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/chest/modify'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });
    });
</script>
</body>
</html>