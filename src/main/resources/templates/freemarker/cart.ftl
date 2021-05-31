<#include "layout/order_page.ftl">
<#macro content>
    <!-- Page Content -->
    <div class="container cont_wrap" id="existCart">
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
                    <li class="col-md-12 total_price">최종결제금액<span><em
                                    class="final_price">264,000</em>원</span></li>
                </ul>
            </div>
        </section>

        <div class="text-center col-md-12">
            <div class="btn type02 buy_now" onclick="onOrder()">
                <i></i>결제 하기
            </div>
        </div>
    </div>

    <div class="container cont_wrap" id="emptyCart">
        <div class="text-center col-md-12">
            <h1 class="mb-5">장바구니가 비었습니다.</h1>
            <div class="btn type02 buy_now" onclick="mainpage()">
                <i></i>구매하러 가기
            </div>
        </div>
    </div>

</#macro>
<#macro script>

    <script type="text/javascript">

        $(document).ready(function () {
            if(localStorage.length === 0 ){
                $("#emptyCart").css("display","block");
                $("#existCart").css("display","none");
            }else{
                $("#emptyCart").css("display","none");
                $("#existCart").css("display","block");
            }

            let orderPrice = 0;
            for (let i = 0; i < localStorage.length; i++) {
                let map = new Map();
                map = JSON.parse(localStorage.getItem(localStorage.key(i)));
                let liTag = "<li class=" + localStorage.key(i) + ">" +
                    "<div class='img_lbox''>" +
                    "<a href='/goodsDetail?id=" + map.goodsId + "'>" +
                    "<img src='" + map.goodsImg + "' alt='' width='64' height='64' class='imgClass'>" +
                    "</a>" +
                    "<input type='hidden' class='goodsId' value='" + map.goodsId + "'>" +
                    "</div>" +
                    "<div class='info_rbox'>" +
                    "<div class='info_item'>" +
                    "<div class='prd_name'>" +
                    "<a href='/goodsDetail?id=" + map.goodsId + "' class='goodsName'>" +
                    map.goodsName + "</a>" +
                    "<dl class='list_option'>" + "<dt>옵션 -</dt>" + "<dd><em class='goodsSize'>" + map.size + "</em>/<em class='goodsColor'>" + map.color + "</em></dd>" +
                    "</dl>" +
                    "<button class='btn btn-outline-dark' style='font-size: revert;' onclick='cartItemDelete(this)'>삭제</button>" +
                    "<input class='option_num' type='number' maxlength='2' min='1' max='99' oninput='maxLengthCheck(this)' value='" + map.itemCount + "'/>" +
                    "</div>" +
                    "<div class='prd_price'>" +
                    "<span class='prcie'><em>" + map.goodsPrice + "</em>원</span>" +
                    "<span class='total_price2'><strong>" + map.itemPrice + "</strong>원</span>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
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
            if (localStorage.length === 0) {
                alert("장바구니에 상품이 없습니다")
                return false;
            } else {
                // TODO :: PAYPAL 결제 테스트용
                if (confirm("결제하시겠습니까?") == true) {
                    for (let j = 0; j < $(".product_list").children("li").length; j++) {
                        if ( $(".product_list").find(".option_num")[j].value <= 0) {
                            alert("주문하신 수량이 맞지 않습니다");
                            return false;
                        }
                    }
                    //확인
                    // 성공 처리
                    localStorage.clear();
                    for (let i = 0; i < $(".product_list").children("li").length; i++) {
                        let item = {
                            "goodsId": $(".product_list").find(".goodsId")[i].value,
                            "goodsImg": $(".product_list").find(".imgClass")[i].src,
                            "goodsPrice": $(".product_list").find(".prcie")[i].children[0].innerText,
                            "goodsName": $(".product_list").find(".goodsName")[i].innerText,
                            "size": $(".product_list").find(".goodsSize")[i].innerText,
                            "color": $(".product_list").find(".goodsColor")[i].innerText,
                            "itemCount": $(".product_list").find(".option_num")[i].value,
                            "itemPrice": $(".product_list").find(".total_price2 strong")[i].innerText,
                        }

                        let stringJSON = JSON.stringify(item)
                        localStorage.setItem("cartItem_" + i, stringJSON);
                    }
                    location.href = "/order";
                } else {
                    // 실패 처리
                    console.log("결제 실패")
                    showMessageModal('결제 실패', '죄송합니다.' +
                        '주문하신 내역의 결제가 실패하였습니다.' +
                        '확인 후 다시 시도하거나 고객센터로 연락주십시오.'
                        , '확인')
                    return false;
                }
            }
        }


        function countCheck(view) {
            let price = $(view).parents("li").find("em")[2].innerText.replace(/,/g, "");
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

        function cartItemDelete(view) {
            if (confirm("삭제 하시겠습니까?") == true) {    //확인
                // 성공 처리
                $(view).parents("li").remove()
                let itemName = $(view).parents("li").attr('class');
                localStorage.removeItem(itemName);
                console.log("아이템 삭제버튼이야");
                location.reload();
            } else {
                // 실패 처리
                return false;
            }
        }


        function maxLengthCheck(object) {
            if (object.value.length > object.maxLength) {
                object.value = object.value.slice(0, object.maxLength);
            }
            countCheck(object);
        }

        function cartEmpty() {
            localStorage.clear();
            location.reload();
        }


        function mainpage(){
            location.href = "/main";
        }

    </script>


</#macro>
<@page/>
