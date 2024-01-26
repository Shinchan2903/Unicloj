<%@page import="shop.ConnectionProvider" %>
<%@ page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString();
	String id = request.getParameter("id");
	String incdec = request.getParameter("quantity");
	int price =0;
	int total = 0;
	int quantity = 0;
	int final_total = 0;
	try{
		Connection con = ConnectionProvider.getConn();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL");
		while(rs.next()){
			price = rs.getInt(4);
			total = rs.getInt(5);
			quantity = rs.getInt(3);
		}
		if(quantity==1 && "dec".equals(incdec)){
			int x = st.executeUpdate("delete from cart where email='"+email+"' ");
			response.sendRedirect("home.jsp");
		}
		else if(quantity!=1 && "dec".equals(incdec)){
			total = total-price;
			quantity = quantity-1;
			st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
			response.sendRedirect("myCart.jsp?msg=dec");
		}
		else if ("inc".equals(incdec)){
			total = total+price;
			quantity = quantity+1;
			st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
			response.sendRedirect("myCart.jsp?msg=inc");
		}
		else{
			response.sendRedirect("myCart.jsp?msg=invalid");
		}
		
	}
	catch(Exception e){
		System.out.println(e);
	}
	
%>