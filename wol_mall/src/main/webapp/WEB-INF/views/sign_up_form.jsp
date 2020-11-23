<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<style>
    .sing_up_li {
        border: 1px solid #d5d5d5;
        height: 60px;
        font-size: 15px;
        text-align: left;
         list-style: none;
    }

    .birth {
        border: none;
        outline: none;
        width: 60px;
        height: 20px;
        background-color: #f8f8f8;
    }

    .join_new_box {
        width: 900px;
        margin: 100px auto 0;
        font-size: 20px;
        font-weight: bold;
    }

    .sign_up_text {
        border: none;
        outline: none;
        width: 400px;
        margin: 0 auto;
    }


    .sing_up_li_a {
        background-color: #000;
        color: #fff;
        font-size: 14px;
        text-decoration-line: none;
        padding: 22px;
        margin-left: 348.7px;
    }

    .sign_up {
  	  	background-color: #000;	
        color: #fff;
        height: 60px;
        width: 861px;
    	font-size: 25px;
		line-height: 57px;
    }

    .sing_up_div {
    	margin: 20px 0 0;
      	height: 100px;
    }


    .agree_box {
        border: 1px solid #d5d5d5;
        height: 200px;
        font-size: 15px;
        text-align: left;

    }


    .agree_box_sing_up_div {
        width: 861px;
        margin: auto;
        padding-left: 40px;
    }
</style>
<h1>회원가입</h1>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


var idcheck;
var emailcheck;		


	function checkIt() { //유효성 검사

		var birth1 = $("#birthyear").val();
		var month = $("#birthmonth").val();
		var date = $("#birthdate").val();
		$("#birth").val(birth1+month+date);
		var birthflag = false;
		var user_id = $("#user_id").val();
		var user_idflag = false;
		var password = $("#password").val();
		var passwordflag = false;
		var password2 = $("#password2").val();
		var password2flag = false;
		var name = $("#name").val();
		var nameflag = false;
		var gender = $('input:radio[name=gender]').is(':checked');
		var genderflag = false;
		var email = $("#email").val();
		var emailflag = false;
		var checkbox = $('input:checkbox[name="sign_check"]:checked').length;
		var checkboxflag = false;
		var idcheckflag = false


		if(!user_id){
			alert("아이디를 입력해주세요");
			return false;
		}else if(user_id){
			user_idflag = true;
		}

		if(1!=idcheck){
			alert("id 중복검사를 해주세요");
			return false;
		}else if(1==idcheck){
			idcheckflag = true;
		}
		

		if(birth1 !="" && month !="" && date !=""){
			birthflag = true;
		}else if(birth1 =="" && month =="" && date ==""){
			alert("출생년도입력해주세요");
			return false;
		}else{
			alert("나머지 입력해라");
			return false;
			}


		if(!gender){
			alert("성별을 입력해주세요");
			return false;
		}else if(gender!=null){
			genderflag = true;
			
		}

		if(!password){
			alert("비밀번호를 입력해");
			return false;
		}else if(password != password2){
			alert("비밀번호를 확인해");
			return false;
		}else if(password == password2){
			passwordflag2 =true;
		}
		

		if(!name){
			alert("이름을 입력해주세요");
			return false;
		}else if(name){
			nameflag = true;
		}
		

		if(!email){
			alert("이메일을 입력해주세요");
			return false;
		}else{
			
		}

		if(1!=emailcheck){
			alert("이메일을 중복확인해");
			return false;
		}else if(1==emailcheck){
			emailflag = true;
		}

		if(4!=checkbox){
			alert("약관동의를 해주세요");
			return false;
		}else if(4==checkbox){
			checkboxflag = true;
		}

	    if(birthflag && user_idflag && idcheckflag && genderflag && passwordflag2 && nameflag && emailflag && checkboxflag == true) {
			$("#sign_up_submit").submit();
        }
	}
		

	


	


// id 중복체크
	function check_id() {
		var user_id = $("#user_id").val();
		$.ajax({
			type : "POST",
			url : "check_id.do",
			data : "user_id="+user_id,
			success : function(data){
				console.log(data);
				if (user_id =='') {
				alert("아이디를 입력해주세요");
				} else if (user_id == data) {
				alert("중복된 아이디입니다.");
				} else {
				alert("사용가능한 아이디 입니다.");
				idcheck = 1;
			}
		}
		})
	}

