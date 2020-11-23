<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<c:choose>
	<c:when test="${pofile > 0}">
			<script>
				alert("회원정보 변경이 완료되었습니다.");
				location.href = "main.do";
				self.close();
			</script>
		</c:when>
		<c:when test="${pofile <= 0}">
			<script>
				alert("회원정보 변경이 실패하였습니다.");
				location.href = "main.do";
			</script>
		</c:when>
		
		<c:when test="${logout > 0}">
			<script>
				alert("로그아웃 되었습니다.");
				location.href = "main.do";
			</script>
		</c:when>
		<c:when test="${logout <= 0}">
			<script>
				alert("로그아웃이 실패하였습니다.");
				location.href = "main.do";
			</script>
		</c:when>
		
		<c:when test="${check > 0}">
			<script>
				alert("회원가입 성공");
				location.href = "main.do";
				self.close();
			</script>
		</c:when>
		<c:when test="${check <= 0}">
			<script>
				alert("가입실패");
				location.href = "main.do";
			</script>
		</c:when>
		<c:when test="${pwchange > 0}">
			<script>
				alert("비밀번호 변경 성공");
				location.href = "main.do";
				self.close();
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("비밀번호 변경 실패");
				location.href = "main.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>