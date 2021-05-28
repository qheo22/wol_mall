<#include "layout/order_page.ftl">
<#setting number_format="computer">
<#macro content>

    <body class="order complete">
    <form>
        <!-- Page Content -->
        <div class="container cont_wrap">

            <section class="form_box comp_box">
                <div class="col-md-12 comp_card">
                    <h4><strong>주문완료</strong> 되었습니다.</h4>
                    <#--					<p class="col-sm-12">안전한 거래를 위해 고객님의 이메일로 주문 내역을 발송했습니다. <br /><span class="guide">메일이 도착하지 않았다면 재전송을 누르거나 주문번호를 반드시 저장하세요.</span></p>-->
                    <#--					<!-- Button trigger modal &ndash;&gt;-->
                    <#--					<button type="button" class="btn type01" data-toggle="modal" data-target="#Common_Modal">-->
                    <#--						주문내역 재전송-->
                    <#--					</button>-->

                    <!-- Modal -->
                    <div class="modal fade" id="Common_Modal" tabindex="-1" role="dialog"
                         aria-labelledby="ModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="ModalCenterTitle">주문내역 재전송</h5>
                                    <button type="button" lass="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    주문내역을 입력한 이메일로 재전송하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-dark"
                                            data-dismiss="modal">닫기
                                    </button>
                                    <button type="button" class="btn btn-outline-dark">전송</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <p class="col-sm-2 col-form-label">배송지</p>
                    <ul class="col-sm-10">

                        <li> 받는분 : ${orderInfo.getName()}</li>
                        <li> 연락처 : ${orderInfo.getNumber()}</li>
                        <li> 이메일 : ${orderInfo.getEmail()}</li>
                        <li> 우편번호 : ${orderInfo.getPostCode()}</li>
                        <li> 주소: ${orderInfo.getAddress()}</li>
                        <li> 상세주소: ${orderInfo.getDetailAddress()}</li>
                        <li> 주문 메시지: ${orderInfo.getMessage()}</li>
                    </ul>
                </div>

                <div class="form-group row">
                    <p class="col-sm-2 col-form-label">주문번호</p>
                    <ul class="col-sm-10">
                        <li>${orderInfo.getOrderCode()}</li>
                    </ul>
                    <p class="col-sm-12 info_txt error">주문번호는 주문 조회 시 필요하오니 반드시 저장하세요.</p>
                    <p class="col-sm-12 info_txt error">db에 주문정보가 들어갑니다 복사해주시고 우측상단에 돋보기 클릭후 주문조회
                        가능합니다.</p>
                </div>
            </section>


            <section class="form_box">
                <h5>주문금액</h5>
                <div class="prcie_info">
                    <ul class="row">
                        <li class="col-md-4">주문상품<span><em class="order_price"></em>원</span></li>
                        <li class="col-md-4">할인<span><em>-0</em>원</span></li>
                        <li class="col-md-4">배송비<span><em>+0</em>원</span></li>
                        <li class="col-md-12 total_price">최종결제금액<span><em class="total_list"></em>원</span>
                        </li>
                    </ul>
                </div>
            </section>

            <section class="row form_box">
                <h5>주문상품</h5>
                <div class="total_products">
                    <ul class="product_list">
                        <#list orderInfoGoodsList as goodsList>
                            <li>
                                <div class="img_lbox">
                                    <a href="goodsDetail?id=${goodsList.getGoodsId()}">
                                        <img src="${goodsList.getImgUrl()}" alt="" width="64"
                                             height="64">
                                    </a>
                                </div>

                                <div class="info_rbox">
                                    <div class="info_item">
                                        <div class="prd_name">
                                            <a href="goodsDetail?id=${goodsList.getGoodsId()}">
                                                ${goodsList.getName()}</a>
                                            <dl class="list_option">
                                                <dt>옵션 -</dt>
                                                <dd>${goodsList.getSize()}
                                                    <em>${goodsList.getColor()}</em></dd>
                                            </dl>
                                            <span class="count">수량 ${goodsList.getCount()}</span>
                                        </div>
                                        <div class="prd_price">
                                            <span class=""><em class="itemPrice"></em>원</span>
                                            <span class="total_price2"><strong>${goodsList.getPrice()}</strong>원</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                </div>
            </section>

            <div class="text-center col-md-12">
                <a class="btn type02 mfull" href="/main">
                    상품으로 이동
                </a>
            </div>

        </div>


        <!-- Footer -->

    </form>
    </body>

</#macro>
<#macro script>

    <script>

        $(document).ready(function () {

            let totalPrice = 0;
            for (let i = 0; i < $(".product_list").children("li").length; i++) {
                let priceText = $(".product_list").find(".total_price2")[i].children[0].innerText;
                let price = priceText.replace(/,/g, "");
                totalPrice += parseInt(price);
            }
            $(".order_price").text(totalPrice.format());
            $(".final_price").text(totalPrice.format());


            let itemPriceText = sessionStorage.getItem("oneItemPrice");
            let itemPrice = itemPriceText.replace("원", "");
            $(".itemPrice").text(itemPrice);
            sessionStorage.clear();
        });


    </script>


</#macro>
<@page/>
