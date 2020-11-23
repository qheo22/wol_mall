<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html>

<style>
.price_consumer{
text-decoration:line-through;
}

</style>
<head>
   <title>Home</title>
</head>
<body>

<c:set var="i" value="0" />
<c:set var="j" value="3" />
<table>
<c:forEach items="${items}" var="list">
<c:if test="${i%j == 0 }"> <tr> </c:if>
<td>
<div>

   <a href="item_detail.do?item_code=${list.item_code}"><img src="${list.item_path}" height="400" width="400"></a><br>
            <div style="text-align: center;">${list.item_name}</div>
            <div style="text-align: center;">
            <span class="discount">${list.item_discount}</span>
            <span class="price_consumer">${list.item_price_consumer}원</span>
            <strong class="price_sell">${list.item_price_sell}원</strong>
             </div>
      </div>
      </td>
    <c:if test="${i%j == j-1 }">
    </c:if> <c:set var="i" value="${i+1 }" />
    
	</c:forEach>
	</table>
</body>

</html>