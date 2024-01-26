<%@ page import="java.sql.*"%>
<%@ page import="shop.ConnectionProvider"%>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>