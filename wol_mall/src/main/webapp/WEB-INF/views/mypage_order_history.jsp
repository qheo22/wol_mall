<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<style>
.mypage_ul {
    list-style:none;
    margin:0;
    padding:0;
}

.mypage_li {
	border-right: 1px solid #5d5d5d;
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    float: left;
    margin: 25px 0;
    width:380px;
    height:150px;
}
.adb{
float: left;
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
<div class="adb" align="center">
<ul class="mypage_ul">
<li class="mypage_li">
<span>회원등급</span><br>
<a>${user_id}님의 회원등급은[${dto.grade}]입니다.</a>
</li>
<li class="mypage_li">
<span>사용가능쿠폰</span><br>
<a>[${dto.cupone}]</a>
</li>
<li class="mypage_li">
<span>적립금</span><br>
<a>구매금액의 ${dto.benefits}% 를 추가 적립해 드립니다.</a>
</li>
<li class="mypage_li">
<span>배송비혜택</span><br>
<a>모델</a>
</li>
<li class="mypage_li">
<span>할인혜택</span><br>
<a>구매금액의 ${dto.discount}% 를 추가 할인해 드립니다.</a>
</li>
<li class="mypage_li">
<span>총 주문금액</span><br>
<a><fmt:formatNumber value="${dto.total_order_amount}" pattern="#,###" /></a>
</li>
</ul>
</div>
</body>

</html>
