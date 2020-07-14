<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<%--<c:if test="${LOGINUSER.mem_id eq 'admin' }">--%>

<tiles:insertAttribute name="header"> </tiles:insertAttribute>
<div id="wrapper">
   <%-- <tiles:insertAttribute name="left"> </tiles:insertAttribute> --%>
   <div id="page-wrapper">
      <%-- <tiles:insertAttribute name="content_header"> </tiles:insertAttribute> --%>
      <div class="page-content">
         <tiles:insertAttribute name="content"> </tiles:insertAttribute>
      </div>
      <%-- <tiles:insertAttribute name="footer"> </tiles:insertAttribute> --%>
   </div>
</div>

<%--</c:if>--%>

<%--  
<c:if test="${LOGINUSER.mem_id ne 'admin' }">
<h1>표시할 내용이 없습니다. 관리자 계정으로 로그인 해주세요.</h1>
</c:if>
--%>

</body>
</html>