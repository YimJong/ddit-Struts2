<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="noticeboardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">공지사항</div>
			<table border="0" cellspacing="1" cellpadding="1">
				<thead>
					<tr>
					  <th width="5%">번호</th>
					  <th width="60%">제목</th>
					  <th>작성자</th>
					  <th>작성일</th>
					</tr>
				</thead>
						
				<tbody id="noticeboardTBY">
					<c:if test = "${empty boardList}">
						<tr align ="center">
							<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다</font></td>
						</tr>
					</c:if>
			
					<c:if test = "${!empty  boardList}">
						<c:forEach items = "${boardList}" var="noticeboardInfo">
							<tr>
								<td><input type=hidden value="${noticeboardInfo.board_no}" />${noticeboardInfo.rnum}</td>
								<td align="left">

									<c:forEach begin="1" end="${noticeboardInfo.board_depth }" varStatus="stat">
										&nbsp; &nbsp; &nbsp;
										<c:if test="${stat.last }">
											<i class= "fa fa-angle-right"></i> 
										</c:if>
									</c:forEach>
									${noticeboardInfo.board_title}
								</td>
								<td>${noticeboardInfo.board_nickname}</td>
								<td>${noticeboardInfo.board_reg_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
${pagingnation.pagingHtmls}
<form action="${pageContext.request.contextPath }/admin/noticeboard/noticeboardList.do" method="post" class="form-inline pull-right">
		<div style="text-align:right;">
						<select style="width:100px;" name="search_keycode">
						
							<option selected="selected" value="TOTAL">전체</option>
							<option value="TITLE">제목</option>
							<option value="NAME">성명</option>
							<option value="WRITER">아이디</option>
						</select> 
						<input id="search_keyword" name="search_keyword" type="text" size="20" /> 
						<input class="btn1" type="submit" value="검색" />
						<input class="btn2" type="button" id="noticeboardRegistBTN" value="등록"/>
		</div>
</form>

</div>
</td>
</tr>
</table>
</div>
</body>

<script type="text/javascript">
	$(function(){
		
		// 검색어 유지
	    if(eval('${!empty search_keyword}')) {
	    	if('${search_keyword}' == 'null') {
	    		$('input[name=search_keyword]').val('');
	    	} else {
	    		$('input[name=search_keyword]').val('${search_keyword}');	
	    	}
	    } 
	    
		$('#noticeboardTBY tr').click(function(){
			var board_no = $(this).find('td:eq(0) input').val();
			var rnum = $(this).find('td:eq(0)').text();
			var search_keyword = $('input[name=search_keyword]').val();
			var search_keycode = $('select[name=search_keycode]').val();
			var currentPage = '${currentPage}'
			$(location).attr('href', '${pageContext.request.contextPath }/admin/noticeboard/noticeboardView.do?board_no=' + board_no + '&rnum=' + rnum  + '&search_keyword=' + search_keyword + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage);
		});
		
		$('#noticeboardRegistBTN').click(function(){
			if('${LOGIN_MEMBERINFO.mem_id}'==('admin')){
				$(location).attr('href', '${pageContext.request.contextPath }/admin/noticeboard/noticeboardForm.do');
			}else{
				alert('관리자로 로그인해주십시오');
			}
		});  
		
	});
	
	function infoMsg(value) {
		BootstrapDialog.show({
		    title: '알림',
		    message: value
		});
	};

</script>
</html>