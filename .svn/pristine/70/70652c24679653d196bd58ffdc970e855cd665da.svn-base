<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type="text/javascript">
$(function(){
	$('form').submit(function(){
		var flag = true;
		$('input[type=file]').each(function(idx, inputTag){
			if(!/\.(jpg|jpeg|png|gif)$/.test($(inputTag).val().toLowerCase())){
				alert('이미지 파일 대상 업로드 됩니다');
				flag = false;
			}
		});
		return flag;
	});
	$('#imageSubmit').click(function(){
		
		var picsrc = '/files/${param.fileName}';
		var picname = '${param.fileName}';
		opener.document.getElementById('pic').src = picsrc;
		$(opener.document).find('#imgsrc').val(picname).css("width", "200px").css("height", "200px");
		
		self.close();
	});
	
});



</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/file/picfileUpload.do" 
	 	method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				파일 -> 미리보기 -> 사진선택시 사진이 등록됩니다.
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name = "files"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="미리보기" /></td>
			</tr>
			<tr>
				<td><input type="button" id="imageSubmit" value="사진선택"></td>
			</tr>
		</table>
	</form>
<img alt="" src="/files/${param.fileName}">
</body>
</html>