
<#include "layout/admin_page.ftl">
<#macro content>
    <!-- Cotents -->
    <div class="cont_wrap_full">
        <div class="cont_box">
            <div class="login_box login_crypto">
                <h1><img src="../assets/img/logo_login_crypto.png" alt="">wol_mall <span class="tblue1">Admin</span>
                </h1>
                <form>
                    <div class="form-group">
                        <label class="label">아이디</label>
                        <input type="text" class="form-control" placeholder="이메일을 입력하세요" id="username">
                    </div>
                    <div class="form-group">
                        <label class="label">비밀번호</label>
                        <div class="input_group">
                            <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="password">
                            <i class="eye"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-block" onclick="requestLoginApi()">로그인</button>
                    </div>
                    <div class="form-group d-flex justify-content-between">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1">계정 기억하기</label>
                        </div>
                        <!-- <a href="#">비밀번호를 잊으셨나요?</a> -->
                    </div>
                    <!--
						<div class="text-center">
							<span>아직 계정이 없으신가요?</span>
							<a href="#">회원가입</a>
						</div>
                    -->
                </form>
            </div>
        </div>
    </div>
</#macro>
<#macro script>

    <script type="text/javascript">

         $(document).ready(function () {
             document.getElementById('username').setAttribute('value', localStorage.getItem('loginid') === null ? '' : localStorage.getItem('loginid'));
             $('#defaultCheck1').prop('checked', localStorage.getItem('loginid') === null || localStorage.getItem('loginid').length === 0 ? false : true);

             $("#username").keypress(function (e) {
                 if (e.which === 13) {
                     $("#password").focus().select();
                 }
             });

             $("#password").keypress(function (e) {
                 if (e.which === 13) {
                     requestLoginApi();
                 }
             });
         });

        function requestLoginApi() {

            if ($('#username').val().length === 0) {
                alert('이메일을 입력해주세요.');
                return;
            }

            if ($('#password').val().length === 0) {
                alert('비밀번호를 입력해주세요.');
                return;
            }

            var request = new XMLHttpRequest();
            request.onload = function () {

                if (request.status === 200 || request.status === 201) {

                    let isChecked = $('#defaultCheck1').is(":checked");

                    let data = JSON.parse(request.responseText).accessToken;

                    if (null != data) {
                        localStorage.setItem("jwt", data)
                    }

                    // 로그인 계정 로컬에 저장
                    localStorage.setItem('loginid', isChecked ? $('#username').val() : '');

                    location.href = '/admin/upload';

                } else if (request.status === 401) {
                    // 입력정보 오류
                    let code = JSON.parse(request.responseText).errorCode;
                    let msg;
                    switch (code) {
                        case '40101' :
                            // 비밀번호 틀림
                            msg = '입력하신 이메일 또는 비밀번호가 잘못되었습니다.';
                            break;
                        case '40102' :
                            // 비활성화 계정
                            msg = '비활성화 계정입니다. 고객센터에 문의하세요.';
                            break;
                        case '40103' :
                            // 정지된 계정
                            msg = '정지된 계정입니다. 고객센터에 문의하세요.';
                            break;
                        default:
                        case '40199' :
                            // 알수없는 오류 고객센터 문의
                            msg = '알수없는 오류입니다. 고객센터에 문의하세요.';
                            break;
                    }
                    alert(msg);
                    // document.getElementById('password').setAttribute('value', '');
                } else {
                    console.error("에러"+request.responseText);
                }
            }

            request.open('POST', '/api/auth/login.do', false);
            request.setRequestHeader('Content-Type', 'application/json');

            var data = {
                username: $('#username').val(),
                password: $('#password').val(),
            };

            request.send(JSON.stringify(data));
        }

    </script>
</#macro>
<@page/>

