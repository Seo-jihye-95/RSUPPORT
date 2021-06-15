<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	// 수정 
	$("#update_btn").on("click", function(){
		formObj.attr("action", "/board/update");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	
	// 삭제
	$("#delete_btn").on("click", function(){
		var deleteYN = confirm("삭제하시겠습니까?");
		
		if(deleteYN == true){
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
		};
	})
	
	// 목록
	$("#list_btn").on("click", function(){
		location.href = "/board/boardList";
	})


})	// 기능 끝

</script>
	
<style>
header {
	margin-top: 70px;
}

#board-content{
	margin:0 auto;
}

#board-content > div {
	margin-bottom: 15px;
}

</style>

<html>
	<head>
	 	<title>공지 게시판</title>
	</head>
	<body>
		<div class="container">	
			<header>
				<div id="logo">
					<h2>게시글</h2>
				</div>
			</header>
		<hr />
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${board.bno}" />
			</form>
				<div class="row" id="board-content">
					<div class="col-md-8">
						<label for="title">제목</label>
						<input type="text" class="form-control" id="title" name="title" readonly="readonly" value="${board.title}"/>
					</div>
		
					<div class="col-md-8">
						<label for="content">내용</label>
						<textarea id="content" class="form-control" rows="12" name="content" readonly="readonly"><c:out value="${board.content}" /></textarea>
					</div>
			
					<div class="col-md-8">
						<label for="writer">작성자</label>
						<input type="text" class="form-control" id="writer" name="writer" readonly="readonly" value="${board.writer}" />
					</div>
				
					<div class="col-md-8">
						<label for="regdate">작성일</label>
						<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/>					
					</div>
					
					<div class="col-md-8">
						<label for="updateDate">최종수정일</label>
						<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/>					
					</div>
				</div>
				
				<hr />
				
				<div id="button-groups">
					<button type="submit" id="update_btn" class ="btn btn-warning">수정</button>
					<button type="submit" id="delete_btn" class ="btn btn-danger">삭제</button>
					<button type="submit" id="list_btn" class ="btn btn-default">목록</button>
				</div>
			</section>
		</div>
	</body>
</html>