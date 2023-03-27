<%@page import="com.saoe.model.MemberMemberDTO"%>
<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="com.saoe.model.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	MemberDTO user = dao.selectMember(id);
	%>
	<table border="1px solid black">
		<tr>
			<td>회원 ID :</td>
			<td><%=user.getId()%></td>
		</tr>
		<tr>
			<td>회원 닉네임 :</td>
			<td><%=user.getNick()%></td>
		</tr>
		<tr>
			<td>회원 거주지 :</td>
			<td><%=user.getAddr()%></td>
		</tr>
		<tr>
			<td>회원 성별 :</td>
			<td><%=user.getGender()%></td>
		</tr>
		<tr>
			<td>회원 프사 :</td>
			<td><%=user.getProfile()%></td>
		</tr>
		<tr>
			<td>회원 프메 :</td>
			<td><%=user.getProfile_message()%></td>
		</tr>
		<tr>
			<td>회원 가입날짜 :</td>
			<td><%=user.getJoin_date()%></td>
		</tr>
	</table>
	<% 	for(MemberMemberDTO memberMember : user.getMemberMemberList()){	
			if(memberMember.getMember_follow_yn() == 1){%>
		 팔로잉 : <%=memberMember.getId() %>, 팔로잉 날짜 : <%=memberMember.getMember_follow_date() %>
	<%
			}
		}
	
	%>


</body>
</html>