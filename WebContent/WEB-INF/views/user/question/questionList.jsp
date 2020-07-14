<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
</head>
<body>
<div id="freeboardList_content">
   <div class="panel panel-blue">
       <div class="panel-heading">자주하는 질문</div>
      <table class="table table-bordered table-hover">
         <thead>
            <tr>
               <th scope="col" width="5%">No</th>
               <th scope="col" width="65%">제목</th>
               <th scope="col" width="10%">작성자</th>
               <th scope="col" width="30%">작성일</th>
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
</div>
${pagingHtml}
<div >
<form action="${pageContext.request.contextPath }/user/question/questionList.do" method="post" class="form-inline pull-right">
      <input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
      <select class="form-control" name="search_keycode" >
         <option value="TOTAL">전체</option>
         <option value="TITLE">제목</option>
         <option value="CONTENT">내용</option>
         <option value="WRITER">작성자</option>
      </select>
       <button type="submit" class="btn btn-primary form-control" id="searchConditionByQuesboard">검색</button>
       <!-- <button type="button" class="btn btn-info form-control" id="registBTN">게시글 등록</button> 자주하는질문-> 등록없어서 지움--> 
</form>
</div>   
</body>
<script type="text/javascript">
   $(function(){
      $('#registBTN').click(function(){
         if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
            $(location).attr('href','/user/freeboard/freeboardForm.tiles');
         }else{
            alert('회원만 등록가능합니다. 로그인해주세요.');
            
         }
      });
      
  	if(eval('${!empty updateMessage}')) {
		infoMsg('${updateMessage}');
	}
	if(eval('${!empty insertMessage}')) {
		infoMsg('${insertMessage}');
	}
	if(eval('${!empty deletetMessage}')) {
		infoMsg('${deleteMessage}');
	}

      
      $('#searchConditionByQuesboard').click(function(){
    	 	
      });
      
  	// 검색어 유지
      if(eval('${!empty search_keyword}')) {
      	if('${search_keyword}' == 'null') {
      		$('input[name=search_keyword]').val('');
      	} else {
      		$('input[name=search_keyword]').val('${search_keyword}');	
      	}
      } 
      
      $('#freeboardTBY tr').click(function(){
          if(eval('${!empty LOGIN_MEMBERINFO.mem_id}')){
             var board_no = $(this).find('td:eq(0) input').val();
             var rnum = $(this).find('td:eq(0)').text();
             var currentPage = '${currentPage}';
             var search_keyword = '${search_keyword}';
			 var search_keycode = '${search_keycode}';
             var url='${pageContext.request.contextPath }/user/question/questionView.do';
             $(location).attr('href', url + '?board_no=' + board_no + '&rnum=' + rnum + '&search_keyword=' + search_keyword + '&search_keycode=' + search_keycode + '&currentPage=' + currentPage);
          }else{
             alert('회원만 볼 수 있습니다. 로그인해주세요.');
          }
         
      });
   });
   
   $('.leftmenu').removeClass('active');
   $('.board5').addClass('active');
</script>
</html>