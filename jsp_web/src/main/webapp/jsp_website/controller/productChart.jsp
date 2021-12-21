<%@page import="dao.POrderDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String type = request.getParameter("type");
JSONObject jsonObject = new JSONObject(); //json.simple.jar 에서 지원해준다.
// Collection Frameworks 의 'Map' 과 동일하다고 보면 된다. 
/* jsonObject.put("id", "qwerqwer");
jsonObject.put("password", "12341234"); */

if (type.equals("1")) {
	jsonObject = POrderDao.getPOrderDao().getOrderByDate();
} else if (type.equals("2")) {
	jsonObject = POrderDao.getPOrderDao().getPCount();
} else if (type.equals("3")) {
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	jsonObject = POrderDao.getPOrderDao().getEachCount(p_no);
}
%>

<%=jsonObject%>