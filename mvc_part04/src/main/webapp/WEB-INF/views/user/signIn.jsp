<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- Preferences -> Web -> JSP Files -> Editor -> Templates -> New -> Context=New JSP

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<h1>${cursor}</h1>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

이후 JSP 파일 생성 시 Next 후 작성된 이름 클릭 후 Finish 하면 저장된 템플릿 생성 --%>
 
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<h1>signIn.jsp</h1>
<form action="signInPost" method="POST">
	<table border=1>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="uid" placeholder="USER ID" required />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="upw" placeholder="USER PASS" required />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="checkbox" name="userCookie" id="userCookie" />
			<label for="userCookie">로그인 정보 저장</label>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="SIGN IN" />
				<button type="button" onclick="location.href='signUp';">Sign Up</button>
			</th>
		</tr>
	</table>
</form>

<script>
 	const msg = '${message}';
 	if(msg != ''){
 		alert(msg);	
 	}
 </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
