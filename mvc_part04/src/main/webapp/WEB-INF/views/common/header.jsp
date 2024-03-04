<!-- header.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC project</title>
</head>
<body>
	<br/><hr/>
	<a href="${path}">HOME</a>
	<c:choose>
		<c:when test="${empty sessionScope.userInfo}">
			<!-- 현재 url 주석줄에서 찾아들어감  -->
			<!-- <a href="user/signIn">SIGN IN</a> http://localhost:8080/common/user/signIn -->
			<!-- 
			/user/signIn : 앞의 /는 절대경로. rootProject가 되어 contextPath가 없이 도메인으로 들어가게 됨
			 -->
			 <!-- EL문 : 연산된 속성 값을 읽어와서 출력 -->
			 <%-- ${pageContext.request.contextPath} 절대경로 --%>
			<a href="${pageContext.request.contextPath}/user/signIn">SIGN IN</a>
			<a href="<c:url value='/user/signUp'/>">SIGN UP</a>
		</c:when>
		<c:otherwise>
			<span>&nbsp;&nbsp;${userInfo.uname}&nbsp;&nbsp;</span>
			<a href="${path}/user/signOut">SIGN OUT</a>
			<a href="${path}/board/register">글작성</a>
		</c:otherwise>
	</c:choose>
	<a href="${path}/board/listReply">게시글 보러 가기</a>
	<br/><hr/>









