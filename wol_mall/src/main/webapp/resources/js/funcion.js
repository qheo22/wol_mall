



   var tempArray = new Array();
   var cartArray = new Array();
   var cartArray1 = new Array();
   var cartlist = new Array();

   var total_count;
   var sum;

   
 	function checkbb(){
    	alert("카트에 담긴건?");
        }
        

     function asdww(){
      alert("카트리스트의 길이"+cartlist.length);
      alert("카트리스트의 길이"+cartlist);
      }


   
function count_check(){
      alert("총 구매갯수"+total_count);
   }


function item_delete(amount){
    total_count -= $('#'+'amount'+amount).val();
    $('#'+'li'+amount).remove();
    tempArray.splice(amount,1);
    total_sum()
}



 function checkIt() { //유효성 검사

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


