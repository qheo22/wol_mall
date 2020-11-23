<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>

<style>
#select_item{
margin:0px; padding:0px;
}

.appen_li{
list-style: none;

}
.item_count{
 text-align:right;
}

#append_span{

background-color: aqua;
}

.tda{
width:200px;
}

.abdd{
width:200px;
text-align: right;
}

.item_count{
width:30px;
}
</style>

</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>





var tempArray = new Array();
var cartArray = new Array();
var cartArray1 = new Array();
var cartlist = new Array();

var total_count;
var sum;


   
   function checkbb(){
    item_name =  $(".item_name").html();
    alert("카트에 담긴건?"+item_name);
    alert("왜암것도 안나와"${item_count})
     }

  function asdww(){
   alert("카트리스트의 길이"+cartlist.length);
   alert("카트리스트의 길이"+cartlist);
   }




function total_sum(){
 var abc = ${dto.item_price_sell}*total_count
$(".total_sum").html(abc);
}


function count_check(){
   alert("총 구매갯수"+total_count);
}


function list_option(){
 color_select = $("#color_select option:selected").val();
 size_select = $("#size_select option:selected").val();
if(color_select==""){
    alert("색상 선택부터 해주세요");
    $("#size_select").val("");
   }
else if(color_select!="" && color_select!=""){
 for(var i = 0; i<=tempArray.length; i++){
         if(tempArray.length==0){
            $('.select_item').append('<li class="appen_li" id="li'+tempArray.length+'" value="">'+'<span class="size" >'+size_select+'</span>'+'<span class="color" >'+color_select+'</span>'+'<input type="text" class="item_count"; id="amount'+tempArray.length+'"; name="'+size_select+color_select+'"; value="1"; readonly="readonly">'
                +'<a href="javascript:button_up_click('+tempArray.length+')"><img src="/mvc/resources/Images/위버튼.JPG" style="width: 15px;">'+'</a>'+
                '<a href="javascript:button_down_click('+tempArray.length+')"><img src="/mvc/resources/Images/아래버튼.JPG" style="width: 15px;">'+'</a>'+
                '<Strong class="select_price">'+'<span class="price" id="price'+tempArray.length+'" >'+${dto.item_price_sell}+'</span>'+'원'+'</strong>'+'<a href="javascript:item_delete('+tempArray.length+')"><img src="/mvc/resources/Images/x_button.JPG" style="width: 15px;">'+'</a>'+'</li>');
            size_select = $("#size_select option:selected").val();
         color_select = $("#color_select option:selected").val();
         tempArray.push(size_select+color_select);            
            $("#size_select").val("");
            $("#color_select").val("");
            total_count = 1;
            total_sum();
      break;
    }else{

         if(tempArray[i] == size_select+color_select){
            alert("이미 선택한 옵션 입니다.");
            $("#size_select").val("");
               $("#color_select").val("");
            break;

         }else if(tempArray[i] != size_select+color_select){

            for(var j= i; j>=tempArray.length; j++){
               if(tempArray[j] == size_select+color_select){
               alert("이미 선택한 옵션 입니다.");
               $("#size_select").val("");
                  $("#color_select").val("");
                  break;
            }else if(tempArray[j] != size_select+color_select){
                $('.select_item').append('<li class="appen_li" id="li'+tempArray.length+'" value="">'+'<span class="size" >'+size_select+'</span>'+'<span class="color" >'+color_select+'</span>'+'<input type="text" class="item_count"; id="amount'+tempArray.length+'"; name="'+size_select+color_select+'"; value="1"; readonly="readonly">'
                         +'<a href="javascript:button_up_click('+tempArray.length+')"><img src="/mvc/resources/Images/위버튼.JPG" style="width: 15px;">'+'</a>'+
                         '<a href="javascript:button_down_click('+tempArray.length+')"><img src="/mvc/resources/Images/아래버튼.JPG" style="width: 15px;">'+'</a>'+
                         '<Strong class="select_price">'+'<span class="price" id="price'+tempArray.length+'" >'+${dto.item_price_sell}+'</span>'+'원'+'</strong>'+'<a href="javascript:item_delete('+tempArray.length+')"><img src="/mvc/resources/Images/x_button.JPG" style="width: 15px;">'+'</a>'+'</li>');
                     size_select = $("#size_select option:selected").val();
                  color_select = $("#color_select option:selected").val();
                  tempArray.push(size_select+color_select); 
                  $("#size_select").val("");
                  $("#color_select").val("");
              total_count += 1;
               total_sum();
               return;
            
            }
         }
       }

   }
}
}
}




