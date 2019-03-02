<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.File"%>
<%
	//클라이언트가 전송한 문자파라미터값과 바이너리 파일 데이터를
	//받아서, 서버의 지정한 디렉토리에 저장한다!!
	//나 아닌 다른 개발자, 혹은 다른 단체에서 제작한 기능 단위를
	//컴포넌트라 하는데,지금 딱 필요한 시점...
	//http://servlets.com (오레일리 출판사) 제작한 컴포넌트 
	//http://apache.org 제작한 commons 프로젝트의 fileupload
	//컴포넌트 등 여러가지가 있다...
	
	/*
	업무를 하다보면, 나 아닌 다른 개발자가 제작한 클래스나 라이브러리
	사용이 거의 대부분이다...
	하지만, 지금 이순간에도 전세계적으로 새로운 클래스는 계속 생성되고
	있다.. 학습 불가...감당되나???
	Knowhow )) 
	결국 클래스란 쓰라고 제공한것이기에, 결국 쓴다는 것은 메모리에 
	올려야 한다... 아무리 처음 보는 객체일지라도 다음의 3가지 원칙을
	벗어날 수 없다
	풀어서 말하면, 모든 객체 유형은 아래의 3가지 범위를 벗어날 수 없다
	1) 일반 클래스 : new 해서 올린다
	2) 추상 클래스 : new 가 불가능하므로, 자식을 new 하면된다 
						예외) 대부분은 추상클래스 자체적으로 메서드를
						제공하여 인스턴스를 얻어가게끔 더 편하게 함...
						즉 자식을 만들필요조차 없는 경우가 대부분...
	3) 인터 페이스 : new 가 불가능하므로, 자식을 new 하면 된다
	                  예외) 추상클래스와 마찬가지로 이미 존재하는 인스
					  턴스를 메서드를 통해 얻어갈 수있는 방법을 제공하는
					  게 대부분..
	위의 3가지 유형에 맞는 메모리 생성법과, 해당 객체가 어떤 역할을
	수행하는지를 파악하고 곧바로 개발..
	*/

	//저장 경로
	String saveDir="D:/JSP_Week/jsp_workspace/Project0302/data";
	int maxSize=1024*1024*2; //2Mb 제한
	String encoding="utf-8";//파일명 자체에 문자가 깨지지않게 인코딩지정

	MultipartRequest multi=null;

	try{
		multi=new MultipartRequest(request, saveDir,maxSize,encoding);
		out.print("업로드 성공");
	}catch(IOException e){
		out.print("업로드 실패");
	}

	//사진의 제목 문자열 받기!!!
	//클라이언트가 전송시 multipart/form-data 로 전송을 하면 
	//서버측에서는 request.getParameter 메서드로 받을수없다!!
	//왜??request.getParameter 스트링만을 처리할 수 있기 때문에
	//multipart/form-data 형식으로 전송된 바이너리 형식의 전송은
	//직접 처리가 불가...
	//해결책은? 업로드 담당 컴포넌트가 제목도 받으면 된다...
	String title=multi.getParameter("title");
	out.print("넘어온 제목은 "+title);

	//파일명은 명칭이 중복되지 않아야 하므로, 현재시간으로
	//파일명을 바꿔버리자!!
	//353534543543534534.jpg
	long time=System.currentTimeMillis();
	out.print("현재 시간은 "+time);
	
	//업로드된 파일에 대한 정보를 구해야, 확장자도 얻을 수 있다...
	//업로드를 담당한 객체인 multi 를 통해 정보를 추출!!
	File file=multi.getFile("photo");//업로드된 원본 파일!!
	String filename=file.getName();
	out.print("업로드된 파일명은 "+filename);
	//..a...bc.jpg 

	int last=filename.lastIndexOf(".");//지정한 문자가 어디서 발견되었는지
	//알려주는 메서드인데, last 가장 마지막에 발견된 순번을 알려줌..
	out.print("가장 마지막에 위치한 점의 index는 "+last);

	//부분 문자열 추출할 꺼임!!
	String ext=filename.substring(last+1, filename.length()); 
	out.print("확장자는 "+ext);
	//최종적인 파일명 확정!!!!
	String finalName=saveDir+"/"+ time+"."+ext;
	out.print("<br>");
	
	out.print("최종적인 파일명은 "+finalName);

	//최종적으로 얻어진 이름을 실제 업로드된 파일에 적용시켜서 즉, 
	//파일명을 변경해보자~~ javaSE 의 File 클래스가 담담..renameTo()
	//형식:  원본파일.renameTo(바뀔파일)
	boolean result=file.renameTo(new File(finalName)); //변신!!
	if(result){
		out.print("변경 성공");
	}else{
		out.print("변경 실패");
	}
	
%>








