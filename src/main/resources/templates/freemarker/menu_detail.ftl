<#include "layout/detail_page.ftl">
<#setting number_format="computer">
<#macro content>
	<!-- Page Content -->
	<div class="container cont_wrap">
		<section class="head_cont row">
			<div class="col-lg-7 head_thum">
				<div class="thum_box">
					<img class="img-box"src="${s3BaseUrl}${goods.getImgUrl()}" alt="">
				</div>
			</div>

			<div class="col-lg-5 info_area">
				<div class="summary">
					<h1 class="name">${goods.getName()}</h1>
					<div class="price">
						<span class="sale"><em>${goods.getPrice()?string(",##0")}</em>원</span>
					</div>

				</div>


				<div class="options_mbox">
					<p class="cart_close"></p>
					<div class="options">

						<div class="select_wrap mb-3 row">
							<p class="col-md-5 col-sm-5 select_txt">크기를 선택하세요.</p>

							<select class="col-md-7 col-sm-7" id="inputGroupSelect02" name="sizeSelector">
								<option value="*" selected="">- [필수] 선택해 주세요 -</option>
								<option value="**" disabled="">-------------------</option>
								<#list goods.getSizes() as models>
									<option value="${models}">${models}</option>
								</#list>
							</select>
						</div>
						<div class="select_wrap mb-3 row">
							<p class="col-md-5 col-sm-5 select_txt">색상을 선택하세요.</p>
							<select class="col-md-7 col-sm-7" id="inputGroupSelect02" name="colorSelector">
								<option value="*" selected="">- [필수] 선택해 주세요 -</option>
								<option value="**" disabled="">-------------------</option>
								<#list goods.getColors() as models>
									<option value="${models}">${models}</option>
								</#list>
							</select>
						</div>
					</div>


					<div class="total_products">
						<ul class="total_list">
							<#--				상품 구매시 추가부분				-->

						</ul>
						<div class="total_price" style="display: none">
							<span>총 상품금액</span>
							<span class="price"><strong class="goods_total_price">176,000</strong><em>원</em></span>
						</div>
					</div>

				</div>

<#--				<div class="btn_wrap">-->
<#--					<a class="btn btn_buy buy_now mb-2" onclick="addToCart()">-->
<#--						장바 구니 담기-->
<#--					</a>-->
<#--				</div>-->

				<div class="btn_wrap">
					<a class="btn btn_buy buy_now mb-2" onclick="onclickBuy(${goods.getId()})">
						바로 구매하기
					</a>
				</div>
			</div>
		</section>
	</div>


