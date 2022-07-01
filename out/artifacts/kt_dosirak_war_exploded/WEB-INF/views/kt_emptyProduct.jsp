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
                    <div class="cart_header">죄송합니다!</div>
                    <div class="empty_order_title">현재
                        <span class="red_font">${empty_item_names}(남은 수량: ${left_stock})</span> 의 재고 부족으로 주문에 실패했습니다.<br><br>주문 내역: ${order_item_names}, ${order_items_cnt}개<br><br> 불편을 드려 죄송합니다. 다시 주문해 주세요.
                    </div>
                    <div class="cart_itemlist">

                    </div>
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
                    location.href="/cart/cartlist";
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

    $(document).ready(function() {
        $('#cart_empty').on("click", function () {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = {
                "cart_user_id" : "${loginId}",
            }
            $.ajax({
                url: "/cart/removeAll",
                type: "post",
                data: form,
                success: function () {
                    alert("장바구니를 비웠습니다.");
                    location.href="/cart/cartlist";
                },
                error: function () {
                    alert("에러");
                }
            });
        });
    });

</script>
</body>
</html>