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
	var actionForm = $("form[name='actionForm']");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
});
</script>


<style>
header {
	margin-top: 70px;
}

#nav {
	padding-top: 30px;
	text-align: right;
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
					<h2>공지 게시판</h2>
				</div>
			</header>
			<div id="nav">
				<a href="registerView">글 작성</a>
			</div>

			<section id="container">
				<table class="table table-hover">
					<tr>
					 	<th>No</th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>최종 수정일</th>
					</tr>
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.rnum}" /></td>
							<td>
								<a href="/board/read?bno=${list.bno}">
									<c:out value="${list.title}" />
								</a>
							</td>
							<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			
				<hr/>
				
				<br/>
				
				<form name="actionForm" action="/board/boardList" method="get">
					<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
					<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
				</form>
				<!-- 페이징 -->
				<div class="col-md-offset-3">
					<ul class="pagination">
					  	<c:if test="${pageMaker.prev}">
					    	<li class="paginate_button previous">
					    		<a href="${pageMaker.startPage - 1}" class="glyphicon glyphicon-chevron-left" role="button"></a>
					    	</li>
					    </c:if> 
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
					    	<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
					    		<a href ="${num}">${num }</a>
					    	</li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li class="paginate_button next">
					    		<a href="${pageMaker.endPage + 1}" class="glyphicon glyphicon-chevron-right" role="button"></a>
					    	</li>
					    </c:if> 
					</ul>
				</div>  
			</section>
		</div>
	</body>
</html>