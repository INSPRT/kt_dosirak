<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
        <form id="form" action="" method="post">
           <div class="wrapAuto">
                <div class="banner_mainWrap">
                    <div class="banner_main">
                        <div class="banner_img"></div>
                        <div class="imgText_regi">회원가입</div>
                    </div>
                </div>
                <div class="login_subtitle">간편하게 선택하고, 칼로리를 계산해 보세요</div>
                <div class="login_section">
                   <div class="login_bg_regi">
                       <div class="loginAlign">
                            <ul>
                                <li class="login_text_first">가입정보를 입력해 주세요</li>
                                <li class="login_text_second"><span class="red_font">(*)</span> 표시는 필수 기입란 입니다.</li>
                                <li><span class="login_text_align">아이디<span class="red_font">*</span></span><input type="text" name="id" id="id" required oninput="checkId()" class="login_text_input_regi"></li>
                                <li class="id_ok">사용 가능한 아이디입니다.</li>
                                <li class="id_already">이미 사용 중인 아이디입니다.</li>
                                <li><span class="login_text_align">비밀번호<span class="red_font">*</span></span><input type="password" name="pass" id="pass" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">비밀번호 재입력<span class="red_font">*</span></span><input type="password" name="passChk" id="passChk" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">이름<span class="red_font">*</span></span><input type="text" name="name" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">휴대전화<span class="red_font">*</span></span><input type="text" name="phone" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">주소<span class="red_font">*</span></span><input type="text" name="address" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">이메일<span class="red_font">*</span></span><input type="text" name="email" required class="login_text_input_regi"></li>
                                <li><span class="login_text_align">생일<span class="red_font">*</span></span><input type="text" name="birth" id="birth" placeholder="2000-08-31" required minlength="10" maxlength="10" onkeyup="birth_keyup(this)" class="login_text_input_regi"></li>
                                <li>
                                    <span class="login_text_align">성별</span>
                                    <div class="login_text_input_regi">
                                       <span class="login_option">
                                            <input type="radio" name="gender" value="male" class="login_chkbox_regi">
                                            <span class="login_text_color">남성</span>
                                            <input type="radio" name="gender" value="female" class="login_chkbox_regi">
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
                                            <c:forEach var="i" begin="130" end="210" step="1">
                                                <option value="${i}"><c:out value="${i}cm"/></option>
                                            </c:forEach>
                                        </select>

                                        <select name="weight" id="weight">
                                            <option value="0">선택</option>
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
                            <ul class="login_btn_float">
                                <li class="regi_mt">
                                    <input type="button" class="regi_back" value="뒤로가기"></li>
                                <li><input type="submit" id="regiBtn" class="login_button_css" value="등록"></li>
                            </ul>
                    </div>
                </div>
            </div>
        </form>
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

        function checkId(){
            var id = $('#id').val();
            $.ajax({
                url:'/user/idCheck',
                type:'post',
                data:{id:id},
                success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
                    if(cnt == "0"){ //cnt가 0일 경우 -> 사용 가능한 아이디
                        $('.id_ok').css("display","inline-block");
                        $('.id_already').css("display", "none");
                    } else if(cnt==1) { // cnt가 1일 경우 -> 이미 존재하는 아이디
                        $('.id_already').css("display","inline-block");
                        $('.id_ok').css("display", "none");
                    } else{
                        $('.id_ok').css("display", "none");
                        $('.id_already').css("display", "none");
                    }
                },
                error:function(){
                    alert("아이디 체크 기능 오류");
                }
            });
        }

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
                if ($('.id_already').is(':visible') == true) {
                    alert("중복된 아이디 입니다.");
                    form.id.focus();
                    return false;
                }

                return true;
            }
            $("#regiBtn").on("click", function(){
                let form = $("#form");
                form.attr("action", "<c:url value='/register/receive'/>");
                form.attr("method", "post");
                if(formCheck()){
                    form.submit();
                    alert("회원가입이 완료되었습니다.")
                }else{
                    return false;
                }

            });
        });
    </script>
</body>
</html>