<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<style>
.textbox{
width:500px;
height:40px;
margin-bottom:20px;
}

.input{
background-color: black;
color: white;
width:510px;
height:40px;
}
</style>
<head>
	<title>Home</title>
</head>

       
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	//아이디 비밀번호 체크부분
	function checkidpw(){
	        var user_id = $("#user_id").val(); 
	        var pw = $("#password").val();
	          $.ajax({
	              type : "POST",
	              url : "login.do",
	              data : "user_id=" + user_id + "&pw=" + pw,
	              dataType : "html"
	          }).done(function(data){     
	                 if (data == 1) {
	                     console.log(data);
	                      alert('로그인 성공')
	                      location.href="main.do";
	                  } else{
	                	  alert('아이디나 비밀번호가 다릅니다.')
	               }
	          });
	      }
</script>
<body>
<h4>
쇼핑정보
</h4>
<ul>
<li>
<a>마이페이지</a>
</li>
<li>
<a>주문조회</a>
</li>
<li>
<a>적립금내역</a>
</li>
<li>
<a>쿠폰내역</a>
</li>
<li>
<a>출석체크</a>
</li>
<li>
<a>관심상품 보관함</a>
</li>
<li>
<a>내 게시글</a>
</li>
</ul>
<h4>
회원정보
</h4>
<ul>
<li>
<a>회원등급별혜택</a>
</li>
<li>
<a>회원정보수정</a>
</li>
<li>
<a>회원탈퇴</a>
</li>
</ul>
<H4>
커뮤니티
</H4>
<ul>
<li>
<a>이벤트</a>
</li>
<li>
<a>포토후기</a>
</li>
<li>
<a>직원후기</a>
</li>
</ul>
<h4>
고객센터
</h4>
<ul>
<li>
<a>공지사항</a>
</li>
<li>
<a>FAQ</a>
</li>
<li>
<a>상품/단체복문의</a>
</li>
<li>
<a>입금문의</a>
</li>
<li>
<a>배송전취소</a>
</li>
<li>
<a>배송문의</a>
</li>
<li>
<a>vip회원전용문의</a>
</li>
<li>
<a>품절/불량보상제</a>
</li>
<li>
<a>해외배송문의</a>
</li>
<li>
<a>입사지원</a>
</li>
<li>
<a>모델지원</a>
</li>
</ul>
<h4>
쇼핑팁
</h4>
<ul>
<li>
<a>교환/반품 방ㅂ버</a>
</li>
<li>
<a>사이즈 측정법</a>
</li>
<li>
<a>소제세탁 정보안내</a>
</li>
</ul>
<h3>010-7225-0852</h3>

</body>

</html>
