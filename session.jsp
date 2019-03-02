<%@ page contentType="text/html;charset=utf-8"%>
<%
	//클라이언트가 전송한 파라미터를 받아보자!!
	//jsp의 내장 객체 중 요청 정보를 갖는 객체인 request객체로 처리해보자
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");

	out.print("당신의 아이디는 "+id);
	out.print("<br>");
	out.print("당신의 비밀번호는 "+pw);
	//http 기반은 연결이 유지되지 못하고, 요청과 동시에 응답을 해버린다..
	//응답과 동시에 네트워크는 끊어져 버린다..따라서 웹기반의 통신방식에서
	//는 연결 유지란 있을 수 없다..따라서 로그인이란 기술 자체가 원래 
	//불가능하다...
	//꼼수해결책)  요청이 들어올때 유일한 아이디를 발생시켜 클라이언에게
	//               살짝 묻어서 보낸다(뿌스러기라 하여 Cookie )
	//세션 객체가 바로, 클라이언에게 발급할 아이디와 그 아이디와 연계된
	//객체를 관리해준다...

	//주의할점) session ID가 발급되는 시점은 , 클라이언트의 브라우저에
	//쿠키정보가 전혀 없을때, 새로 들어온 손님으로 알고, 무조건 발금한다
	//따라서 아래의 getId() 는 세션아이디를 발급하는 메서드가 아니라,
	//이미 서버에 의해 발급된 아이디를 확인하는 것 뿐이다..
	String sid=session.getId();//현재 요청에 의해 발급된 세션 아이디!!
	out.print("당신이 톰켓서버로 부터 부여받은 세션 아이디는 "+sid);
	
	//세션 객체에 원하는 데이터를 이름을 붙여 저장할 수 있다
	session.setAttribute("member", id); //map :  key-value 쌍으로 컬렉션 객체
%>