</#macro>
<#macro script>

	<script type="text/javascript">

		let itemExist = false;
		let firstSelect = false;
		let size;
		let color;
		let img = $(".img-box").attr("src");


		$(document).ready(function () {


			$(function () {
				$('[data-toggle="tooltip"]').tooltip()
			});

			var width = window.outerWidth;
			if (width < 993) {
				$('.options_mbox, .buy_now').addClass('hide');
				$('.btn_buy.buy_m').click(function () {
					$('.options_mbox, .buy_now').removeClass('hide');
					$('.cart_close').click(function () {
						$('.options_mbox, .buy_now').addClass('hide');

					});
				});
			} else {
				$('.options_mbox, .buy_now').removeClass('hide');
			}

			$(window).resize(function () {
				var r_width = window.outerWidth;
				if (r_width < 993) {
					$('.options_mbox, .buy_now').addClass('hide');
					$('.btn_buy.buy_m').click(function () {
						$('.options_mbox, .buy_now').removeClass('hide');
						$('.cart_close').click(function () {
							$('.options_mbox, .buy_now').addClass('hide');
						});
					});

				} else {
					$('.options_mbox, .buy_now').removeClass('hide');
				}
			});


			//크기 값 가져오기
			$("select[name=sizeSelector]").change(function(){
				console.log($(this).val()); //value값 가져오기
				console.log($("select[name=sizeSelector] option:selected").text()); //text값 가져오기
				size = $(this).val();
				firstSelect = true;
			});

			//색상값 가져오기
			$("select[name=colorSelector]").change(function(){
				if(firstSelect === false){
					alert("첫번째 옵션을 선택하세요");
					$("select[name=colorSelector]").val("*").prop("selected", true);
				}
				else {
					console.log($(this).val()); //value값 가져오기
					console.log($("select[name=colorSelector] option:selected").text()); //text값 가져오기
					color = $(this).val();
					purchaseList(color,size,img);
				}
			});

		});

		//옵션선택시 리스트 추가 부분
		function purchaseList(color,size,img) {

			let priceText = $(".sale").children("em").text();
			let goodsPrice = priceText.replace(/,/g, "");
			let price = parseInt(goodsPrice);
			let goodsInfo =
					"<li><span class='option_thumb'>" + "<img src=" + img + " alt='' width='60' height='60'>" +
					"<span class='imgbox'>" + "</span></span>" + "<span class='option_txt'>" + "<span class='option_prod'> 사이즈: <span class='size'>" + size + "</span> / 컬러: <span class='color'>" + color + "</span> </span>" +
					"<p>" +
					"<input class='option_num' type='number' value='1' min='1' max='99' maxlength='2' oninput='maxLengthCheck(this)' />" +
					"<span class='option_price'><strong>" + price.format() + "</strong>" + "<input type='hidden' value='" + price + "'>" +
					"<em>원</em></span>" +
					"</p>" +
					"</span>" +
					"<p class='btn_del' onclick='listDelete(this)'></p>" + "</li>";

			let set =  new Set();
			let lastindex = 0;

			if ($(".total_list").children("li").length == 0) {
				$(".total_list").append(goodsInfo);
				selectEmpty();

			}else{
				$(".total_list").append(goodsInfo);
				for (let i = 0; i < $(".total_list").children("li").length; i++) {
					let item = $(".total_list").find(".option_prod")[i].innerText;
					set.add(item);
					lastindex = i;
					selectEmpty();
				}
				if(set.size !== $(".total_list").children("li").length){
					alert("중복된 상품입니다");
					$(".total_list").children("li")[lastindex].remove();
					selectEmpty();
				}
			}

			//아이템 선택후 옵션선택창 비우는 메소드
			function selectEmpty(){
				$("select[name=colorSelector]").val("*").prop("selected", true);
				$("select[name=sizeSelector]").val("*").prop("selected", true);
			}


			$(".total_price").css("display","block");

			itemsPrice();
			firstSelect = false;
			itemExist = true;
		}

		//아이템 삭제 부분
		function listDelete(view){
			let parent = view.parentNode;
			console.log(view);
			parent.parentNode.removeChild(parent);

			itemsPrice();

			let listSize = $(".total_list").children().length;
			if(listSize == 0){
				$(".total_price").css("display","none");
				itemExist = false;
			}
		}


		function onclickBuy(id) {
			if (itemExist === false) {
				alert("선택하신 아이템이 없습니다");
				return false;
			} else {
				let orderArray = new Array();

				for (let j = 0; j < $(".total_list").children("li").length; j++) {
					orderArray[j] = {
						"goodsId" : id,
						"goodsImg": $(".img-box").attr("src"),
						"goodsPrice": $(".sale").children("em").text(),
						"goodsName" : $(".name").text(),
						"size": $(".total_list").find(".option_prod .size")[j].innerText,
						"color": $(".total_list").find(".option_prod .color")[j].innerText,
						"itemCount": $(".total_list").find(".option_num ")[j].value,
						"itemPrice": $(".total_list").find(".option_price strong")[j].innerText,
					}
				}
				let stringJSON = JSON.stringify(orderArray)
				sessionStorage.setItem("items",stringJSON);
			}

			location.href="/order";
		}

			function countCheck(view) {

				let price = $(".sale").children("em").text().replace(/,/g, "");
				let count = view.value;
				let itemPrice = price * count;
				$(view).siblings().children().siblings("strong").text(itemPrice.format());
				itemsPrice();
			}


			function itemsPrice() {
				let totalPrice = 0;
				for (let i = 0; i < $(".total_list").children("li").length; i++) {
					let priceText = $(".total_list").find(".option_price")[i].children[0].innerText;
					let price = priceText.replace(/,/g, "");
					totalPrice += parseInt(price);
				}
				$(".goods_total_price").text(totalPrice.format());

			}

			function maxLengthCheck(object) {
				if (object.value.length > object.maxLength) {
					object.value = object.value.slice(0, object.maxLength);
				}
				countCheck(object);
			}

			function addToCart() {
				console.log("장바구니 담기야");

		}


	</script>

</#macro>
<@page/>
