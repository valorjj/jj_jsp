<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.mysql.cj.xdevapi.JsonParser"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="container">
		<table class="table">
			<%
			// api 가져오기 [ json 형식 ]

			// 1. 요청 url 가져오기 
			URL url = new URL(
					"https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=1000&serviceKey=dGwmCXzcjJmj5KkBO5n4n%2FQSok2X%2BLTztW5Qv%2FAqXp%2BcZVKglHUNcmn5xDjAK2FrWvtxyIeimXL5C1XAYnJ16Q%3D%3D");
			// 2. StreamBuffer 를 통한 url 내에 존재하는 HTML 읽어오기 
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			// BufferedReader : 외부 [이클립스 바깥] 입,출력 buffer [ buffer : 통신 데이터 저장소 ]
			// InputStreamReader(Stream, "인코딩타입") : 입,출력 스트림 
			// url.openStream() : Byte 단위로 url 내용을 읽는다. 
			// 3. 읽어온 내용을 문자열에 담기 
			String result = bf.readLine(); // 모든 line 을 읽는다. url 내 문서를 stream 을 통해서 읽어온 결과값
			// 4. 읽어 온 내용을 json 으로 parsing 
			// 4.0 jsonSimple 을 사용해야한다. 
			JSONParser jsonParser = new JSONParser();
			// 4.1 JsonParser : json 데이터를 넣어서 parsing 하는 단계 
			// 4.2 JSONObject 형 변환
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result); // url 내용을 json 형태로 변환 한 결과값
			// System.out.print("url 내용을 json 형태로 변환한 값 " + jsonObject);
			JSONArray jsonArray = (JSONArray) jsonObject.get("data"); // data 라는 key 값을 요청한다. 
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject content = (JSONObject) jsonArray.get(i);
			%>
			<tr>
				<td><%=content.get("facilityName")%></td>
				<td><%=content.get("address")%></td>
				<td><%=content.get("phoneNumber")%></td>
				<td>
					<button class="form-control"
						onclick="map(<%=i%>, <%=content.get("lat")%>, <%=content.get("lng")%>);">지도보기</button>
				</td>
			</tr>
			<tr>
				<td colspan="4" id="showMap<%=i%>" style="display:none;"><div id="map<%=i%>"
						style="width: 100%; height: 350px;"></div></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>