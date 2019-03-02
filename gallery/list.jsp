<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	//세션에 들어있는 목록 추출하기!!
	ArrayList list=(ArrayList)session.getAttribute("list");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	[표로 보여주기]
	<table border="1px" width="100%">
		<tr>	
			<td>이미지</td>
			<td>사진명</td>
		</tr>
		<%for(int i=0;i<list.size();i++){%>
		<tr>	
			<td>
				<img src="/data/<%=(String)list.get(i)%>" width="45px"/>
			</td>
			<td><%=(String)list.get(i)%></td>
		</tr>
		<%}%>
	</table>
</body>
</html>
