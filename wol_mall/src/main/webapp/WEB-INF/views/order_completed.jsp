<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>




<body>
<h1>
주문 리스트
</h1>



<table border="1" style="width: 80%">
<tr>
<td style="width: 60%;text-align: center;">상품명</td><td style="width: 20%; text-align: center;">수량</td><td style="width: 20%; text-align: center;">판매가</td>
<tr>
</tr>
</table>

<c:set var="sum" value="0"/>
<table border="1" style="width: 80%">
<c:forEach items="${list}" var="lista" varStatus="status">
	<tr>
	<td style="width: 60%;"> 상품명 :${lista.item_name}<td style="width: 20%; text-align: center;">${lista.item_count}</td><td style="width: 20%; text-align: center;" class="price">${lista.item_price}</td>
	</tr>
	<tr>
	<td colspan="3"> 사이즈: ${lista.item_size} 색상: ${lista.item_color} </td>
	</tr>
	<tr><tr><tr><tr>
	 <c:set var="sum" value="${sum + lista.item_price}"/>
</c:forEach>
</table>


<h3>주문자 정보</h3>
<div style=" width: 80%;">
이름: <input type="text" id="order_name"><br>
이메일: <input type="text" id="e_mail"><br>
연락처: <input type="text" id="order_Phone_number"><br>
</div>



<h3>배송정보</h3>

<table style="width: 80%">
<tr><td>이름: <input type="text" id="name"></td></tr>
<tr><td>연락처1: <input type="text"> 연락처 2 <input type="text"></td></tr>
<tr><td><input type="text" id="postcode" onclick="Postcode()"><input type="button" value="우편번호" onclick="Postcode()"></td></tr>
<tr><td>주소:<input type="text" id="address" readonly="readonly"><input type="text" id="detailAddress"></td></tr>
<tr><td>주문메시지(100자 내외):<input type="text" name="phone"></td></tr>
<tr><td>무통장 입금자명 <input type="text" name="phone"></td></tr>
</table>



<h3>주문상품 할인적용</h3>
<h5>주문금액이 50000원 미만시 배송료가 발생합니다.</h5>
<table  border="1" style="width: 80%">
<tr><td>상품금액</td><td>배송비</td><td>할인금액<td>추가금액</td><td>결제 예정금액</td></tr>
<tr><td>${sum}</td><td class="shipping_fee"></td><td>0원</td><td>0원</td><td>${sum}</td></tr>
</table>


<h3>결제 정보</h3>
<div>
결제방법
</div>
<table>
<tr><td>
<input type="radio" id="bank" name="payment" value="men" checked="checked" onchange="bank_select()">무통장입금
 <select class="bank_select" name="color_select">
			<option value="">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
			<option value="">농협 010-7225-0852(예금주:서월성)</option>
			<option value="">신한은행 010-7225-0852(예금주:서월성)</option>
			<option value="">기업은행 010-7225-0852(예금주:서월성)</option>
		</select><td>
<tr><td><input type="radio" id="card" name="payment" value="girl" onchange="card_select()">신용카드
</td>
</table>
<h2>최종 결제금액 ${sum}원</h2>



<div style="text-align: center;">
<input type="button" value="주문하기" onclick="check_form()"><input type="button" value="주문취소 " onclick="order_cancel()">
</div>



<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script>

   $(document).ready(function(){
   if(${sum}>50000){
		$(".shipping_fee").html("무료");
	   }
   else{
	   $(".shipping_fee").html("2500원");
	   }
   });

   function card_select(){ 
	   $(".bank_select").prop('disabled',true);
	   }

	function bank_select(){
		$(".bank_select").prop('disabled',false);
		}

	function order_cancel(){
		var cansel = confirm('주문을 취소하시겟습니까?')
		if (cansel==true){
		location.href="main.do";
		}
	}


	function check_form(){
		var address = $("#address").val();
		var order_name = $("#order_name").val();
		var order_Phone_number = $("#order_Phone_number").val();
		if(address==""){
			alert("주소를 입력해주세요")
			return false;
			}
		else if(order_name==""){
			alert("주문자 이름을 적어주세요")
			return false;
			}
		else if(order_Phone_number==""){
			alert("주문자 번호를 입력해주세요")
		}
	}
	
   
</script>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function Postcode() {
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


</body>
</html>