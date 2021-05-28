<#include "layout/order_page.ftl">
<#macro content>
		<!-- Page Content -->
		<div class="container cont_wrap">
			<h3 class="page_title">Cart</h3>

			<section class="row form_box">
				<h5>담긴 상품</h5>
				<div class="total_products">
					<ul class="product_list">
					</ul>
				</div>
				<button type="button" class="close" onclick="cartEmpty()">장바구니 비우기</button>
			</section>

			<section class="form_box">
				<h5>결제정보</h5>
				<div class="prcie_info">
					<ul class="row">
						<li class="col-md-4">주문상품<span><em class="order_price">264,000</em>원</span></li>
						<li class="col-md-4">할인<span><em>-0</em>원</span></li>
						<li class="col-md-4">배송비<span><em>+0</em>원</span></li>
						<li class="col-md-12 total_price">최종결제금액<span><em class="final_price">264,000</em>원</span></li>
					</ul>
				</div>
			</section>

<#--			<div class="text-center col-md-12">-->
<#--				<div class="btn type02 buy_now" onclick="onOrder()">-->
<#--					<i></i>PayPal 결제하기-->
<#--				</div>-->
<#--			</div>-->

			<div class="text-center col-md-12">
				<div class="btn type02 buy_now" onclick="onOrder()">
					<i></i>결제 하기
				</div>
			</div>
		</div>

</#macro>
<#macro script>

	<script type="text/javascript">

		$(document).ready(function () {

			let orderPrice = 0;
			for(let i=0; i< localStorage.length; i++){
				let map = new Map();
				map = JSON.parse(localStorage.getItem("cartItem_"+[i]));
				let liTag= "<li>"+
						"<div class='img_lbox''>"+
						"<a href='/goodsDetail?id="+map.goodsId+"'>"+
						"<img src='"+map.goodsImg+"' alt='' width='64' height='64' class='imgClass'>"+
						"</a>"+
						"<input type='hidden' class='goodsId' value='"+map.goodsId+"'>"+
						"</div>"+
						"<div class='info_rbox'>"+
						"<div class='info_item'>"+
						"<div class='prd_name'>"+
						"<a href='/goodsDetail?id="+map.goodsId+"' class='goodsName'>"+
						map.goodsName+"</a>"+
						"<dl class='list_option'>"+"<dt>옵션 -</dt>"+"<dd><em class='goodsSize'>"+map.size+"</em>/<em class='goodsColor'>"+map.color+"</em></dd>"+
						"</dl>"+
						"<input class='option_num' type='number' maxlength='2' min='1' max='99' oninput='maxLengthCheck(this)' value='"+map.itemCount+"'/>"+
						"</div>"+
						"<div class='prd_price'>"+
						"<span class='prcie'><em>"+map.goodsPrice+"</em>원</span>"+
						"<span class='total_price2'><strong>"+map.itemPrice+"</strong>원</span>"+
						"</div>"+
						"</div>"+
						"</div>"+
						"</li>";
				$(".product_list").append(liTag);

				let orderPriceText = map.itemPrice.replace(/,/g, "");
				orderPrice += parseInt(orderPriceText);
			}

			let orderPriceConverter = orderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".order_price").html(orderPriceConverter);
			$(".final_price").html(orderPriceConverter);
		})


		function onOrder() {
			let name = document.getElementById("input_name").value;
			let number = document.getElementById("input_number").value;
			let email = document.getElementById("input_email").value;
			let postCode = document.getElementById("input_postCode").value;
			let address = document.getElementById("input_address").value;
			let detailAddress = document.getElementById("input_detailAddress").value;
			let message = document.getElementById("input_message").value;


			if (null == name || name.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '받는분 성함을 입력해주세요.', '확인')
				return;
			}

			if (null == number || number.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '받는분 연락처를 입력해주세요.', '확인')
				return;
			}

			if (null == email || email.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '이메일을 입력해주세요.', '확인')
				return;
			}

			if (null == postCode || postCode.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '배송지 우편번호를 입력해주세요.', '확인')
				return;
			}

			if (null == address || address.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '배송 주소지를 입력해주세요.', '확인')
				return;
			}

			if (null == detailAddress || detailAddress.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '배송지 상세주소를 입력해주세요.', '확인')
				return;
			}

			if (null == message || message.length === 0) {
				// 배송지명 미입력
				showMessageModal('배송지 입력', '배송시 요청사항을 입력해주세요.', '확인')
				return;
			}


			// TODO :: PAYPAL 결제 테스트용
			if (confirm("결제하시겠습니까?") == true){    //확인
				// 성공 처
				requestOrderComplete();
			}else{
				// 실패 처리
				console.log("결제 실패")
				showMessageModal('결제 실패', '죄송합니다.' +
						'주문하신 내역의 결제가 실패하였습니다.' +
						'확인 후 다시 시도하거나 고객센터로 연락주십시오.'
						, '확인')
				return false;
			}
		}


		function countCheck(view) {
			let price = $(".prd_price").find("em").html().replace(/,/g, "");
			let count = view.value;
			let itemPrice = price * count;
			$(view).closest('.info_item').find("strong").html(itemPrice.format());
			itemsPrice();
		}


		function itemsPrice() {
			let totalPrice = 0;
			for (let i = 0; i < $(".product_list").children("li").length; i++) {
				let priceText = $(".product_list").find(".total_price2")[i].children[0].innerText;
				let price = priceText.replace(/,/g, "");
				totalPrice += parseInt(price);
			}
			$(".order_price").text(totalPrice.format());
			$(".final_price").text(totalPrice.format());
		}



		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
			countCheck(object);
		}

		function cartEmpty(){
			localStorage.clear();
			location.reload();
		}



		function requestOrderComplete() {

			let formData = new FormData();

			formData.append("name",$("#input_name").val());
			formData.append("numberText",$("#input_number").val());
			formData.append("email",$("#input_email").val());
			formData.append("postCodeText",$("#input_postCode").val());
			formData.append("address",$("#input_address").val());
			formData.append("detailAddress",$("#input_detailAddress").val());
			formData.append("message",$("#input_message").val());


			for(let i=0; i< $(".product_list").children("li").length; i++){
				formData.append("goodsId",$(".goodsId")[i].value);
				formData.append("goodsSize",$(".product_list").find(".goodsSize")[i].innerText);
				formData.append("goodsColor",$(".product_list").find(".goodsColor")[i].innerText);
				formData.append("goodsPrice",$(".product_list").find(".total_price2 strong")[i].innerText,);
				formData.append("goodsCount",$(".product_list").find(".option_num")[i].value);
				formData.append("goodsName",$(".product_list").find(".goodsName")[i].text);
				formData.append("goodsImgUrl",$(".product_list").find(".imgClass")[0].currentSrc);
			}

			sessionStorage.setItem("oneItemPrice",$(".product_list").find(".prcie")[0].innerText);


			let request = new XMLHttpRequest();

			request.onload = function () {
				if (request.status === 200 || request.status === 201) {

					console.log("리턴해서 넘어온값은?"+request.responseText)
					location.href = "orderComplete?id="+request.responseText;

				} else if (request.status === 400) {

					console.error(request.responseText);
				} else {

					console.error(request.responseText);
				}
			}

			request.open('POST', '/insertOrder.do',  true);
			request.send(formData);

		}



	</script>


</#macro>
<@page/>