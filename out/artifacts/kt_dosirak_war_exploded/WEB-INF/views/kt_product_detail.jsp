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
<c:set var="isAdmin" value="${pageContext.request.getSession(false)!=null ? pageContext.request.session.getAttribute('id') : ''}"/>


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
                <div class="cart_wrap">
                    <div class="detailWrap">
                        <div class="product_header">
                            상품 소개
                        </div>
                        <div class="product_subtitle">
                            간편하게 선택하고, 칼로리를 계산해 보세요
                        </div>
                        <div>
                            <input type="hidden" value="${mode=isAdmin}">
                            ${mode=='admin' ? "<input type='button' class='detail_btn' id='removeBtn' value='삭제'>" : ''}
                            <a href="<c:url value="/chest/modify?product_id="/>${productDto.product_id}">${mode=='admin' ? "<input type='button' id='modifyBtn' class='detail_btn' value='수정'>" : ''}</a>
                        </div>
                            <div class="detail_innerWrap">
                                <ul>
                                    <form id="form" class="frm" action="" method="post">
                                    <li>${productDto.product_desc}</li>
                                    <li>상품명: ${productDto.product_name}</li>
                                    <li>가격: <span id="indi_price">${productDto.product_price} 원</span></li>
                                    <li>칼로리: ${productDto.product_calories} kcal</li>
                                    <li>수량: <input type="number" id="amount" class="detail_amount" value="1" name="product_cnt" min="1"> </li>
                                    </form>
                                </ul>
                                <div>
                                    <button name="cart_btn" id="cart_btn" class="detail_cart_css">장바구니 담기</button>


                                    <button id="cart_order_btn" class="detail_btn_css">구매하기</button>

                                </div>
                            </div>
                    </div>
                </div>
           </div>
    </div>
    <script type="text/javascript">

        var money;
        var money2;
        // 상품 금액 통화 콤마 정규화
        money = $('#indi_price').text();
        money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#indi_price').text(money2);


        $(document).ready(function() {
            $('#cart_btn').on("click", function () {
                let product_cnt = $("#amount").val();
                let form1 = {
                    "cart_user_id" : "${loginId}",
                    "cart_product_id" : "${productDto.product_id}",
                    "cart_amount" : product_cnt
                }
                $.ajax({
                    url: "/cart/add",
                    type: "post",
                    data: form1,
                    success: function (result) {
                        cartAlert(result);
                    },
                    error: function () {
                        alert("에러");
                    }
                });
            });

            $('#cart_order_btn').on("click", function () {
                let product_cnt = $("#amount").val();
                let form1 = {
                    "cart_user_id" : "${loginId}",
                    "cart_product_id" : "${productDto.product_id}",
                    "cart_amount" : product_cnt
                }
                $.ajax({
                    url: "/cart/add",
                    type: "post",
                    data: form1,
                    success: function () {
                        location.href="/cart/add";
                    },
                    error: function () {
                        alert("에러");
                    }
                });
            });
        });

        function cartAlert(result){
        if(result == '0'){
            alert("장바구니에 추가에 실패하였습니다.");
        } else if(result == '1'){
            alert("장바구니에 추가되었습니다.");
        } else if(result == '2'){
            alert("장바구니에 같은 상품이 존재합니다.");
        } else if(result == '5'){
            alert("로그인이 필요합니다.");
        }
    }


        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/chest/remove?product_id='/>${productDto.product_id}");
            form.attr("method", "post");
            form.submit();
        });
    </script>
</body>
</html>