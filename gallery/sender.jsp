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
//문자파라미터 값 뿐만 아니라, 로컬상의 파일도 서버에 전송해보자!!
//이렇게 문자데이터가 아닌 바이너리 데이터까지 전송하는 행위를
//파일 업로드 !!
//문자데이터 뿐만 아니라 바이너리 데이터를 form 태그의 양식으로 보낼려면
//반드시 form 태그의 속성에 multipart/form-data 를 명시해야 한다..
//이렇게 해야 파일도 전송할 수 있다!!!!!
//이때 당연히form 의 전송방식은 post
function send(){
	form1.method="post";
	form1.action="/gallery/upload.jsp";//요청 대상 주소
	form1.submit();//요청!!
}
</script>
</head>
<body>

<h3>Contact Form</h3>

<div class="container">
  <form name="form1" enctype="multipart/form-data">
    <label for="fname">제목</label>
    <input type="text" name="title" placeholder="사진 제목 입력">

    <label for="lname">사진 선택</label>
    <input type="file" name="photo">

	</p>
	<input type="button" value="Submit" onClick="send()">
  </form>
</div>

</body>
</html>

