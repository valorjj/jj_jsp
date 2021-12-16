# 간단한 게시판 만들기 

[정규식1](https://regexper.com/#%3C%28%5C%2F%29%3F%28%5Ba-zA-Z%5D*%29%28%5C%5Cs%5Ba-zA-Z%5D*%3D%5B%5E%3E%5D*%29%3F%28%28%5C%2FS%29%29*%28%5C%2F%29%3F)   
[정규식2](https://regexr.com/)   

b_no  
b_title  
b_content  
b_password  
b_created_at   
b_viewcount


## 글 등록 
``` java
<form action="" method="post">
  <div
  <input type="text" class="form-control" name="b_write_title">
  
  ...
  
  <input type="submit" value="등록">
</
```

1. form 사용 : input 에 name 값 넘겨주면 알아서 value 값 전달 
2. controller 에서 request.getParameter("name") 로 value 를 받는다.
3. dao 에 필요한 메소드를 만들고 호출해서 사용한다. 


## 글 수정

js 이용 



``` <input id="id" onchange="check();" type="text" name="id" class="form-control" maxlength="15"> ```

``` var content = /^[A-Za-z가-힣]{1,500}$/; ```

1. 입력하지 않지만 필요한 값들은 숨겨서 보낸다. ``` <input type="hidden" name="b_no" value="<%=b_no%>"> ```
2. js 로 보낼꺼면 ```document.getElementsByName("b_no")[0].value;```
3. controller 에서 request 로 변수에 저장한다.
4. 정규화를 거친다. 제목 : 길이 내용 : 길이, 특수문자, 

``` java
content  = content.replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>");
title = title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?((//S)*(/)?", ""); 
```


## 글 삭제


## 글 상세 보기 

비밀번호를 어디서 입력받지???

게시글 제목을 지우고 비밀번호 입력 창을 띄워야하나???

table 멤버에서, td 에 id 값을 매겨서, js 이벤트를 건다. onclick 이벤트 생성. 함수 만들어서 
