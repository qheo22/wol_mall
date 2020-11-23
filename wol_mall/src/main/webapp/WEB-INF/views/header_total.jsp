<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
<style>
<style>
.menu-wrap { width:100%; margin:0 auto; 
	width:100%;
   height:60px;
   text-align: center;
}

.menu {
list-style:none;
display: inline-block;
}

.abc{
list-style:none;
right:20px;
}

.main_manu{
   float:left;
   margin-left:20px;
}

.right_manu{
 float:right;
   margin-right:20px;
}

</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
	//레디펑션
	$(document).ready(function(){
		if(${user_id}!=null){
			$("#join").css("display","none");
			$("#login").css("display","none");
			$("#logout").css("display","block");
		}else{
			$("#logout").css("display","none");
			$("#join").css("display","block");
			$("#login").css("display","block");
		}
	});


	function reflash(){
		location.reload(true);
	}


	function logincheck(){
		if(${user_id}!=null){
			alert("ㅎㅎㅎ");
		}else{
		location.href="logout.do";
		}
	}
	
	
</script>


<h1 align="center">
   오늘의 특가!
</h1>

<div>
<h2 align="center">
wol_mall
</h2>
<a href="itemupdateform.do">아이템업데이트</a>
<div>
<ul class="abc">
<li class="right_manu">
<a href="select.do?kinds=best">장바구니</a>
</li>
<li class="right_manu">
<a href="select.do?kinds=new">고객센터</a></li>
<li class="right_manu">
<a href="loginform.do">마이페이지</a>
</li>
<li class="right_manu" id="join">
<a href="idinfo.do">회원가입</a>
</li>
<li class="right_manu" id="login">
<a href="loginform.do">로그인</a>
</li>
<li class="right_manu" id="logout" style="display:none;">
<a href="logout.do" onclick="reflash()">로그아웃</a>
</li>
</ul>
</div>
</div>

<br><br>

<div class="menu-wrap">
<ul class="menu">
<li class="main_manu">
<a href="select.do?kinds=best">Best</a>
</li>
<li class="main_manu">
<a href="select.do?kinds=new">신상</a></li>
<li class="main_manu">
<a href="select.do?kinds=Coordination_set">코디세트/1+1</a>

</li>
<li class="main_manu">
<a href="select.do?kinds=Outer">아우터</a>
</li>
<li class="main_manu">
<a href="select.do?kinds=Shirt">셔츠</a>
</li>
<li class="main_manu">
<a href="select.do?kinds=T-shirt">티셔츠</a>
</li>
<li class="main_manu">
<a href="select.do?kinds=Pants">팬츠</a>
</li>
</ul>
</div>



</body>
</html>