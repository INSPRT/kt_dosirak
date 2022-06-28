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
                                <li><a href="#">회원정보</a></li>
                                <li><a href="<c:url value="/order/history"/>">구매내역</a></li>
                                <li><a href="<c:url value="/cart/cartlist"/>">장바구니</a></li>
                                <li><a href="#">1:1문의</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="cart_header">회원 정보</div>
                    <div class="cart_subtitle">간편하게 선택하고, 칼로리를 계산해 보세요</div>
                    <div class="login_section">
                        <div class="login_bg_regi">
                            <form id="form" action="" method="post">
                            <div class="loginAlign">
                                <ul>
                                    <li class="login_text_first">회원정보를 입력해 주세요</li>
                                    <li class="login_text_second"><span class="red_font">(*)</span> 표시는 필수 기입란 입니다.</li>
                                    <li><span class="login_text_align">아이디<span class="red_font">*</span></span><input type="text" name="id" id="id" readonly value="${userDto.id}" class="readonly"></li>
                                    <li><span class="login_text_align">이름<span class="red_font">*</span></span><input type="text" name="name" value="${userDto.name}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">비밀번호<span class="red_font">*</span></span><input type="password" name="pass" id="pass" value="${userDto.pass}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">비밀번호 재입력<span class="red_font">*</span></span><input type="password" name="passChk" id="passChk" value="${userDto.pass}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">휴대전화<span class="red_font">*</span></span><input type="text" name="phone" value="${userDto.phone}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">주소<span class="red_font">*</span></span><input type="text" name="address" value="${userDto.address}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">이메일<span class="red_font">*</span></span><input type="text" name="email" value="${userDto.email}" required class="login_text_input_regi"></li>
                                    <li><span class="login_text_align">생일<span class="red_font">*</span></span><input type="text" name="birth" id="birth" value="${birth}" placeholder="2000-08-31" required minlength="10" maxlength="10" onkeyup="birth_keyup(this)" class="login_text_input_regi"></li>
                                    <li>
                                        <span class="login_text_align">성별</span>
                                        <div class="login_text_input_regi">
                                       <span class="login_option">
                                            <input type="radio" name="gender" value="male" ${userDto.gender=="male" ? "checked" : ""} class="login_chkbox_regi">
                                            <span class="login_text_color">남성</span>
                                            <input type="radio" name="gender" value="female" ${userDto.gender=="female" ? "checked" : ""} class="login_chkbox_regi">
                                            <span class="login_text_color">여성</span>
                                        </span>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="login_text_align">키/체중</span>
                                        <div class="login_text_input_regi">
                                    <span class="login_option">
                                        <select name="height" id="height">
                                            <option value="0">선택</option>
                                            <option value="${userDto.height}" ${userDto.height!=null||"" ? "selected" : ""}>-${userDto.height}cm-</option>
                                            <c:forEach var="i" begin="130" end="210" step="1">
                                                <option value="${i}"><c:out value="${i}cm"/></option>
                                            </c:forEach>
                                        </select>

                                        <select name="weight" id="weight">
                                            <option value="0">선택</option>
                                            <option value="${userDto.weight}" ${userDto.weight!=null||"" ? "selected" : ""}>-${userDto.weight}kg-</option>
                                            <c:forEach var="i" begin="30" end="180" step="1">
                                                <option value="${i}"><c:out value="${i}kg"/></option>
                                            </c:forEach>
                                        </select>
                                    </span>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="login_text_align">운동량</span>
                                        <div class="login_text_input_regi">
                                        <span class="login_option">
                                            <select name="exercise" id="exercise">
                                                <option value="0">선택</option>
                                                <option ${userDto.exercise!=null||"" ? "selected" : ""} value="${userDto.exercise}">
                                                    ${userDto.exercise==1 ? "-정적: 운동을 거의 또는 전혀 하지 않음-" : ""}
                                                    ${userDto.exercise==2 ? "-가볍게: 주 1~3회-" : ""}
                                                    ${userDto.exercise==3 ? "-보통: 주 4~5회-" : ""}
                                                    ${userDto.exercise==4 ? "-활동적: 매일 또는 격렬한 운동 주 3~4회-" : ""}
                                                    ${userDto.exercise==5 ? "-매우 활동적: 격렬한 운동 주 6~7회-" : ""}
                                                    ${userDto.exercise==6 ? "-운동 중독: 매일 매우 격렬한 운동 또는 육체 노동-" : ""}
                                                </option>
                                                <option value="10">${userDto.exercise!=null||"" ? "================================" : ""}</option>
                                                <option value="1">정적: 운동을 거의 또는 전혀 하지 않음</option>
                                                <option value="2">가볍게: 주 1~3회</option>
                                                <option value="3">보통: 주 4~5회</option>
                                                <option value="4">활동적: 매일 또는 격렬한 운동 주 3~4회</option>
                                                <option value="5">매우 활동적: 격렬한 운동 주 6~7회</option>
                                                <option value="6">운동 중독: 매일 매우 격렬한 운동 또는 육체 노동</option>
                                            </select>
                                        </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            </form>
                            <ul class="login_btn_float">
                                <li class="regi_mt">
                                    <form id="form1" action="" method="post">
                                    <input type="button" id="dropUser" class="regi_back" value="회원 탈퇴"></li>
                                    </form>
                                <li><input type="submit" id="modifyBtn" class="login_button_css" value="회원정보 수정"></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    </div>
<script type="text/javascript">
    //  생년월일 - 하이픈 자동 생성
    function birth_keyup(obj){
        let birth_len = obj.value.length;
        if (event.keyCode==8){
            obj.value = obj.value.slice(0,birth_len)
            return 0;
        }else if(birth_len==4 || birth_len==7){
            obj.value += '-';
        }
    }

    $("#dropUser").on("click", function(){
        let form = $("#form1");
        form.attr("action", "<c:url value='/user/drop'/>");
        form.attr("method", "post");

        if(!confirm("정말로 탈퇴하시겠습니까?")) return;
        form.submit();
        alert("탈퇴하였습니다.")
    });

    $(document).ready(function() {
        let formCheck = function () {
            let form = document.getElementById("form");
            if(form.pass.value!=form.passChk.value){
                alert("비밀번호가 일치하지 않습니다");
                form.passChk.focus();
                return false;
            }
            if (form.id.value == "") {
                alert("아이디를 입력해 주세요.");
                form.id.focus();
                return false;
            }
            if (form.pass.value == "") {
                alert("비밀번호를 입력해 주세요.");
                form.pass.focus();
                return false;
            }
            if (form.passChk.value == "") {
                alert("비밀번호를 한번 더 입력해 주세요.");
                form.passChk.focus();
                return false;
            }
            if (form.name.value == "") {
                alert("이름을 입력해 주세요.");
                form.name.focus();
                return false;
            }
            if (form.phone.value == "") {
                alert("전화번호를 입력해 주세요.");
                form.phone.focus();
                return false;
            }
            if (form.address.value == "") {
                alert("주소를 입력해 주세요.");
                form.address.focus();
                return false;
            }
            if (form.email.value == "") {
                alert("메일을 입력해 주세요.");
                form.email.focus();
                return false;
            }
            if (form.birth.value.length < 10) {
                alert("생년월일 8자리를 정확히 입력해 주세요.");
                form.birth.focus();
                return false;
            }

            return true;
        }
        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/user/modify'/>");
            form.attr("method", "post");
            if(formCheck()){
                if(!confirm("회원정보를 수정하시겠습니까?")) return;
                form.submit();
                alert("회원정보가 수정되었습니다.")
            }else{
                return false;
            }

        });
    });

</script>
</body>
</html>