<#include "layout/user_page.ftl">
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

    
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <a href="#"><img class="d-block mx-auto mb-4" src="assets/img/데님팬츠.jpg" alt="" width="72" height="57"></a>
      <h2>Wol Mall</h2>
      <h2>임시로 옷정보 가져오는지 확인 ${model.getPrice()}</h2>
    </div>

    <div class="row g-5 ml-5">
      <div class="col-md-12 col-lg-12">
        <h4 class="mb-3">회원 가입</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-12">
              <label for="firstName" class="form-label">Name</label>
              <input type="text" class="form-control" id="firstName" placeholder="이름" value="" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>
            <div class="col-12">
              <label for="username" class="form-label">ID</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" placeholder="아이디" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">Password</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password" placeholder="비밀번호" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="passwordConfirm" class="form-label">Password Confirm</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>


            <div class="col-12">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" placeholder="이메일">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">Address</label>
              <input type="text" class="form-control" id="address" placeholder="서울특별시 oo구 " required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="col-12">
              <label for="address2" class="form-label">Address 2</label>
              <input type="text" class="form-control" id="address2" placeholder="oo번지">
            </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">회원 가입</button>
        </form>
      </div>
    </div>
  </main>


  </#macro>
  <#macro script>



    </script>
  </#macro>
  <@page/>
