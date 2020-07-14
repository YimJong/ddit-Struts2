<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 정보</title>
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
    $('.board3').addClass('active');
	
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#board_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    
    $('#board_title').val('${referenceInfo.board_title}');
    $('#mem_id').val('${referenceInfo.board_writer}');
    $('#board_content').summernote('code','${referenceInfo.board_content}');
    
	$('#referenceRoomboard').submit(function(){
    	if('${LOGIN_MEMBERINFO.mem_id}'==('${referenceInfo.board_writer}')){
    		$(this).attr('action', '${pageContext.request.contextPath}/user/referenceRoom/updateReferenceboardInfo.do');
    		$(this).append('<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id}"></input>');
    		$(this).append('<input type="hidden" name="board_content" value="'+ $('#board_content').summernote('code')+'"></input>');
    		$(this).append('<input type="hidden" name="board_no" value="${referenceInfo.board_no}"></input>');
    	}else{
    		alert('등록자만 수정가능합니다.');
    	}
    	
    });
	
    //글쓰기 
    $('#btn1').click(function(){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/referenceRoom/referenceboardForm.do');
    });
    
    //삭제 
    $('#btn2').click(function(){
    	if('${LOGIN_MEMBERINFO.mem_id}'==('${referenceInfo.board_writer}')){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/referenceRoom/deleteReferenceboardInfo.do?board_no=' + '${referenceInfo.board_no}' );		
    	}else{
    		alert('등록자만 삭제가능합니다.');
    	}
    });
    
   //댓글
   $('#btn3').click(function(){
	   if(eval('${!empty LOGIN_MEMBERINFO}')){
	   var board_title = encodeURIComponent('${referenceInfo.board_title}');
	   var queryString = '?rnum=${param.rnum}&board_title=' + board_title;
	   var parentInfo = '&board_group=${referenceInfo.board_group}&board_seq=${referenceInfo.board_seq}&board_depth=${referenceInfo.board_depth}';
	   $(location).attr('href', '${pageContext.request.contextPath}/user/referenceRoom/referenceboardFormReply.do' + queryString + parentInfo);

	   }else{
		   BootstrapDialog.show({
			    title: '알림',
			    message: '로그인 후 작성이 가능합니다 '
			});
	   }
	 });
  
   
   //목록 
    $('#btn4').click(function(){
    	location.href = '${pageContext.request.contextPath}/user/referenceRoom/referenceRoomList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}';
    });
   
    
});
</script>
</head>
<body>
<form id="referenceRoomboard"class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_nickname">작성자</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="mem_id" name="board_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			
				<c:forEach items="${referenceInfo.items }" var="fileitemInfo" varStatus="stat">
								<a href="javascript:location.href='${pageContext.request.contextPath }/file/fileDownload.do?fileName=${fileitemInfo.file_save_name }  &file_name= + ${fileitemInfo.file_name } ';">${fileitemInfo.file_name }</a>
							<br>
			    </c:forEach>
		
			</div>
			
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button"  class="btn btn-success" id="btn1">글쓰기</button>
			<button type="button" class="btn btn-danger" id="btn2">삭제</button>
			<button type="button" class="btn btn-primary" id="btn3">댓글</button>
			<button type="button" class="btn btn-info" id="btn4">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
</html>