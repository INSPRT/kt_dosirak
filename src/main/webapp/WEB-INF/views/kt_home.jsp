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
                <div class="banner_mainWrap">
                    <div class="banner_main">
                        <div class="banner_img"></div>
                    </div>
                </div>
                <div class="item_rcmdWrap">
                    <div class="item_rcmd">
                        <ul>
                            <li>Title1</li>
                            <li>Title2</li>
                            <li>Title3</li>
                            <li>Title4</li>
                            <li>Title5</li>
                            <li>Title6</li>
                        </ul>
                    </div>
                </div>
                <div class="searchWrap">
                  <div class="search_title">
                            <ul>
                                <li>원하는 도시락</li>
                                <li>예산이 정해져 있어요</li>
                            </ul>
                        </div>
                   <div class="searchWrap2">
                        <div class="search_section">
                           <ul>
                                <li>
                                    <select name="category_main" id="category_main" class="drop1">
                                    <option value="01">닭가슴살</option>
                                    <option value="02">도시락</option>
                                    <option value="03">음료</option>
                                    <option value="04">밀키트</option>
                                    </select>
                                </li>
                                <li>
                                    <select name="category_detail" id="category_detail" class="drop2">
                                    <option value="05">큐브</option>
                                    <option value="06">스테이크</option>
                                    <option value="07">닭가슴살</option>
                                    <option value="08">닭가슴살 볶음</option>
                                    </select>
                                </li>
                                <li>
                                    <select name="category_type" id="category_type" class="drop3">
                                    <option value="09">가격</option>
                                    <option value="10">칼로리</option>
                                    </select>
                                </li>
                                <li>
                                    <select name="category_brand" id="category_brand" class="drop4">
                                    <option value="11">전체</option>
                                    <option value="12">brand1</option>
                                    <option value="13">brand2</option>
                                    <option value="14">brand3</option>
                                    </select>
                                </li>
                                <li>
                                    <input type="submit" value="검색하기" class="search_btn">
                                </li>
                           </ul>
                        </div>
                    </div>
                </div>
               <div class="item_listWrap">
                   <div class="item_list">
                       <ul>
                           <c:forEach var="productDto" items="${homeList}">
                               <li>
                                   <div class="item_list_img">
                                           ${productDto.product_desc}
                                   </div>
                                   <div class="item_list_txt">
                                           ${productDto.product_name}<br>가격: ${productDto.product_price}
                                   </div>
                               </li>
                           </c:forEach>
                       </ul>
                   </div>
               </div>
            </div>
    </div>
</body>
</html>