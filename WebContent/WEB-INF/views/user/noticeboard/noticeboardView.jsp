<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#board_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    //도큐먼트 초기값 설정 
    $('#board_title').val('${boardInfo.board_title}');
    $('#board_nickname').val('${boardInfo.board_nickname}');
    $('#board_content').summernote('code', '${boardInfo.board_content}');
   
   //목록 
    $('#btn4').click(function(){
    	$(location).attr('href', '${pageContext.request.contextPath}/user/noticeboard/noticeboardList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}' );			

});
  

});
</script>
</head>
<body>
<form name ="boardViewForm" class="form-horizontal" role="form" action="" method="post">
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_nickname">작성자 대화명!:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="board_nickname" name="board_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="board_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content"></div>
		</div>
	</div>
	
	  
	<div class="form-group">
		<label class="control-label col-sm-2" for="board cv_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
	
				<c:forEach items="${boardInfo.items }" var="fileitemInfo" varStatus="stat">
						<a href="javascript:location.href='${pageContext.request.contextPath }/file/fileDownload.do?fileName=${fileitemInfo.file_save_name }  &file_name= + ${fileitemInfo.file_name } ';">${fileitemInfo.file_name }</a>
						<br>
				</c:forEach>
		</div>
	</div>

	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" id="btn4">목록</button>
		</div>
	</div>
</form>
</body>
</html>

