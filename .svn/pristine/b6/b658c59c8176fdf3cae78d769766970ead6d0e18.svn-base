<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>

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
    	
    	if(eval('${empty LOGIN_MEMBERINFO}')){
    		alert('로그인 후 이용 가능합니다.');
    		return false;
    	}
    	
		//$(this).append('<input type="hidden" name="board_writer" value="${LOGINUSER.mem_id}"/>');
		$(this).append('<input type="hidden" name="board_writer" value="admin"/>');
		$(this).append('<input type="hidden" name="board_content" value="' + $('#board_content').summernote('code') + '"/>');
		$(this).attr('action', '${pageContext.request.contextPath}/file/noticeboardfileUpload.do');
	});
	
	$('#noticeboardListBTN').click(function(){
		location.href = '${pageContext.request.contextPath}/admin/noticeboard/noticeboardList.do';
	});
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
			<input type="text" class="form-control" id="board_nickname" name="board_nickname" value="관리자" disabled/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content">내용을 입력해주세요..</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="files">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" notice-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="files">첨부파일2:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file02" name="files" notice-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="reset" class="btn btn-danger" style="float: right">취소</button>
			<button type="button" class="btn btn-primary" style="float: right" id="noticeboardListBTN">목록</button>
		</div>
	</div>
</form>	
</body>
</html>