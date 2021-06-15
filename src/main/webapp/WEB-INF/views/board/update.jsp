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
		var formObj = $("form[name = 'updateForm']");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'list') {
				self.location="boardList";	
				return;
			} 
			
			if(fn_valiChk()){
				return false;
			}
			formObj.submit();
		});
	});
	
	/* 널값 체크*/
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i =0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	
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

#root{
	padding-top: 40px;
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
					<h2>게시글 수정</h2>
				</div>
			</header>
			<hr />
	
			<section id="container"> 
				<form name="updateForm" role="form" method="post" action="/board/update" >
					<input type="hidden" name="bno" value="${board.bno}" readonly="readonly"/>
					<div class="row" id="board-content">
						<div class="col-md-8">
							<label for="title">제목</label>
							<input type="text" class="chk form-control" title="제목을 입력하세요" id="title" name="title" value="${board.title}"/>
						</div>
			
						<div class="col-md-8">
							<label for="content">내용</label>
							<textarea id="content" class="chk form-control" title="내용을 입력하세요" rows="12" name="content" ><c:out value="${board.content}" /></textarea>
						</div>
				
						<div class="col-md-8">
							<label for="writer">작성자</label>
							<input type="text" class="chk form-control" title="작성자를 입력하세요" id="writer" name="writer" value="${board.writer}" />
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
						<button type="submit" data-oper='update' class="update_btn btn btn-primary">저장</button>
						<button type="submit" data-oper='list' class="cancel_btn btn btn-default">목록</button>
					</div>
				</form>
			</section>
	
		</div>
	</body>
</html>