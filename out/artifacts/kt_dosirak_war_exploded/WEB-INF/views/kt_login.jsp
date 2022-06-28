<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false"%>

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
                <div class="banner_mainWrap">
                    <div class="banner_main">
                        <div class="banner_img"></div>
                        <div class="imgText">로그인</div>
                    </div>
                </div>
                <div class="login_subtitle">간편하게 선택하고, 칼로리를 계산해 보세요</div>
               <form action="/login/login" method="post">
                <div class="login_section">
                   <div class="login_bg">
                        <ul>
                            <li class="login_text_first">회원정보를 입력해 주세요</li>
                            <li class="login_text_second">회원정보를 입력하세요.</li>
                            <li><input type="text" class="login_text_input" name="id" id="loginId" value="${cookie.id.value}" placeholder="ID: dosirak"></li>
                            <input type="hidden" name="toURL" value="${param.toURL}">
                            <li><input type="password" class="login_text_input" name="pass" placeholder="PASS: *******"></li>
                            <li class="login_text_color"><label><input type="checkbox" name="rememberId" class="login_chkbox">ID저장</label></li>
                            <li class="login_mt"><a href="/register/add"><input type="button" class="login_button_css login_fisrtbtn" value="회원가입"></a></li>
                            <li><input type="submit" id="loginBtn" class="login_button_css" value="로그인"></li>
                        </ul>
                    </div>
                </div>
               </form>
            </div>
    </div>
<script>

</script>
</body>
</html>