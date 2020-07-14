<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
<script type = "text/javascript">
$(function(){
	$('.leftmenu').removeClass('active');
    $('.board3').addClass('active');
	
	$('#databoardRegistBTN').click(function(){
		if(eval('${!empty LOGIN_MEMBERINFO}')){
			$(location).attr('href', '${pageContext.request.contextPath }/user/referenceRoom/referenceboardForm.do');
		}else{
			BootstrapDialog.show({
			    title: '알림',
			    message: '게시글은 로그인 후 작성 가능'
			});
		}
	});  
	
	// 검색어 유지
    if(eval('${!empty search_keyword}')) {
    	if('${search_keyword}' == 'null') {
    		$('input[name=search_keyword]').val('');
    	} else {
    		$('input[name=search_keyword]').val('${search_keyword}');	
    	}
    } 
	
	$('#databoardTBY tr').click(function(){
		  if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
		var currentPage = '${currentPage}';
		var board_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		var search_keyword = $('input[name=search_keyword]').val();
		var search_keycode = $('select[name=search_keycode]').val();
		
		$(location).attr('href', '${pageContext.request.contextPath}/user/referenceRoom/referenceRoomView.do?board_no=' + board_no + '&rnum=' + rnum + '&search_keyword=' + search_keyword + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage);
		  }else{
	             alert('회원만 볼 수 있습니다. 로그인해주세요.');
	          }
	});
});

</script>
</head>
<body>
<div id="databoardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">자료실</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="databoardTBY">
			
			<c:if test = "${empty referenceRoomList}">
				<tr align ="center">
					<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다</font></td>
				</tr>
			</c:if>
			
			<c:if test = "${!empty referenceRoomList}">
				<c:forEach items = "${referenceRoomList}" var="referenceInfo">
					<tr>
						<td><input type=hidden value="${referenceInfo.board_no}" />${referenceInfo.rnum}</td>
						<td align="left">

							<c:forEach begin="1" end="${referenceInfo.board_depth }" varStatus="stat">
								&nbsp; &nbsp; &nbsp;
								<c:if test="${stat.last }">
									<i class= "fa fa-commenting"></i> 
								</c:if>
							</c:forEach>
						${referenceInfo.board_title}
						</td>
						<td>${referenceInfo.board_nickname}</td>
						<td>${referenceInfo.board_reg_date}</td>
						<td>${referenceInfo.board_hit}</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
${pagingUtiles.pagingHtmls}
<div>
<form action="${pageContext.request.contextPath }/user/referenceRoom/referenceRoomList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="NICKNAME">작성자</option>
		</select>
		 <button type="submit" class="btn btn-primary form-control">검색</button>
		 <button type="button" class="btn btn-info form-control" id="databoardRegistBTN">게시글 등록</button>
	</form>
	</div>
</body>
</html>
		