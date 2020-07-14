<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 리스트</title>
<style>
	.main {
	 	margin-left : 250px;
	}
	
	.mainFont {
		wiedth : 500px;
		margin-left : 300px;
		margin-top : 30px;
	}
	
</style>
</head>
<body>
<%-- <jsp:include page="../inc/header.jsp"></jsp:include> --%>
<div class="wrap">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790"> 
				<div id="container">
					<img src="${pageContext.request.contextPath }/image/background.gif" alt="" class="main"/>
					<img src="${pageContext.request.contextPath }/image/logo.png" alt="" class="mainFont"/>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>