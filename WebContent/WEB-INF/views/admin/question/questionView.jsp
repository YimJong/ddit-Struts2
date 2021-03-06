<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주하는 질문</title>

<script>
$(document).ready(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('.board_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
   
    // 초기값 셋팅
    $('#board_title').val('${questionInfo.board_title}');
    $('#mem_id').val('${questionInfo.board_writer}');
    $('.board_content').summernote('code','${questionInfo.board_content}');
	
    // 삭제
    $('#deleteBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/admin/question/deleteQuestion.do?board_no=' + ${questionInfo.board_no };
    });
    
    // 목록
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/admin/question/questionList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}';
    });
    
    //수정 
    $('form[name=boardViewForm]').submit(function(){
    	$(this).append('<input type="hidden" name="board_content" value="'+$('.board_content').summernote('code')+'"></input>');
		$(this).append('<input type="hidden" name="board_no" value="${questionInfo.board_no}"/>');
		$(this).append('<input type="hidden" name="board_writer" value="${questionInfo.board_writer}"/>');
		
		$(this).attr('action', '${pageContext.request.contextPath}/admin/question/updateQuestion.do');
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
	<form name="boardViewForm" id="freeboard" method="post">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="questionMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자유게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><label class="board_title"></label>
						  	  <input type="text" id="board_title" name="board_title"> </td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="board_writer"></label>
						  	<input type="text" id="mem_id" name="board_writer" disabled="true" >
						  </td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" class="board_content" style="overflow: auto;"></textarea> </td>
						</tr>
					</table>
					<div style="text-align:right">
						<input id="modifyBtn" class="btn2" type="submit" value="수정"/> 
						<input id="deleteBtn" class="btn2" type="button" value="삭제"/> 
						<input id="listBtn" class="btn2" type="button" value="목록"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>