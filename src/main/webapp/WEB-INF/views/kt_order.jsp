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
                <div class="cart_wrap">
                    <form id="form" action="<c:url value="/order/pay"/>" method="post">
                        <div class="cart_nav_left">
                            <div class="cart_nav_left_wrap">
                                <ul>
                                    <li><a href="<c:url value="/user/info"/>">회원정보</a></li>
                                    <li><a href="<c:url value="/order/history"/>">구매내역</a></li>
                                    <li><a href="<c:url value="/cart/cartlist"/>">장바구니</a></li>
                                    <li><a href="#">1:1문의</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="cart_header">구매하기</div>
                        <div class="cart_subtitle">간편하게 선택하고, 칼로리를 계산해 보세요</div>
                        <div class="cart_itemlist">
                           <div class="cart_itemlist_bgc">
                               <ul>
                                   ${cartList.size()==0 ? "<li class='cart_empty'>장바구니가 비어있습니다</li>" : ""}
                               </ul>
                               <c:forEach var="cartDto" items="${cartList}">
                                   <input type="hidden" id="cart_id${cartDto.cart_id}" value="${cartDto.cart_id}">
                                   <input type="hidden" id="total_amount${cartDto.cart_id}" value="${cartDto.product_price * cartDto.cart_amount}">
                                   <%--OrderDto Properties--%>
                                   <input type="hidden" name="order_product_id" value="${cartDto.cart_product_id}">
                                   <input type="hidden" id="opn" name="order_product_name" value="${cartDto.product_name}">
                                   <input type="hidden" name="order_amount" value="${cartDto.cart_amount}">
                                   <%--//OrderDto Properties--%>
                                   <ul>
                                       <li class="item_list_img_cart">
                                           <a href="<c:url value="/chest/detail?product_id=${cartDto.cart_product_id}"/>">${cartDto.product_desc}</a>
                                       </li>
                                       <li class="item_list_txt_cart">
                                           <a href="<c:url value="/chest/detail?product_id=${cartDto.cart_product_id}"/>">${cartDto.product_name}</a>
                                       </li>
                                       <li class="item_list_txt_cart2">
                                               수량: <input type="number" class="cart_amount" id="amount${cartDto.cart_id}" min="1" value="${cartDto.cart_amount}">
                                               <input type="button" class="cart_modify" id="amountModify${cartDto.cart_id}" value="변경"> &nbsp;|&nbsp; 가격: <span id="indi_price${cartDto.cart_id}">${cartDto.product_price * cartDto.cart_amount}원</span>
                                               <input type="button" class="cart_remove" value="삭제" id="remove${cartDto.cart_id}">
                                       </li>
                                   </ul>
                               </c:forEach>
                               <div class="total_amount">
                                   <%--OrderDto Properties--%>
                                   <input type="hidden" name="order_totalPrice" id="totalPrices" value="">
                                   ${cartList.size()==0 ? "" : "상품 합계: <span class='red_font'><span class='totalPrice_span'></span></span> 원"}
                               </div>
                            </div>
                        </div>
                        <div class="order_flt_wrap">
                            <div class="orderHeader"><h1>주문상세</h1></div>
                            <div class="order_flt_div">
                                <ul class="order_flt">
                                    <li>수령인</li>
                                    <li><input type="text" name="order_receiver" id="receiver"></li>
                                </ul>
                            </div>
                            <div class="order_flt_div">
                                <ul class="order_flt">
                                    <li>수령인 연락처</li>
                                    <li><input type="text" name="order_phone" id="receiver_phone"></li>
                                </ul>
                            </div>
                            <div class="order_flt_div">
                                <ul class="order_flt">
                                    <li>우편번호</li>
                                    <li><input type="text" id="postCode"></li>
                                </ul>
                            </div>
                            <div class="order_flt_div">
                                <ul class="order_flt">
                                    <li>주소</li>
                                    <li><input type="text" name="order_address" id="receiver_address"></li>
                                </ul>
                            </div>
                        </div>
                        <div class="cart_btn_wrap">
                            <input type="button" id="cart_empty" class="cart_return_btn" value="돌아가기">
                            <input type="button" id="order_pay_btn" class="order_pay_btn" value="결제하기">
                        </div>
                        <%--OrderDto Properties--%>
                        <input type="hidden" name="order_user_id" value="${loginId}">
                        <input type="hidden" name="order_id" value="${order_id}">
                    </form>
                </div>
            </div>
    </div>
<script type="text/javascript">

    var money;
    var money2;
    let totalPrice = 0;

    <c:forEach var="cartDto" items="${cartList}">
    // 장바구니 상품 금액 통화 콤마 정규화
    money = $('#indi_price${cartDto.cart_id}').text();
    money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    $('#indi_price${cartDto.cart_id}').text(money2);

    // 장바구니 상품 합계 금액 누적
    totalPrice += parseInt($("#total_amount${cartDto.cart_id}").val());


    document.getElementById("totalPrices").value = totalPrice;

    //상품 합계 금액 통화 콤마 표시
    $(".totalPrice_span").text(totalPrice.toLocaleString());


    $(document).ready(function() {
        $('#amountModify${cartDto.cart_id}').on("click", function () {
            let cart_id = $("#cart_id${cartDto.cart_id}").val();
            let cart_amount = $("#amount${cartDto.cart_id}").val();
            let form = {
                "cart_id" : cart_id,
                "cart_amount" : cart_amount,
                "total_amount" : totalPrice
            }
            $.ajax({
                url: "/cart/update",
                type: "post",
                data: form,
                success: function () {
                    alert("수량이 변경되었습니다.")
                    location.href="/order";
                },
                error: function () {
                    alert("에러");
                }
            });
        });
    });

    $("#remove${cartDto.cart_id}").on("click", function(){
        if(!confirm("정말로 삭제하시겠습니까?")) return;
        let cart_id = parseInt($("#cart_id${cartDto.cart_id}").val());
        let form2 = {
            "cart_id" : cart_id,
        }
        $.ajax({
            url: "/cart/remove",
            type: "post",
            data: form2,
            success: function () {
                alert("삭제되었습니다.")
                location.href="/cart/cartlist";
            },
            error: function () {
                alert("에러");
            }
     });
    });
    </c:forEach>

    $("#order_pay_btn").on("click", function(){
        if(!confirm("구매하시겠습니까?")) return;
        let form = $("#form");

        form.submit();
        alert("주문해 주셔서 감사합니다.")

    });



    $("#cart_empty").on("click", function(){
        location.href="/cart/cartlist";
    });

</script>
</body>
</html>