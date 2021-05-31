<#include "layout/detail_page.ftl">
<#macro content>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>



<main class="container mt-5 mb-5">

  <div class="mt-5"></div>
  <#if accessor!?has_content>
  <div class="d-flex">
    <div class="ms-auto">방문자수 ${accessor}</div>
  </div>
  <#else>
  </#if>

  <#if randomGoods?has_content>

    <div class="card text-white w-50 h-50 offset-md-3">
      <a class="text-white" href="javascript:getGoodsDetailInfo(${randomGoods.getId()})">
        <img src="${s3BaseUrl}${randomGoods.getImgUrl()}" class="card-img" alt="...">
        <div class="card-img-overlay">
          <div class="position-absolute top-50">
            <h5 class="card-title">${randomGoods.getName()}</h5>
            <p class="card-text">옷 내용 눌럿을시 그옷으로 이동 새로고침시 옷 랜덤으로 변경</p>
          </div>
        </div>
      </a>
    </div>
  <#else>
  </#if>

  </div>
  <div class="mt-5"></div>

  <div class="row row-cols-1 row-cols-md-4 g-4">
      <#list models as menu>
    <div class="col">
      <div class="card">
        <a href="javascript:getGoodsDetailInfo(${menu.getId()})">
        <img src="${s3BaseUrl}${menu.getImgUrl()}" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">${menu.getName()}</h5>
          <p class="card-text">${menu.getPrice()}원</p>
        </div>
      </div>
    </div>
    </#list>
</main>


</#macro>

<#macro script>
  <script type="text/javascript">

    function getGoodsDetailInfo(id){


      let url = "/goodsDetail?id=";
             location.href= url+id;
    }


  </script>
</#macro>
<@page/>
