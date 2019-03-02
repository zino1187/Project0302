<%@ page contentType="text/html;charset=utf-8"%>
<%
	//현재 세션객체에 담겨진 데이터를 추출!!
	String id=(String)session.getAttribute("member");

	out.print("당신의 정보는 <br>");
	out.print("ID :  "+id);
%>