function item_delete(amount){
 total_count -= $('#'+'amount'+amount).val();
 $('#'+'li'+amount).remove();
 tempArray.splice(amount,1);
 total_sum()
}

function button_up_click(amount){
 var count = $('#'+'amount'+amount).val();
 var up_count = Number(count)+1;
 $('#'+'amount'+amount).val(up_count);
 $('#'+'price'+amount).html(${dto.item_price_sell}*$('#'+'amount'+amount).val());
 total_count += 1;
 total_sum()
}

function button_down_click(amount){
 var count = $('#'+'amount'+amount).val();
 
 if(count!=1){
 var down_count = Number(count)-1;
 $('#'+'amount'+amount).val(down_count);
 $('#'+'price'+amount).html(${dto.item_price_sell}*$('#'+'amount'+amount).val());
 total_count -= 1;
 total_sum()
}
if(count==1){
 alert("최수수량입니다");
}
}


function checkIt() {

	console.log(${item_count})

	

var color_select = $("#color_select option:selected").val();
var size_select = $("#size_select option:selected").val();



$(".appen_li").each(function(){
  console.log("텍스트값"+$(this).text());
  item_name =  $(".item_name").html();
  size = $(this).find('.size').text();
  color = $(this).find('.color').text();
  count = $(this).find('.item_count').val();
  price = $(this).find('.price').text();
  cartArray.push(size+","+color+","+count+","+price+","+item_name);
})


if(color_select==false && tempArray.length == 0){
 alert("컬러를 선택해주세요");
 return false;
}


if(size_select==false && tempArray.length == 0){
 alert("사이즈를 선택해주세요");
 return false;
 }

if(tempArray.length != 0){
 location.href="order.do?cartArray="+cartArray;
 }
 
}
	



</script>



      
<body>
<input type="button" value="랭스확인" onclick="checkbb()"><br>
<input type="button" value ="수량체크" onclick="total_sum1()">

<h1>
이 페이지 기능 중복선택 제거/버튼으로 수량 설정 선택한상품 삭제
</h1>
<h1>
수량변경시 우측 금액변경 및 총상품금액 변경
</h1>
<div style="width:900px;">
<div style="float:left; width:500px; height:600px;">
<img src="${dto.item_path}" height="500" width="400">
</div>
  <div style="float:left; width:400px; height:500px;">
  <h3 class="item_name">${dto.item_name}</h3>
<table>
<tr><td class="tda"><div>판매가</div></td><td class="abdd"><div>${dto.item_price_sell}원</div></td></tr>
<tr><td class="tda">적립금</td><td class="abdd"><fmt:parseNumber value="${dto.item_price_sell/100}" integerOnly="true"/>원</td></tr>
<tr><td class="tda">상품리뷰</td><td class="abdd">아직없음</td></tr>

<tr><td class="tda">컬러</td><td class="abdd">
      <select id="color_select" name="color_select" onchange="">
               <option value="" >옵션선택</option>
               <c:forEach var="i" items="${dto.item_color}" begin="0" end="5">
               <option value="${i}">${i}</option>
            </c:forEach>
      </select></td></tr>
<tr><td class="tda">사이즈</td><td class="abdd">
      <select id="size_select" name="size_select" onchange="list_option()">
               <option value="" >옵션선택</option>
               <c:forEach var="i" items="${dto.item_size}" begin="0" end="5">
               <option value="${i}">${i}</option>
            </c:forEach>
      </select></td></tr>

      <tr id="tr_list">
      <td colspan="2">
      <ul class="select_item">
      </ul>
      </td>
      <tr><td><div><span>총상품금액 </span><span class ="total_sum">움직일 가격</span><span>원 </span></div> </td></tr>
      <tr><td class="tda"><a>장바구니</a></td><td class="abdd">관심상품</td></tr>
         <tr><td><a href="javascript:checkIt()">구매하기</a></td></tr>
</table>
</div>
</div>

</body>
</html>