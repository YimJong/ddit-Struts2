<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 보기</title>

<script>
$(function(){
	  $('.board_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
  });
  
	$('#board_title').val('${boardInfo.board_title}');
	$('#board_nickname').val('${boardInfo.board_nickname}');
	$('#board_content').summernote('code','${boardInfo.board_content}');
    
    //삭제 
    $('#btn2').click(function(){
    	if('${LOGIN_MEMBERINFO.mem_id}'==('admin')){
    	$(location).attr('href', '${pageContext.request.contextPath}/admin/noticeboard/deleteNoticeboardInfo.do?board_no=' + '${boardInfo.board_no}');		
   		}else{
   			alert('관리자로 로그인해주십시오');
   		}	
    });
	
    //목록
    $('#btn3').click(function(){
    	
    	$(location).attr('href', '${pageContext.request.contextPath}/admin/noticeboard/noticeboardList.do?search_keyword=${search_keyword}&search_keycode=${search_keycode}&currentPage=${currentPage}');
    });
    
    //수정 
    $('form[name=boardViewForm]').submit(function(){
    	if('${LOGIN_MEMBERINFO.mem_id}'==('admin')){
	    $(this).append('<input type="hidden" name="board_content" value="${board_content}"/>');
		$(this).append('<input type="hidden" name="board_no" value="${boardInfo.board_no}"/>');
		$(this).append('<input type="hidden" name="board_writer" value="${boardInfo.board_writer}"/>');
		
		$(this).attr('action', '${pageContext.request.contextPath}/admin/noticeboard/updateNoticeboardInfo.do');
    	}else{
    		alert('관리자로 로그인해주십시오');
    	}   
    });
    
	
});
	
</script>

</head>
<body>

<div class="wrap">
	<form class="boardViewForm" name="boardViewForm"  method="post">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="noticeboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<tr>
						  <th>제목</th>
						  <td><label class="board_title"></label>
						  	 <input type="text" id="board_title" name="board_title"> </td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><label class="board_nickname"></label>
						  <input type="text" id="board_nickname" name="board_nickname" disabled="true" >
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea rows="10" cols="110" id="board_content" name="board_content" class="board_content" style="overflow: auto;">
						  </textarea> 
						  </td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td>
							<c:forEach items="${boardInfo.items }" var="fileitemInfo" varStatus="stat">
								<a href="javascript:location.href='${pageContext.request.contextPath }/file/fileDownload.do?fileName=${fileitemInfo.file_save_name }  &file_name= + ${fileitemInfo.file_name } ';">${fileitemInfo.file_name }</a>
							<br>
							</c:forEach>
							</td>
						</tr>		
					
					</table>
						
		</div>
		
					<div style="text-align:right">
						<input id="btn1" type="submit" value="수정"/> 
						<input id="btn2" type="button" value="삭제"/> 
						<input id="btn3" type="button" value="목록"/>
					</div>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>