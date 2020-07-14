<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
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
    
    $('#board_title').val('${freeboardInfo.board_title}');
    $('#mem_id').val('${freeboardInfo.board_writer}');
    $('#board_content').summernote('code','${freeboardInfo.board_content}');
    
    
	$('#freeboard').submit(function(){
    	
		if($('input[name=board_title]').val() == "") {
    		infoMsg('제목을 입력해주세요.');
    		return false;
    	}
    	
    	if($('input[name=board_nickname]').val() == "") {
    		infoMsg('대화명을 입력해주세요');
    		return false;
    	}
    	
    	if('${LOGIN_MEMBERINFO.mem_id}'!= ('${freeboardInfo.board_writer}')){
    		infoMsg('등록자만 수정할 수 있습니다.');
    		return false;
    	}
		
    		$(this).attr('action', '${pageContext.request.contextPath}/user/freeboard/updateFreeboard.do');
    		$(this).append('<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id}"></input>');
    		$(this).append('<input type="hidden" name="board_content" value="'+ $('#board_content').summernote('code')+'"></input>');
    		$(this).append('<input type="hidden" name="board_no" value="${freeboardInfo.board_no}"></input>');
    	
    });
	
	
	$('#writeBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/user/freeboard/freeboardForm.do';
    });
	
	$('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/user/freeboard/freeboardList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}';
    });
	$('#replyBtn').click(function(){
		if(eval('${!empty LOGIN_MEMBERINFO}')){
    		var board_title = encodeURIComponent('${freeboardInfo.board_title}');
    		var queryString = '?rnum=${param.rnum}&board_title=' + board_title;
        	// dept 도 같이 가져가야 한다.
        	var parentInfo = '&board_group=${freeboardInfo.board_group}&board_seq=${freeboardInfo.board_seq}&board_depth=${freeboardInfo.board_depth}';
        	$(location).attr('href', '${pageContext.request.contextPath}/user/freeboard/freeboardReplyForm.do' + queryString + parentInfo );
        	
        	
        	}else{
        		BootstrapDialog.show({
        		    title: '알럿창',
        		    message: '로그인 후 댓글 작성이 가능합니다.'
        		});
        	};
    });
	
	 $('#deleteBtn').click(function(){
	    	if('${LOGIN_MEMBERINFO.mem_id}'==('${freeboardInfo.board_writer}')){
	    		var board_no = '${freeboardInfo.board_no}';
	    		var board_group = '${freeboardInfo.board_group}';
	    		var board_depth = '${freeboardInfo.board_depth}';
	    		location.href='${pageContext.request.contextPath}/user/freeboard/deleteFreeboard.do?board_no='+board_no+'&board_group='+board_group+'&board_depth='+board_depth;
	    	}else{
	    		alert('등록자만 지울 수 있습니다.');
	    	}
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
<form id="freeboard" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_id" name="board_nickname" disabled="true" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<c:forEach items="${freeboardInfo.items }" var="freeitem" varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last }">
						<div class="item">
					</c:if>
						<img src="/files/${freeitem.file_save_name }" alt="사진없음" onclick="javascript:location.href='${pageContext.request.contextPath }/file/fileDownload.do?fileName=${freeitem.file_save_name }';">
						</div>
				</c:forEach>
		
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button id="writeBtn" type="button" class="btn btn-success">글쓰기</button>
			<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
			<button id="replyBtn" type="button" class="btn btn-primary">댓글</button>
			<button id="listBtn" type="button" class="btn btn-info">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>