<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주하는 질문 </title>
<style></style>
<script>
$(function(){
	
	
	    
	$('#insertBtn').click(function(){
		
		var board_title = $('#board_title').val();
		var board_nickname = $('#board_nickname').val();
		var board_content = $('#board_content').val();
		
    	location.href='${pageContext.request.contextPath}/admin/question/insertFreeboard.do?board_title='+board_title
    			+'&board_nickname='+ board_nickname
    			+'&board_content='+ board_content
    			+'&board_writer='+ '${LOGINUSER.mem_id}';
    });
	
	 $('#listBtn').click(function(){
		   	location.href='${pageContext.request.contextPath}/admin/question/questionList.do';
		   });
});
</script>
</head>
<body>
<div class="wrap">
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
						  <td><input id="board_title" name ="board_title" type="text" class="bo_title"></td>
						</tr>
						<tr>
						  <th>작성자</th>
						  <td><input id="board_nickname" name="board_nickname" type="text" class="bo_writer"></td>
						</tr>
						<tr>
						  <th>내용</th>
						  <td><textarea id="board_content" name="board_content" rows="10" cols="110" class="bo_content" style="overflow: auto;"></textarea> </td>
						</tr>
						
					</table>
					<table border="0" cellspacing="0" cellpadding="0">
					  <tr></tr>
					</table>
					<div style="text-align:right">
						<button id="insertBtn" type="button">등록</button> 
						<button id="listBtn" type="button" class="btn btn-delete">목록</button>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>	
</body>
</html>