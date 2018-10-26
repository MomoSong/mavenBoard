<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시판 글보기</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.slim.js"
  integrity="sha256-fNXJFIlca05BIO2Y5zh1xrShK3ME+/lYZ0j+ChxX2DA="
  crossorigin="anonymous">
</script>

<script type="text/javascript">
	function goback(){
		window.history.back();
	}
	
	$(document).ready(function() {
		$('#deleteBtn').click(function(){
			$('#form').attr('action', './delete.ino');
			$('#form').submit();
			
		});
	});

	
	
</script>

</head>
<body>

<form id="form" action = "./modify.ino" method="post" style="text-align: left;" name="boardForm" >	
	<input type="number" name="num" hidden="true" value="${dto.num }"/><br/>
	제목 : <input type="text" name="title" value="${dto.title }"/><br/>
	날짜 : <input type="text" name="regdate" value="${dto.regdate }" /><br/>
	내용 : <textarea rows="20" cols="60" name="content">${dto.content }</textarea><br/>
	이름 : <input type="text" name="name" value="${dto.name }"/><br/>
	
	<button type="submit" >수정</button>
	<button type="button" id="deleteBtn" >삭제</button>
	<button type="button" onclick="goback()">취소</button>
</form>



</body>
</html>