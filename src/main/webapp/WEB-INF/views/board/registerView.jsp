<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"> 

	$(document).ready(function(){
		/* 저장 폼 */
		var formObj = 	$("form[name='writeForm']")
		$(".write_btn").on("click",function(){
			if(fn_valiChk()){
				return false;
			}
			
			formObj.attr("action","register");
			formObj.attr("method","post");
			formObj.submit();
		})
		
	})
	
	/* 널 체크 */
    function fn_valiChk(){
    	var regForm = $("form[name='writeForm'] .chk").length;
    	for (var i =0; i<regForm; i++){
    		if($(".chk").eq(i).val() == "" ||$(".chk").eq(i).val() == null) {
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

tr{
	margin:10px 0;
	width:100%;
	height:1px;
	background-color:#888;
}


#root{
	padding-top: 40px;
}


#button-groups{
	text-align: right;
}
</style>
	
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
		<div class="container">	
			<header>
				<div id="logo">
					<h2>게시글 작성</h2> 
				</div>
			</header>
			<hr />
			<section id="container"> <!--  method="post" action="/board/write" -->
				<form name="writeForm" role="form">	<!-- 파일 첨부를 위한 enctype -->
					<div class="form-horizontal">
						<%-- <label for="date"><c:out value="${today}"/></label><input type="text" id="date" name="date" /> --%>
						<div class="form-group">
							<label for="title" class="col-md-2 control-label">제목</label>
							<div class="col-md-8">
								<input type="text" id="title" name="title" class="chk form-control" title="제목을 입력하세요"/>
							</div>
						</div>
						<div class="form-group">
							<label for="content" class="col-md-2 control-label">내용</label>
							<div class="col-md-8">
								<textarea id="content" name="content" class="chk form-control" rows="10" title="내용을 입력하세요"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="writer" class="col-md-2 control-label">작성자</label>
							<div class="col-md-8">
							<%-- 	<input type="text" readonly="readonly" id="writer" name="writer" value = "${member.userId}" class="chk form-control" title="작성자를 입력하세요" />--%>	
							<input type="text" id="writer" name="writer" class="chk form-control" title="작성자를 입력하세요" />
							</div>
						</div>
					<!-- 	<div class="form-group">
							<label for="fileUpload" class="col-md-2 control-label">파일 업로드</label>
							<div class="col-md-8">
								<input type="file" id="file" name="file" />
							</div>
						</div> -->
					</div>
						<hr />
					<div id="button-groups">
						<button class="write_btn btn btn-primary">작성</button>
						<button type="button" class="btn btn-default" onclick="location.href='boardList'">취소</button>
					</div>
				</form>
			</section>
					
		</div>
	</body>
</html>