<%@page import="com.saoe.model.MemberDTO"%>
<%@page import="com.saoe.model.MessageDAO"%>
<%@page import="com.saoe.model.MessageDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDTO member = (MemberDTO) session.getAttribute("member");
	MessageDAO dao = new MessageDAO();
	List<MessageDTO> messageList = dao.selectMessage(member.getId());
	%>
	<a href="writeMessage.jsp"><button>쪽지 보내기</button></a>
	<a href="main.jsp"><button>메인으로</button></a>
	<br>
	<%
	for (MessageDTO msg : messageList) {
	%>
		<%=msg.getSend_id() %>, 
		<%=msg.getReceive_id() %>, 
		<%=msg.getMessage_content() %>, 
		<%=msg.getMessage_date() %>, 
		<%=msg.getReview_no() %>
		<a href="DeleteMessageCon"><button>쪽지 삭제</button></a><br>
	<%
	}
	%>
</body>
</html>