<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
  <head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <title>게시판 리스트</title>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#formBtn").click(function(){
//     			alert("hihi");
    			location.href = "main.ino?search="+$("#text").val()+"&searchType="+$("#searchType").val();
    			
    		});
    		
    		$("#text").keydown(function(event){
//     			$("#formBtn").trigger('click');
    			if(event.which == 13){
    				alert(13);
//     				$("#formBtn").trigger('click');
    			};
    		});
    		
    		$("#btnWrite").click(function(){
    			location = "insert.ino";
    		});
    	});

    </script>
    
  </head>
  <body>
  
  
  
    <h1>게시판 리스트</h1>
    
    <form action="./main.ino" method="get" style="float: left;">
	  <div class="form-inline">
	    <label for="text">검색:</label>
	    <input type="text" id="text" class="form-control" >
	    <select id="searchType" class="form-control" >
		  <option value="t">제목</option>
		  <option value="c">내용</option>
		  <option value="tc">제목+내용</option>
		</select>
	    <button type="button" id="formBtn" class="btn btn-default">검색</button>
	  </div>
	  
	</form>
    
    
	<table width="600" style ="table-layout: fixed;">
		<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${freeBoardDto }" var="dto">
			<tr>
				<td>${dto.num }</td>
				<td>${dto.title }</td>
				<td><a href="./detail.ino?num=${dto.num }">${dto.content }</a></td>
				<td>${dto.name }</td>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><button id="btnWrite" class="btn-warning" type="button" onclick="btnWrite" >글쓰기</button></td>
		</tr>
		</tbody>
<!-- 
		<tfoot>
			<tr>
			<td colspan="5">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:if test="${pagingUtil.first }">
			  	<li>
			  	<a href="main.ino?page=1&perPageNum=${pagingUtil.perPageNum }">첫</a>
			  	</li>
			  	</c:if>
			    <c:if test="${pagingUtil.prev }">
					  <li>
					  	<a href="main.ino?page=${pagingUtil.startPage-1 }&perPageNum=${pagingUtil.perPageNum}">
					  		<span class="glyphicon glyphicon-chevron-left"></span>	
					  	</a>
					  </li>
				</c:if>
			    <c:forEach begin="${pagingUtil.startPage }" end="${pagingUtil.endPage }" var="idx">
			    	<li ${pagingUtil.page==idx?" class='active' ":"" }>
					  	<a href="main.ino?page=${idx }&perPageNum=${pagingUtil.perPageNum}">${idx }</a>
					</li>
			    </c:forEach>
			    <c:if test="${pagingUtil.next }">
					  <li>
					  	<a href="main.ino?page=${pagingUtil.endPage+1 }&perPageNum=${pagingUtil.perPageNum}">
					  		<span class="glyphicon glyphicon-chevron-right"></span>
					  	</a>
					  </li>
				</c:if>
				<c:if test="${pagingUtil.end }">
				<li>
			  	<a href="main.ino?page=${pagingUtil.totalPage }&perPageNum=${pagingUtil.perPageNum }">끝</a>
			  	</li>
			  	</c:if>
			  </ul>
			</nav>
			</td>
			</tr>
		</tfoot>
		
-->
	</table>	
	${pageResult }
  </body>
</html>