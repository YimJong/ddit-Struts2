<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>

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
    $('#board_title').val('${boardInfo.board_title}');
    $('#mem_id').val('${boardInfo.board_writer}');
    $('.board_content').summernote('code','${boardInfo.board_content}');
	
    // 삭제
    $('#deleteBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/admin/qna/deleteQnaboard.do?board_group=' + ${boardInfo.board_group };
    });
    
    // 목록
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/admin/qna/qnaboardList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}';
    });
    
    // 수정
    $('#freeboard').submit(function(){
    	if($('input[name=board_title]').val() == "") {
    		infoMsg('제목을 입력해주세요.');
    		return false;
    	}
    	
    	if($('.board_content').summernote('code') == "") {
    		infoMsg('내용을 입력해주세요.');
    		return false;
    	}
    	
    	if('${LOGIN_MEMBERINFO.mem_id}' == ('${boardInfo.board_writer}')){
	    	$(this).attr('action','${pageContext.request.contextPath}/admin/qna/updateQnaboard.do');
	    	$(this).append('<input type="hidden" name="board_title" value="' + $('#board_title').val() + '"></input>');
	    	$(this).append('<input type="hidden" name="board_content" value="' + $('.board_content').summernote('code') + '"></input>');
	    	$(this).append('<input type="hidden" name="board_no" value="${boardInfo.board_no}"></input>');
    	}else{
    		infoMsg('관리자 글만 수정 할 수 있습니다.');
    		return false;
    	}	
    }); 
    
    
    // 댓글 작성
    $('#replyBtn').click(function(){
    	if(eval('${empty LOGIN_MEMBERINFO}')) {
    		infoMsg('관리자 아이디로 로그인 후 작성 해 주세요.');
    		return false;
    	}
    		
   		if('${boardInfo.board_depth}' == 0){
    		var board_title = encodeURIComponent('${boardInfo.board_title}');
    		var queryString = '?rnum=${param.rnum}&board_title=' + board_title;
        	// dept 도 같이 가져가야 한다.
        	var parentInfo = '&board_group=${boardInfo.board_group}&board_seq=${boardInfo.board_seq}&board_depth=${boardInfo.board_depth}&search_keyword=${search_keyword}&search_keycode=${search_keycode}';
        	$(location).attr('href', '${pageContext.request.contextPath}/admin/qna/replyQnaForm.do' + queryString + parentInfo );
       	}else{
     		infoMsg('답변이 등록이 안된 글만 댓글 등록이 가능합니다.');
       	};
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
	<form id="freeboard" method="post">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="qnaboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">Q&A</div>
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
						<tr>
						  <th>첨부파일</th>
						  <c:forEach items="${fileInfo }" var="fileitem" varStatus="stat">
						 	<td><a href="${pageContext.request.contextPath }/file/fileDownload.do?fileName=${fileitem.file_save_name }">${fileitem.file_name }</a></td>
						  </c:forEach>
						</tr>
					</table>
					<div style="text-align:right">
						<button id="replyBtn" type="button" class="btn2">댓글</button>
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