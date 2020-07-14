<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
	$('.leftmenu').removeClass('active');
    $('.board7').addClass('active');
   
    $('#board_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#freeboardForm').submit(function(){
    	
    	
    	if($('input[name=board_title]').val() == "") {
    		infoMsg('제목을 입력해주세요.');
    		return false;
    	}
    	
    	if($('input[name=board_nickname]').val() == "") {
    		infoMsg('대화명을 입력해주세요');
    		return false;
    	}
    	
    	if(eval('${empty LOGIN_MEMBERINFO}')){
    		infoMsg('로그인 후 이용 가능합니다.');
    		return false;
    	}
    	
	    	$(this).attr('action','${pageContext.request.contextPath }/file/sumnailfileUpload.do');
	    	$(this).append('<input type="hidden" name="board_content" value="'+$('#board_content').summernote('code')+'"></input>');
	  
    	
    });
    
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/user/sumnail/sumnailList.do';
    });
    
    
    function infoMsg(value) {
    	BootstrapDialog.show({
    	    title: '알림',
    	    message: value
    	});
    }
    // 포커스 처리
    // $('#bo_content').summernote( {focus: true} );
    // 값 취득
    // $('#bo_content').summernote('code');
    // 값 추가
    // $('#bo_content').summernote('code', '<font color="red">추가글</font>');
    // 에디터 제거
    // $('#bo_content').summernote('destroy');
    
// 	BootstrapDialog.show({
// 	    title: '알럿창',
// 	    message: '알럿창으로 활용하세요!'
// 	});
	
// 	BootstrapDialog.show({
//         message: '컨펌 다이얼로그로 활용하세요!',
//         buttons: [{
//             label: 'Button 1'
//         }, {
//             label: 'Button 2',
//             cssClass: 'btn-primary',
//             action: function(){
//                 alert('Hi Orange!');
//             }
//         }, {
//             icon: 'glyphicon glyphicon-ban-circle',
//             label: 'Button 3',
//             cssClass: 'btn-warning'
//         }, {
//             label: 'Close',
//             action: function(dialogItself){
//                 dialogItself.close();
//             }
//         }]
//     });

});
</script>
</head>
<body>
<form id="freeboardForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath }/file/freeboardfileUpload.do" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="board_title" name="board_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="hidden" name="board_writer" value="${LOGIN_MEMBERINFO.mem_id }"></input>
			<input type="text" class="form-control" id="board_nickname" name="board_nickname" placeholder="대화명 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="board_content"><p>내용을 입력해주세요...</p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
		</div>
	</div>

	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="reset" class="btn btn-danger" style="float: right">취소</button>
			<button id="listBtn" type="button" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
<%-- <img alt="" src="/files/${param.fileName }"> --%>
</body>
</html>