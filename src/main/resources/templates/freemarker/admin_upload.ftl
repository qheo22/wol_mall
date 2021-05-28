<#include "layout/admin_page.ftl">
<#macro content>
    <div style="display: none">
        <input type="file" id="import_image" accept="image/*" style="display: none"
               onchange="onSelectImage(event)">
    </div>
    <!-- Cotents -->
    <div class="col-lg-12">
        <form>
            <!-- Section -->
            <div class="section">
                <h4>이미지 업로드</h4>
                <div class="form-group row">
                    <div class="file_upload col-sm-10">
                        <p class="btn btn_sm btn-file" id="btn_main_image_upload">
                            파일 선택
                        </p>
                        <span>최대 업로드 파일 크기: 3.00 MB : <em id="upload_result">????</em></span>
                        <div class="img" id="main_image_layout">
                            <img id="image_main" alt="">
                        </div>
                    </div>
                </div>

                <button class="btn btn-block" onclick="onClickGetData()">신규멤버수 확인용</button>
<#--                임시버튼 -->
                <button class="btn btn-block" onclick="onClickLogout()">로그아웃</button>

            </div>
        </form>
    </div>
    <!-- Cotents End -->
</#macro>
<#macro script>
    <script>
       $(function () {
           $('#btn_main_image_upload').click(function (e) {
               e.preventDefault();
               selectMainImageFile();
           });
       });

       function selectMainImageFile() {
           $('#import_image').click();
       }

       function onSelectImage() {

           let file = document.getElementById('import_image');

           if (checkSize(file, 3)) {
               // 용량 초과
               file.value = '';
               alert("3MB 이상의 파일을 업로드 할 수 없습니다.")
               return;
           }

           if (file.files[0].size === 0) {
               console.log('선택된 파일 없음');
               return;
           }

           let fileReader = new FileReader();
           fileReader.onloadend = function (e) {


               if (e.target.readyState === FileReader.DONE) {
                   let path = (window.URL || window.webkitURL).createObjectURL(file.files[0]);
                   $('#image_main').attr('src', path);
               }

               uploadImage();
           };

           fileReader.readAsDataURL(file.files[0]);
       }

       function onClickLogout() {
           localStorage.removeItem('jwt');
           location.href = '/logout';
       }


       function onClickGetData(){

           var request = new XMLHttpRequest();

           request.open("POST", '/api/admin/getDashboardData', false);
           request.send()


       }


       function uploadImage() {

           if (document.getElementById('import_image').files.length === 0) {
               // 비디오 파일 없음
               console.log('이미지 업로드 파일 없음');
           } else {
               const file = document.getElementById('import_image').files[0];
               const request = new XMLHttpRequest();
               request.addEventListener("load", function () {
                   if (request.status === 200 || request.status === 201) {
                       console.log('업로드 url = ' + this.responseText);
                       let json = JSON.parse(this.responseText);
                       $('#image_main').attr('src', json.data.resultUrl);
                       $('#upload_result').text(json.data.resultUrl);
                   } else if (request.status === 500) {
                       console.error('업로드 error = ' + this.responseText);
                       alert("업로드 실패 : 다른 파일을 선택해주세요");
                   }
               })

               const formData = new FormData();

               formData.append('data', file);

               request.open("POST", '/api/admin/upload', false);
               request.send(formData);
           }
       }
    </script>
</#macro>
<@page/>
