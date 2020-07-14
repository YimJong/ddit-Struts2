<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원관리 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/validation.js'> </script>
<script type='text/javascript' src='${pageContext.request.contextPath }/js/common/commons.js'> </script>

<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/animate.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/all.css">
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css"> --%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-responsive.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/pace.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/jquery.news-ticker.css">
<!--Loading KAdmin css 끝 -->
<!-- summernote 에디터 스타일 파일 시작 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.7.1/summernote.css" rel="stylesheet">
<!-- summernote 에디터 스타일 파일 끝 -->
<!-- 부트스트랩 다이얼로그 스타일 파일 시작 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<!-- 부트스트랩 다이얼로그 스타일 파일 끝 -->
</head>
<body>
	<div class="wrap">
		<div id="header">
			<div class="top_bn">
				<ul>
					<li><a href="#"><img src="${pageContext.request.contextPath }/image/admin_t.jpg" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath }/image/admin_f.jpg" /></a></li>
					<li><a href="#"><img src="${pageContext.request.contextPath }/image/admin_homelink.jpg" /></a></li>
					<c:if test="${!empty LOGIN_MEMBERINFO }">
					<li><a href="${pageContext.request.contextPath }/admin/join/logout.do"><img src="${pageContext.request.contextPath }/image/admin_logout.jpg" /></a></li>
					</c:if>
					<c:if test="${empty LOGIN_MEMBERINFO }">
					<li><a href="${pageContext.request.contextPath }/admin/join/adminLoginForm.do"><img src="${pageContext.request.contextPath }/image/login_admin2.jpg" style="width : 58px; height : 28px;"/></a></li>
					</c:if>
				</ul>
			</div>
			<div class="logo">
				<img src="${pageContext.request.contextPath }/image/logo.jpg" />
			</div>
			<div class="gnb">
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/member/memberList.do">회원관리</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/noticeboard/noticeboardList.do">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/freeboard/freeBoardList.do">게시판</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/referenceRoom/referenceRoomList.do">자료실</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/qna/qnaboardList.do">Q&A</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/sumnail/sumnailList.do">썸네일 게시판</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/question/questionList.do">자주하는 질문</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/script/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/script/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/script/bootstrap-hover-dropdown.js"></script>
<script src="${pageContext.request.contextPath}/script/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/script/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/script/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/script/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery.news-ticker.js"></script>
<script src="${pageContext.request.contextPath}/script/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath}/script/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/script/holder.js"></script>
<script src="${pageContext.request.contextPath}/script/responsive-tabs.js"></script>
<script src="${pageContext.request.contextPath}/script/zabuto_calendar.min.js"></script>
<!-- summernote 에디터 js 파일 시작 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.7.1/summernote.js"></script>
<!-- summernote 에디터 js 파일 끝 -->
<!-- 부트스트랩 다이얼로그 js 파일 시작 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<!-- 부트스트랩 다이얼로그 js 파일 끝 -->
</html>