<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글쓰기 게시판</title>


<script type="text/javascript">
	function goback(){
		window.history.back();
	}

	
</script>

</head>
<body>


<form action = "./insertPro.ino" method="post" style="text-align: left;">	
	
	제목 : <input type="text" name="title"/><br/>
	내용 : <textarea rows="20" cols="60" name="content" ></textarea><br/>
	이름 : <input type="text" name="name"/><br/>
	
	<button type="submit" >글쓰기</button>
	<button type="reset" >삭제</button>
	<button type="button" onclick="goback()">취소</button>
</form>


</body>
</html>