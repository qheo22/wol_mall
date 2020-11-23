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
	                      location.href="loginok.do";
	                  } else{
	                	  alert('아이디나 비밀번호가 다릅니다.')
	               }
	          });
	      }
</script>
<body>
<h1 align="center">
로그인
</h1>
<div align="center">
<input type="text" id="user_id" class="textbox"><br>
<input type="password" id="password" class="textbox" name="password"><br>
<input type="submit" value="로그인" class="input" onclick="checkidpw()">
</div>

<h1 align="center">
비회원주문조회
</h1>
<div align="center"> 
<input type="text" id="id" name="id" class="textbox"><br>
<input type="password" id="password" name="password" class="textbox"><br>
<input type="submit" value="조회" class="input">
</div>


</html>
