<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 리스트</title>
<script>
	$(function() {
		if(eval('${!empty param.message}')) {
			infoMsg('${param.message}');
		}
		if(eval('${!empty param.deleteMessage}')) {
			infoMsg('${param.deleteMessage}');   
		}
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
			<td width="180"><jsp:include page="memberMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">회원 리스트</div>
					<table border="0" cellspacing="1" cellpadding="1" class="text-center">
						<thead>
							<tr>
							  <th width="15%">이름</th>
							  <th width="15%">아이디</th>
							  <th width="30%">주소</th>
							  <th>전화번호</th>
							  <th width="10%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${memberList }" var="memberInfo">
								<tr>
									<td>${memberInfo.mem_name }</td>
									<td>${memberInfo.mem_id }</td>
									<td>${memberInfo.mem_add1 }</td>
									<td>${memberInfo.mem_hp }</td>
									<td><button class="btn btn-primary" name="deleteBtn">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div style="text-align:right;">
						<select style="width:100px;">
							<option selected="selected">제목</option>
							<option>성명</option>
							<option>아이디</option>
						</select> 
						<input name="unname" type="text" id="uname" size="20" /> 
						<input class="btn1" type="submit" value="검색"/>
					</div>
<!-- 					<div style="text-align:right; margin-top: 5px;"> -->
<!-- 						<input class="btn2" type="submit" value="등록"/> -->
<!-- 					</div> -->
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
<script>
	$(function() {
		// 유저 상세 정보
		$('tr:gt(1)').on('click', function() {
			const mem_id = $(this).find('td:eq(1)').text();
			const currentPage = '${currentPage}'; 
			location.href = '${pageContext.request.contextPath}/admin/userView.do?mem_id=' + mem_id + "&currentPage=" currentPage;
		});
		
		// 유저 삭제 처리
		$('button[name=deleteBtn]').on('click', function(e) {
			e.stopPropagation();
			const mem_id = $(this).closest('tr').find('td:eq(1)').text();
			location.href = '${pageContext.request.contextPath}/admin/deleteUser.do?mem_id=' + mem_id;
		});
		
		// 검색 기능
		$('form').submit(function() {
			
		});
	});
</script>
</html>