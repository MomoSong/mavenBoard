<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾��� �Խ���</title>


<script type="text/javascript">
	function goback(){
		window.history.back();
	}

	
</script>

</head>
<body>


<form action = "./insertPro.ino" method="post" style="text-align: left;">	
	
	���� : <input type="text" name="title"/><br/>
	���� : <textarea rows="20" cols="60" name="content" ></textarea><br/>
	�̸� : <input type="text" name="name"/><br/>
	
	<button type="submit" >�۾���</button>
	<button type="reset" >����</button>
	<button type="button" onclick="goback()">���</button>
</form>


</body>
</html>