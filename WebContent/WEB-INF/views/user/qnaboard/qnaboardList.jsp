<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
</head>
<body>
<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">Q&A 목록</div>
		<table class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th scope="col" width="5%" align="center">No</th>
					<th scope="col" width="65%" align="center">제목</th>
					<th scope="col" width="10%" align="center">작성자</th>
					<th scope="col" width="10%" align="center">작성일</th>
					<th scope="col" width="10%" align="center">조회수</th>
				</tr>
			</thead>
			<tbody id="freeboardTBY">
				<c:if test="${empty qnaboardList }">
					<tr align="center">
						<td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
					</tr>
				</c:if>
				
				<c:if test="${!empty qnaboardList }">
				<c:forEach items="${qnaboardList }" var="qnaboardInfo">
					<tr>
						<td><input type="hidden" value="${qnaboardInfo.board_no }"/>${qnaboardInfo.rnum}</td>
						<td align="left">
							<c:forEach begin="1" end="${qnaboardInfo.board_depth }" varStatus="stat">
		                        &nbsp;&nbsp;&nbsp;
		                        <c:if test="${stat.last and qnaboardInfo.board_writer eq 'admin'}">
		                           <i class="fa fa-commenting"></i>
		                        </c:if>
		                        <c:if test="${stat.last and qnaboardInfo.board_writer ne 'admin'}">
		                           <i class="fa fa-arrow-right"></i>
		                        </c:if>
	                        </c:forEach>
							${qnaboardInfo.board_title }
						</td>
						<td>${qnaboardInfo.board_nickname }</td>
						<td>${qnaboardInfo.board_reg_date }</td>
						<td>${qnaboardInfo.board_hit }</td>
					</tr>
				</c:forEach>
				</c:if>	
			</tbody>
		</table>
	</div>
</div>
${pagingHtml}
<div >
<form action="${pageContext.request.contextPath }/user/qna/qnaboardList.do" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control" id="registBTN">게시글 등록</button>
</form>
</div>	
</body>
<script type="text/javascript">
	$(function(){
		// 메세지
		if(eval('${!empty insertMessage}')) {
			infoMsg('${insertMessage}');
		}
		if(eval('${!empty updateMessage}')) {
			infoMsg('${updateMessage}');
		}
		if(eval('${!empty deleteMessage}')) {
			infoMsg('${deleteMessage}');
		}
		if(eval('${!empty replyMessage}')) {
			infoMsg('${replyMessage}');
		}
		
		// 검색어 유지
	    if(eval('${!empty search_keyword}')) {
	    	if('${search_keyword}' == 'null') {
	    		$('input[name=search_keyword]').val('');
	    	} else {
	    		$('input[name=search_keyword]').val('${search_keyword}');	
	    	}
	    } 
		
		// 게시글 등록
		$('#registBTN').click(function(){
			if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
				$(location).attr('href', '${pageContext.request.contextPath}/user/qna/qnaboardForm.do');
			}else{
				infoMsg('회원만 등록가능합니다. 로그인해주세요.');
			}
		});
	
		// view 및 조회수 증가
		$('#freeboardTBY tr').click(function(){
			if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
				var board_no = $(this).find('td:eq(0) input').val();
				var rnum = $(this).find('td:eq(0)').text();
				var url='${pageContext.request.contextPath }/user/qna/qnaboardView.do';
				
				$.ajax({
					url : '${pageContext.request.contextPath }/user/qna/plusHit.do',
					data : { board_no : board_no },
					dataType : 'JSON',
					success : function(result) {
						console.log(result.isOk);
					},
					error : function(result) {
						
					},
				});
				
				const currentPage = '${currentPage}';
				const search_keyword = $('input[name=search_keyword]').val();
				const search_keycode = $('select[name=search_keycode]').val();
				$(location).attr('href', url + '?board_no=' + board_no + '&rnum=' + rnum + 
						'&search_keyword=' + search_keyword + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage);
			}else{
				infoMsg('회원만 조회할 수 있습니다. 로그인해주세요.');
				return false;
			};
		});
		
		$('.leftmenu').removeClass('active');
		$('.board4').addClass('active');
	});
	
	function infoMsg(value) {
		BootstrapDialog.show({
		    title: '알림',
		    message: value
		});
	};
</script>
</html>