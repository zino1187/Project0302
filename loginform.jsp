<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script>
function send(){
	//요청 주소앞에 http(Hyper Text Transfer Protocol)의 의미?? 
	//전자문서를 주고받는 통신 방식
	//form 영역내에 있는 모든 파라미터 변수들을 전송해본다!!
	//단, 파라미터 변수가 되려면 name값이 명시되어야 한다..
	form1.action="/session.jsp";//요청 대상 주소
	form1.submit();//요청!!
}
</script>
</head>
<body>

<h3>Contact Form</h3>

<div class="container">
  <form name="form1">
	<%if(session.getAttribute("member")==null){%>
    <label for="fname">아이디</label>
    <input type="text" id="fname" name="id" placeholder="아이디 입력">

    <label for="lname">패스워드</label>
    <input type="text" id="lname" name="pw" placeholder="비번 입력">
	<%}else{%>
	<% String id=(String)sessoin.getAttribute("member"); %>	
			<%=id%>님 반갑습니다.
	<%}%>
    <input type="button" value="Submit" onClick="send()">

  </form>
</div>

</body>
</html>