//이메일 중복체크
	function check_email() {
		var email = $("#email").val();
		$.ajax({
			type : "POST",
			url : "check_email.do",
			data : "email=" + email,
			success : function(data){
				console.log(data);
				if (email =='') {
					alert("이메일을 입력해주세요");
					} else if (email == data) {
					alert("중복된 이메일 입니다.");
					} else {
					alert("사용가능한 이메일 입니다.");
					emailcheck = 1;
				}
			}
			})
		}





//체크박스 전체선택
$(document).ready(function() {
	 $("#checkall").click(function(){
         //만약 전체 선택 체크박스가 체크된상태일경우
         if($("#checkall").prop("checked")) {
             $("input[id=chk]").prop("checked",true);
             //input type이 체크박스인것은 모두 체크함
         } else {
             $("input[id=chk]").prop("checked",false);
             //input type이 체크박스인것은 모두 체크 해제함
         }
   });
});


</script>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';
						var extraAddr = ''; 

						if (data.userSelectedType === 'R') { 
							addr = data.roadAddress;
						} else { 
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
	
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
		
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
					
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
				

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address").value = addr;
				
						document.getElementById("detailAddress")
								.focus();
					}
				}).open();
	}
</script>

<body>
<form action="sign_up.do" id="sign_up_submit">
<div class="join_new_box" >
<ul class="sign_up_ul">
<li class="sing_up_li">
아이디<br>
<input type="text" placeholder="아이디" class="sign_up_text" id="user_id" name="user_id">
<a href="javascript:check_id();"class="sing_up_li_a">중복확인</a>
</li></ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
이메일<br>
<input type="email" placeholder="이메일" id="email" name="email" class="sign_up_text">
<a href="javascript:check_email();" class="sing_up_li_a">중복확인</a>
</li></ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
비밀번호<br>
<input type="password" placeholder="비밀번호(8~16자 이내 영대소문자,숫자,특수문자의 조합)" 
class="sign_up_text" id="password" name="password">
</li></ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
비밀번호 확인<br>
<input type="password" id="password2" placeholder="비밀번호 확인" class="sign_up_text">
</li></ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
이름<br>
<input type="text" placeholder="이름" class="sign_up_text" id="name" name="name">
</li></ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
핸드폰번호<br>
<input type="text" placeholder="핸드폰번호" class="sign_up_text" id="phone" name="phone">
</li>
</ul>
<ul class="sign_up_ul">
<li class="sing_up_li">
<input type="hidden" value="" id="birth" name="birth">
<input type="text" class="birth" id="birthyear" maxlength="4">년
<input type="text" class="birth" id="birthmonth" maxlength="2">월
<input type="text" class="birth" id="birthdate" maxlength="2">일

<input type="radio" id="gender" name="gender" value="men">
남 <input type="radio" id="gender" name="gender" value="girl">여
</li>
</ul>
</div>
<div class="agree_box_sing_up_div">
<div class="agree_box">
<label>
<input type="checkbox" id="checkall">전체동의
</label><br><br>
<label>
<input type="checkbox" name="sign_check" id="chk">이용약관 <a>내용보기</a>
</label>
<label>
<input type="checkbox"  name="sign_check" id="chk">개인정보 수집 및 이용안내 <a>내용보기</a>
</label><br>
<label>
<input type="checkbox"  name="sign_check" id="chk">개인정보 제3자 제공 <a>내용보기</a>
</label>
<label>
<input type="checkbox"  name="sign_check" id="chk">개인정보 처리위탁 <a>내용보기</a>
</label><br>
<span style="color:red">*sms 수신거부시 입고지연 /품절안내 문자의 전송이 불가하여 발생하는 불이익은 책임지지 않습니다.</span>
<br>
<label>
<input type="checkbox" id="chk">마케팅 수신동의(<input type="checkbox" id="chk">이메일 <input type="checkbox" id="chk">sms <input type="checkbox" id="chk">앱push알림)
</label><br>
쇼핑몰에서 제공하는 신상품 소식/ 할인쿠폰을 무상으로 보내드립니다!<br>
단, 상품 구매 정보는 수신동의 여부 관계없이 발송됩니다.<br>
제공 동의를 하지 않으셔도 서비스 이용에는 문제가 없습니다.
</div>
<div class="sing_up_div">
<input type="button" value="가입완료" class="sign_up" onclick="checkIt()">
</div>
</div>
</form>
</body>
</html>
