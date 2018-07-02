<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>注文一覧画面</title>
</head>
<%@ include file="../common/adminHeader.jsp" %>
<body>
	<script>
		$(window).on('load resize', function(){
	    // navbarの高さを取得する
	    	var height = $('.navbar').height();
	    // bodyのpaddingにnavbarんぼ高さを設定する
	    	$('body').css('padding-top',height); 
		});
	</script>
	
	<div align="center">

<h1>注文一覧画面</h1>

	<c:choose>
		<c:when test="${orderListEmptyChecker == true}">
		<font color="red"><c:out value="${EmptyError}"/></font>
		<hr>
		<p align="center">
		</p>
		</c:when>
		<c:when test="${orderListEmptyChecker == false}">
<div class="table-responsive">
<table class="table table-striped">
      	<tr>
        <th nowrap>注文番号</th>
        <th nowrap>日付</th>
        <th nowrap>利用者名</th>
        <th nowrap>現在のステータス</th>
        <th nowrap>総計(税込)</th>
      </tr>
      <c:forEach var="order" items="${orderList}">
      <tr>
        <td><a href="${pageContext.request.contextPath}/admin/viewOrderDetail?orderId=${order.id}&update=false"><c:out value="${order.orderNumber}"/></a></td>
        <td><c:out value="${order.orderDate}"/></td>
        <td><c:out value="${order.user.name}"/></td>
        <td>
       
        <c:choose>
        	<c:when test="${order.status == 0}">
        		購入前
        	</c:when>
        	<c:when test="${order.status == 1}">
        		未入金
        	</c:when>
        	<c:when test="${order.status == 2}">
        		入金済み
        	</c:when>
        	<c:when test="${order.status == 3}">
        		発送済み
        	</c:when>
        	<c:when test="${order.status == 9}">
        		キャンセル
        	</c:when>	
        </c:choose>
        </td>
        <td><fmt:formatNumber value="${order.totalPrice}" pattern="###,###円"/></td>
      </tr>
      </c:forEach>
    </table>
    </div>
    <br>
    </c:when>
    </c:choose>
    <a href="${pageContext.request.contextPath}/admin/menu">メニューに戻る</a>
    </div>
	
</body>
</html>