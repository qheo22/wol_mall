<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<style>
.input{
background-color: black;
color: white;
width:510px;
height:40px;
}
.naver{
background-color: green;
color: white;
width:260px;
height:40px;
}

.kakao{
background-color: yellow;
color: black;
width:260px;
height:40px;
}

</style>
<head>
	<title>Home</title>
</head>
<body>
<h1 align="center">
회원가입
</h1>
<h5 align="center">
회원종류에 따라 회원가입 절차가 다릅니다.<br>
고객님께서 해당하는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.
</h5>
<div align="center">
<img alt="사진없음"
src="<%=request.getContextPath()%>/resources/Images/all.JPG">
</div>
<img src="">
<div align="center">
<input type="button" value="간편 회원가입" class="input" onclick='location.href="sign_up_form.do";'>
</div>
<h1 align="center">
SNS 간편 회원가입
</h1>
<div align="center">
<a href="main.do">
<img alt="사진없음"
src="<%=request.getContextPath()%>/resources/Images/kakao.JPG"></a>
<a href="main.do">
<img alt="사진없음"
src="<%=request.getContextPath()%>/resources/Images/naver.JPG"></a>
</div>
</body>
</html>
