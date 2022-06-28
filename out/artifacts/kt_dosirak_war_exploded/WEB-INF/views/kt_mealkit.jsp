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
                <div class="itemListHeader">
                    <ul class="itemListHeader_first">
                        <input type="hidden" value="${mode=isAdmin}">
                        <li class="itemListHeader_first_title">고단백 닭가슴살 ${mode=='admin' ? "| <a href='/chest/write'> 등록</a>" : ''}</li>
                        <ul class="itemListHeader_second">
                            <li>최신순</li>
                            <li>|</li>
                            <li>높은가격순</li>
                            <li>|</li>
                            <li>낮은가격순</li>
                            <li>|</li>
                            <li>이름순</li>
                            <li>|</li>
                            <li>인기순</li>
                        </ul>
                    </ul>
                    
                </div>
               <div class="item_listWrap">
                   <div class="item_list">
                       <ul>
                           <c:forEach var="productDto" items="${mealkitList}">
                               <li>
                                   <div class="item_list_img">
                                       <a href="<c:url value="/chest/detail?product_id=${productDto.product_id}"/>">${productDto.product_desc}</a>
                                   </div>
                                   <div class="item_list_txt">
                                       <a href="<c:url value="/chest/detail?product_id=${productDto.product_id}"/>">${productDto.product_name}</a><br>가격: <span id="indi_price${productDto.product_id}">${productDto.product_price}</span>
                                   </div>
                               </li>
                           </c:forEach>
                       </ul>
                   </div>
                   <div class="pageHandle">
                       <c:if test="${ph.totalCnt==null || ph.totalCnt==0}">
                           <div class="noContents"> 등록된 상품이 없습니다. </div>
                       </c:if>

                       <c:if test="${ph.totalCnt!=null && ph.totalCnt!=0}">
                           <c:if test="${ph.showPrev}">
                               <a class="page" href="<c:url value="/mealkit/itemlist?page=${ph.beginPage-1}"/>">&lt;</a>
                           </c:if>
                           <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                               <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/mealkit/itemlist?page=${i}"/>">${i}</a>
                           </c:forEach>
                           <c:if test="${ph.showNext}">
                               <a class="page" href="<c:url value="/mealkit/itemlist?page=${ph.endPage+1}"/>">&gt;</a>
                           </c:if>
                       </c:if>
                   </div>
               </div>
            </div>
    </div>
    <script>
        var money;
        var money2;

        <c:forEach var="productDto" items="${mealkitList}">
        // 상품 금액 통화 콤마 정규화
        money = $('#indi_price${productDto.product_id}').text();
        money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#indi_price${productDto.product_id}').text(money2);

        </c:forEach>
    </script>
</body>
</html>