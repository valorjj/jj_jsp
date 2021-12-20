<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
JSONObject jsonObject = new JSONObject(); //json.simple.jar 에서 지원해준다.
// Collection Frameworks 의 'Map' 과 동일하다고 보면 된다. 
// 
jsonObject.put("id", "qwerqwer");
jsonObject.put("password", "12341234");
%>

<%=jsonObject%>