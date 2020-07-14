<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
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
    
    
    // 댓글 등록 + 파일 업로드
    $('#freeboard').submit(function(){
    	if($('input[name=board_title]').val() == "") {
    		infoMsg('제목을 입력해주세요');
    		return false;
    	}
    	
    	var board_content = $('#board_content').summernote('code'); 
    	$(this).append('<input type="hidden" name="board_content" value="' + board_content + '" />');
		$(this).append('<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id}" />');
		$(this).append('<input type="hidden" name="board_group" value="${param.board_group}" />'); 
		$(this).append('<input type="hidden" name="board_seq" value="${param.board_seq}" />'); 
		$(this).append('<input type="hidden" name="board_depth" value="${param.board_depth}" />'); 
		$(this).attr('action','${pageContext.request.contextPath }/admin/qna/insertQnaboardReply.do');
    });
    
    // 목록
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/admin/qna/qnaboardList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}';
    });
});

function infoMsg(value) {
	BootstrapDialog.show({
	    title: '알림',
	    message: value
	});
};
</script>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<hr />
					<div id="left_menu">
						<div class="row">
						 <div class="col-sm-4">
							 <label class="col-sm-2 control-label">No</label>
					  		 <p class="form-control-static">${param.rnum }</p>
						 </div>
						 <div class="col-sm-6">
						 	<label class="col-sm-2 control-label">제목 </label>
					    	<p class="form-control-static">${param.board_title }</p>
						 </div>
					</div>
					<form id="freeboard" class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-sm-2" for="board_title">제목:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="board_title" name="board_title" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="board_nickname">작성자 대화명:</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="board_nickname" name="board_nickname" value="관리자" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="board_content">내용:</label>
							<div class="col-sm-10"> 
								<div id="board_content"><p></p></div>
							</div>
						</div>
						
							<label class="control-label col-sm-2" for="files" >파일 첨부:</label>
						<div class="col-sm-10">	
							<input type="file" class="" id="files" name="files" >
						</div>
						
						
						<div class="form-group" style="margin-top : 10px"> 
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn2" style="float: right;">댓글등록</button>
								<button type="reset" class="btn2">취소</button>
								<button id=listBtn type="button" class="btn2">목록</button>
							</div>
						</div>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>