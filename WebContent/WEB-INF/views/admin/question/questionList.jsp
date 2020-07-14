<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주하는 질문 관리</title>
</head>
<body>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="180"><jsp:include page="questionMenu.jsp"></jsp:include></td>
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<div class="title">자주하는 질문</div>
					<table border="0" cellspacing="1" cellpadding="1">
						<thead>
							<tr>
							   <th scope="col" width="5%">No</th>
             				   <th scope="col" width="65%">제목</th>
               				   <th scope="col" width="10%">작성자</th>
               				   <th scope="col" width="50%">작성일</th>
							</tr>
						</thead>
		<tbody id="freeboardTBY">
			<c:if test="${empty questionList }">
               <tr align="center">
                  <td colspan="5"><font color="red">등록된 게시글이 존재하지 않습니다.</font></td>
               </tr>
            </c:if>
            
  <c:if test="${!empty questionList }">
	            <c:forEach items="${questionList }" var="questionInfo">
	               <tr>
	                  <td><input type="hidden" value="${questionInfo.board_no }"/>${questionInfo.rnum}</td>
	                  <td align="left">
	                     ${questionInfo.board_title }
	                  </td>
	                  <td>${questionInfo.board_nickname }</td>
	                  <td>${questionInfo.board_reg_date }</td>
	               </tr>
	            </c:forEach>
            </c:if>   
            
              
			</tbody>
		  </table>
		  </div>
		  ${page}
			
 					
<div >

<form action="${pageContext.request.contextPath }/admin/question/questionList.do" method="post" class="form-inline pull-right">
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
			</td>
		</tr>
	</table>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){	
	if(eval('${!empty updateMessage}')) {
		infoMsg('${updateMessage}');
	}
	if(eval('${!empty insertMessage}')) {
		infoMsg('${insertMessage}');
	}
	if(eval('${!empty deletetMessage}')) {
		infoMsg('${deleteMessage}');
	}
	

    
 	// 검색어 유지
    if(eval('${!empty search_keyword}')) {
    	if('${search_keyword}' == 'null') {
    		$('input[name=search_keyword]').val('');
    	} else {
    		$('input[name=search_keyword]').val('${search_keyword}');	
    	}
    } 
 	
    if(eval('${!empty search_keycode}')) {
    	$('select[name=search_keycode] option[value=${search_keycode}]').attr('selected', true);
    }
	
	
	$('#freeboardTBY tr').click(function(){
		 if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
			 
		var board_no = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		var board_seq = $(this).find('td:eq(0) > #seq').val();
		var url='${pageContext.request.contextPath }/admin/question/questionView.do';
		const search_keyword = $('input[name=search_keyword]').val();
		const search_keycode = $('select[name=search_keycode]').val();
		let currentPage = '${currentPage}';
		
		$(location).attr('href', url + '?board_no=' + board_no + '&rnum=' + rnum + '&board_seq=' + board_seq 
				+ '&search_keyword=' + search_keyword + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage);
		 } else {
			 alert('회원만 볼 수 있습니다. 로그인해주세요.');
		 }
	});
	
	$('#registBTN').click(function(){
	
		 if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
				$(location).attr('href', '${pageContext.request.contextPath }/admin/question/questionForm.do');
	         }else{
	            alert('회원만 등록가능합니다. 로그인해주세요.');
	            
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