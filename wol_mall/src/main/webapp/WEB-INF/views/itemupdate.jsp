<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="insert.do" method="post" enctype="multipart/form-data">
카테고리:<select id="item_kinds" name="item_kinds">
		<option value="Best">베스트</option>
		<option value="New">신상</option>
		<option value="Coordination_set">코디세트/1+1</option>
		<option value="Outter">아우터</option>
		<option value="Shirt">셔츠</option>
		<option value="T-shirt">티셔츠</option>
		<option value="Pants">팬츠</option>
</select>
사이즈:색사
<br>
메인 이미지 : <input type="file" name="up_file" id="up_file" ><br>
상품명 : <input type="text" id="item_name" name="item_name"><br>
상품내용 : <input type="text" id="item_info" name="item_info"><br>

<h1>
상품 색상과 상품 사이즈는 ,를 기준으로 적어주세요<br>
ex 블랙 핑크 화이트 3가지 색상 입력시 
블랙,핑크,화이트 

사이즈도 위와동일합니다

</h1>
상품색상 : <input type="text" id="item_color" name="item_color"  placeholder="ex 화이트,블랙,핑크"><br>
상품 사이즈 : <input type="text" id="item_size" name="item_size" placeholder="ex 95,100,105"><br>


<h2>기본가격과 할인가격을 입력후 '할인율 계산'버튼을 누르면 할인율 표에 자동으로 계산되어 들어갑니다</h2>
기본가격 : <input type="text" id="item_price_consumer" name="item_price_consumer"><br>
할인가격 : <input type="text" id="item_price_sell" name="item_price_sell"><br>
<input type="button" value="할인율 계산" onclick ="discount_Calculator()">

할인율: <input type="text" id="item_discount" name="item_discount" readonly="readonly"><br>
<input type="submit" value="저장">
</form>

<br>
<form action="main2.do">
<input type="submit" value="목록으로">
</form>



<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>

function discount_Calculator(){
	alert("이건들어오냐");
	  var price_consumer = $("#item_price_consumer").val();
	  var price_sell = $("#item_price_sell").val(); 
	  var a = 1-(price_sell/price_consumer);
	  var b = Math.round(a*100);
	  $('#item_discount').val(b+"%");
}


function color_append(){
	alert("색상추가 칸 입니다.");
    $('#color_ap').append('색상 추가'+'<input type="text" name="color" placeholder="ex 화이트,블랙,핑크)">');
}


function size_append(){
	alert("사이즈 추가 칸입니다.");
    $('#size_ap').append('사이즈 추가'+'<input type="text" name="size" placeholder="ex 95,100,105)">');
}




</script>


</body>
</html>