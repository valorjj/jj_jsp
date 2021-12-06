<%@page import="dao.Login_Id"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");


String newname = request.getParameter("newname");

Login_Id login = (Login_Id) session.getAttribute("login");


String loginid = login.getM_id();
String name = request.getParameter("name");
String password = request.getParameter("password");
String phone = request.getParameter("phone");
String birthdate = request.getParameter("birthdate");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String address3 = request.getParameter("address3");
String address4 = request.getParameter("address4");
String address = address1 + "," + address2 + "," + address3 + "," + address4;

boolean res_name_update = MemberDao.getmemberDao().member_update_name(name, loginid);
boolean res_password_update = MemberDao.getmemberDao().member_update_password(password, loginid);
boolean res_phonenumber_update = MemberDao.getmemberDao().member_update_password(phone, loginid);
boolean res_birthdate_update = MemberDao.getmemberDao().member_update_birthdate(birthdate, loginid);
boolean res_address_update = MemberDao.getmemberDao().member_update_address(address, loginid);


/* if( newname != null){
	
	if(MemberDao.getmemberDao().member_update("m_name", newname, loginid){
		
		
	} else {
		
		
	}
	
} */


if (res_name_update) {
	out.print("1");
}

if (res_password_update) {
	out.print("2");
}

if (res_phonenumber_update) {
	out.print("3");
}
if (res_birthdate_update) {
	out.print("4");
}
if (res_address_update) {
	out.print("5");
}
%>