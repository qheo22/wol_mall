<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function checkid(){

	 var userId = $("#id").val();
/* 	 {
         "id":$('#id').val()
  } */
	//아이디 중복체크
        $.ajax({
	     type:"POST",
	     url:"checkid.do",
	     data:"userId="+userId,
	     success:function(data){
	    	  console.log(data);	//data : checkSignup에서 넘겨준 결과값
	             if(isempty(data)){ 
	               	alert("아이디를 입력해주세요.");
	               }
	             else if(data==1){
	            	   	alert("중복된 id입니다.");
		             } 
	           	else{
	                  alert("사용가능한 아이디입니다.");
	                  $('#id').val('');
	                  $('#id').focus();
	               }
	            } 
	
	    }) 
     }

</script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body>
<form action="">
ID:<input type="text" id="id" name="id" placeholder="아이디">
<input type="button" value="중복확인" onclick="checkid()">
<br>
PW:<input type="password"placeholder="비밀번호"><br>
이름:<input type="text"placeholder="이름"><br>
성별 : <input type="radio" name="gender" value="men">남자
<input type="radio" name="gender" value="girl">여자<br>
생년월일<input type="text" placeholder="생년월일" name="birth"><br>
이메일:<input type="email" placeholder="email" name="email"><br>
휴대폰번호:<input type="text" placeholder="phone-number" name="phone"><br>
우편번호:<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
주소:<input type="text" id="sample6_address" placeholder="주소"><br>
상세주소:<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="submit" value="회원가입">
</body>
</html>
