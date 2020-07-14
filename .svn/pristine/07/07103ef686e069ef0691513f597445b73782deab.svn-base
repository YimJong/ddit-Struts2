<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<script>
$(function(){
	$('#board_content').summernote({
		lang: 'ko-KR',
		height: 150,
		codemirror: {
		theme: 'monokai'
	}
	});

	$('#noticeboardForm').submit(function(){
		if($('input[name=board_title]').val() == "") {
			alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	if($('input[name=board_nickname]').val() == "") {
    		alert('대화명을 입력해주세요');
    		return false;
    	}
    	$(this).attr('action','${pageContext.request.contextPath }/admin/question/insertQuestion.do');
    	$(this).append('<input type="hidden" name="board_content" value="'+$('#board_content').summernote('code')+'"></input>');
	});
	
	$('#questionListBTN').click(function(){
		location.href = '${pageContext.request.contextPath}/admin/question/questionList.do';
	});
	
/* 	$('#insertBtn').click(function(){
		
		var board_title = $('#board_title').val();
		var board_writer = $('#board_writer').val();
		var board_content = $('#board_content').val();
		
    	location.href='${pageContext.request.contextPath}/admin/question/insertQuestion.do?board_title='+board_title
    			+'&board_content='+ board_content
    			+'&board_writer='+ '${LOGINUSER.mem_id}';
    }); */
});
</script>
</head>
<body>
<form id="noticeboardForm" class="form-horizontal" role="form" action="" method="post"
	enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_nickname">작성자 대화명:</label>
		
		<div class="col-sm-10"> 
		<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id }"></input>
			<input type="text" class="form-control" id="board_nickname" name="board_nickname" placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content">내용을 입력해주세요..</div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right" id="insertBtn">등록</button>
			<button type="button" class="btn btn-primary" style="float: right" id="questionListBTN">목록</button>
		</div>
	</div>
</form>	
</body>
</html>