<#include "layout/order_page.ftl">
<#setting number_format="computer">
<#macro content>

    <body class="order complete">
    <!-- Page Content -->
    <div class="container cont_wrap">
        <section class="form_box comp_box">
            <div class="col-md-12 comp_card">
                <h4><strong>주문조회</strong></h4>
                <p class="col-sm-12">고객님의 주문정보를 확인하실 수 있습니다. <br/>저장한 주문번호를 입력하시고 주문정보를 확인하세요.
                </p>
                <div class="form-group search_wrap row">
                    <div class="col-sm-7 mb-3">
                        <input type="text" class="form-control" id="input_orderCode"
                               placeholder="주문번호를 입력하세요.">
                    </div>
                    <div>
                        <button type="button" class="btn btn-dark" onclick="getSearchOrder()">
                            검색
                        </button>
                    </div>

                </div>

            </div>
        </section>

        <section class="form_box order_num" id="orderNumBox" style="display: none">
            <h5><span class="orderCode"></span><em class="orderBuyDay"></em></h5>

        </section>

        <section class="row form_box" id="orderItemBox" style="display: none">
            <h5>주문상품</h5>
            <div class="total_products">
                <ul class="product_list">

                </ul>
            </div>
        </section>

        <section class="form_box" id="orderInfoBox" style="display: none">
            <h5>배송지</h5>

            <div class="shipping_info">
                <table class="table">
                    <tbody>
                    <tr>
                    <tr>
                        <th scope="row">수령인</th>
                        <td class="orderName"></td>
                    </tr>
                    <tr>
                        <th scope="row">연락처</th>
                        <td class="orderNumber"></td>
                    </tr>
                    <tr>
                        <th scope="row">이메일</th>
                        <td class="orderEmail"></td>
                    </tr>
                    <tr>
                        <th scope="row">우편번호</th>
                        <td class="orderPostCode"></td>
                    </tr>
                    <tr>
                        <th scope="row">주소</th>
                        <td class="orderAddress"></td>
                    </tr>
                    <tr>
                        <th scope="row">상세주소</th>
                        <td class="orderDetailAddress"></td>
                    </tr>
                    <tr>
                        <th scope="row">요청사항</th>
                        <td class="orderMessage"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>


        <section class="form_box" id="orderPriceBox" style="display: none">
            <h5>주문금액</h5>
            <div class="prcie_info">
                <ul class="row">
                    <li class="col-md-4">주문상품<span><em class="order_price"></em>원</span></li>
                    <li class="col-md-4">할인<span><em>-0</em>원</span></li>
                    <li class="col-md-4">배송비<span><em>+0</em>원</span></li>
                    <li class="col-md-12 total_price">최종결제금액<span><em
                                    class="final_price"></em>원</span></li>
                </ul>
            </div>
        </section>


        <div class="text-center col-md-12">
            <a class="btn type02 mfull" href="/main">
                상품으로 이동
            </a>
        </div>
    </div>

    </body>

</#macro>
<#macro script>

    <script>

        $(document).ready(function () {
            sessionStorage.clear();

        });

        function getSearchOrder() {
            let orderCode = $("#input_orderCode").val();
            let orderPrice = 0;

            let request = new XMLHttpRequest();
            request.onload = function () {
                localStorage.clear();
                if (request.status === 200 || request.status === 201) {

                    $(".product_list").empty();

                    let json = JSON.parse(request.responseText);
                    console.log("제이슨 파싱값", json);

                    let orderName = json["orderInfo"].name;
                    let address = json["orderInfo"].address;
                    let number = json["orderInfo"].number;
                    let detailAddress = json["orderInfo"].detailAddress;
                    let email = json["orderInfo"].email;
                    let orderMessage = json["orderInfo"].message;
                    let orderCode = json["orderInfo"].orderCode;
                    let postCode = json["orderInfo"].postCode;
                    let orderBuyDay = json["orderInfo"].orderBuyDay;

                    let itemPrice = json["orderGoodsList"][0].price.replace(/,/gi, "");
                    let itemCount = json["orderGoodsList"][0].count;

                    let onetItemPrice = (itemPrice / itemCount).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");


                    $(".orderName").text(orderName);
                    $(".orderNumber").text(number);
                    $(".orderEmail").text(email);
                    $(".orderPostCode").text(postCode);
                    $(".orderAddress").text(address);
                    $(".orderDetailAddress").text(detailAddress);
                    $(".orderMessage").text(orderMessage);
                    $(".orderCode").text(orderCode);
                    $(".orderBuyDay").text(orderBuyDay)


                    $("#orderNumBox").css("display", "block");
                    $("#orderItemBox").css("display", "block");
                    $("#orderInfoBox").css("display", "block");
                    $("#orderPriceBox").css("display", "block");


                    for (let i = 0; i < json["orderGoodsList"].length; i++) {
                        let liTag = "<li>" +
                            "<div class='img_lbox''>" +
                            "<a href='/goodsDetail?id=" + json["orderGoodsList"][i].goodsId + "'>" +
                            "<img src='" + json["orderGoodsList"][i].imgUrl + "' alt='' width='64' height='64' class='imgClass'>" +
                            "</a>" +
                            "</div>" +
                            "<div class='info_rbox'>" +
                            "<div class='info_item'>" +
                            "<div class='prd_name'>" +
                            "<a href='/goodsDetail?id=" + json["orderGoodsList"][i].goodsId + "' class='goodsName'>" +
                            json["orderGoodsList"][i].name + "</a>" +
                            "<dl class='list_option'>" + "<dt>옵션 -</dt>" + "<dd><em class='goodsSize'>" + json["orderGoodsList"][i].size + "</em>/<em class='goodsColor'>" + json["orderGoodsList"][i].color + "</em></dd>" +
                            "</dl>" +
                            "<span class='count'>수량 " + json["orderGoodsList"][i].count + "개</span>" +
                            "</div>" +
                            "<div class='prd_price'>" +
                            "<span class='prcie'><em>" + onetItemPrice + "</em>원</span>" +
                            "<span class='total_price2'><strong>" + json["orderGoodsList"][i].price + "</strong>원</span>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</li>";
                        $(".product_list").append(liTag);

                        let orderPriceText = json["orderGoodsList"][i].price.replace(/,/g, "");
                        orderPrice += parseInt(orderPriceText);
                    }

                    let orderPriceConverter = orderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    $(".order_price").html(orderPriceConverter);
                    $(".final_price").html(orderPriceConverter);

                } else if (request.status === 400) {

                    console.error(request.responseText);
                } else {
                    // console.error(request.responseText);
                    alert("주문조회로 조회한 정보가 없습니다")
                    $("#orderNumBox").css("display", "none");
                    $("#orderItemBox").css("display", "none");
                    $("#orderInfoBox").css("display", "none");
                    $("#orderPriceBox").css("display", "none");
                }
            }

            let formData = new FormData();
            formData.append("orderCode", orderCode)
            request.open("POST", 'requestOrderInfo.do', true);
            request.send(formData)


        }

    </script>

</#macro>
<@page/>