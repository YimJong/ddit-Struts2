<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
	
    $('.leftmenu').removeClass('active');
    $('.board2').addClass('active');
    
    
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#board_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#listBtn').click(function(){
    	$(location).attr('href','${pageContext.request.contextPath }/user/freeboard/freeboardList.do');
    });
    
    $('#freeboard').submit(function(){
    	
    	if($('input[name=board_title]').val() == "") {
    		infoMsg('제목을 입력해주세요.');
    		return false;
    	}
    	
    	if($('input[name=board_nickname]').val() == "") {
    		infoMsg('대화명을 입력해주세요');
    		return false;
    	}
    	
    	if(eval('${empty LOGIN_MEMBERINFO}')){
    		infoMsg('로그인 후 이용 가능합니다.');
    		return false;
    	}
    	
    	
	    	var board_content = $('#board_content').summernote('code'); 
	    	$(this).append('<input type="hidden" name="board_content" value="'+board_content+'" />');
			$(this).append('<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id}" />');
			$(this).append('<input type="hidden" name="board_group" value="${param.board_group}" />'); 
			$(this).append('<input type="hidden" name="board_seq" value="${param.board_seq}" />'); 
			$(this).append('<input type="hidden" name="board_depth" value="${param.board_depth}" />'); 
			$(this).attr('action','${pageContext.request.contextPath }/user/freeboard/replyFreeboardSubmit.do');
	  
    });
    
    
    function infoMsg(value) {
    	BootstrapDialog.show({
    	    title: '알림',
    	    message: value
    	});
    }
    
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No :</label>
  		 <p class="form-control-static">${param.rnum }</p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static">${param.board_title}</p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">의 댓글</p>
	 </div>
</div>
<hr />
<form id="freeboard" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="board_nickname" name="board_nickname" >
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" style="float: right;">답글등록</button>
			<button type="reset" class="btn btn-danger">취소</button>
			<button id="listBtn" type="button" class="btn btn-info">목록</button>
		</div>
	</div>
</form>
</body>
</html>