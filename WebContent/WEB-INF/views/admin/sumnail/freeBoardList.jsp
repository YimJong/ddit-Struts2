<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>썸네일 리스트</title>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="freeBoardMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">썸네일게시판</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							  <th width="5%">번호</th>
							  <th width="60%">제목</th>
							  <th>사진</th>
							  <th>작성자</th>
							  <th>작성일</th>
							</tr>
						</thead>
			<tbody id="freeboardTBY">
				<c:if test="${empty freeboardList }">
					<tr align="center">
						<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
					</tr>
				</c:if>
				
				<c:if test="${!empty freeboardList }">
				<c:forEach items="${freeboardList }" var="freeboardInfo">
					<tr>
						<td><input type="hidden" value="${freeboardInfo.board_no }"/>${freeboardInfo.rnum}</td>
						<td align="left">
						
						<c:forEach begin="1" end="${freeboardInfo.board_depth }" varStatus="stat">
		                        &nbsp;&nbsp;&nbsp;
		                        <c:if test="${stat.last }">
		                           <i class="fa fa-angle-right"></i>
		                        </c:if>
		                     </c:forEach>
		                     
							${freeboardInfo.board_title }
						</td>
						<td>
						<img src="/files/${freeboardInfo.file_save_name }" alt="사진없음" style = "width:100px;, height:100px;">
						</td>
						<td>${freeboardInfo.board_nickname }</td>
						<td>${freeboardInfo.board_reg_date }</td>
					</tr>
				</c:forEach>
			</c:if>	
			</tbody>
					</table>
					<div style="text-align:right;">
					<form action="${pageContext.request.contextPath }/admin/sumnail/sumnailList.do" method="post">
						<select style="width:100px;" name="search_keycode">
							<option selected="selected" value="TITLE">제목</option>
							<option value="NAME">성명</option>
							<option value="WRITER">아이디</option>
						</select> 
						<input id="search_keyword" name="search_keyword" type="text" size="20" /> 
						<input class="btn1" type="submit" value="검색" />
					</form>
					</div>
 					<div style="text-align:right; margin-top: 5px;">
 						<input class="registBtn" type="submit" value="등록"/>
					
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
${pagingUtiles.pagingHtmls}
<script type="text/javascript">
	$(function(){		
		$('#freeboardTBY tr').click(function(){
			
				var board_no = $(this).find('td:eq(0) input').val();
				var rnum = $(this).find('td:eq(0)').text();
				var url='${pageContext.request.contextPath }/admin/sumnail/sumnailView.do';
				var search_keyword = '${search_keyword}';
				var search_keycode = '${search_keycode}';
				var currentPage = '${currentPage}'
				$(location).attr('href',url+'?board_no='+board_no+'&rnum='+rnum+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&currentPage=' + currentPage);
			
			
		});
		
		$('.registBtn').click(function(){
			$(location).attr('href','${pageContext.request.contextPath }/admin/sumnail/sumnailForm.do');
		});
		
		// 검색어 유지
	    if(eval('${!empty search_keyword}')) {
	    	if('${search_keyword}' == 'null') {
	    		$('input[name=search_keyword]').val('');
	    	} else {
	    		$('input[name=search_keyword]').val('${search_keyword}');	
	    	}
	    } 
	});

</script>

</html>