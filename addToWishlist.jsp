<%@ page import="java.sql.*" %>
<%@ page import="shop.ConnectionProvider" %>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");

int z = 0;
try {
    Connection con = ConnectionProvider.getConn();
    Statement st = con.createStatement();

    // Query to retrieve product details by ID
    ResultSet rs = st.executeQuery("SELECT * FROM products WHERE id='" + product_id + "'");
    int price = 0; // Default price value
    String name = "";
    String category = "";

    if (rs.next()) {
        // Move the cursor to the first row if it exists
        price = rs.getInt("price");
        name = rs.getString("name");
        category = rs.getString("category");
    } else {
        // Handle the case where no rows were found in the ResultSet
        // You might want to set a default value for price or handle it as needed
    }

    
    ResultSet rs1 = st.executeQuery("SELECT * FROM wishlist WHERE id='" + product_id + "' AND email='" + email + "'");
    while (rs1.next()) {
        z = 1;
    }

    if (z == 1) {
        response.sendRedirect("home.jsp?msg=exist");
    }

    if (z == 0) {
        PreparedStatement ps = con.prepareStatement("INSERT INTO wishlist (email,id, name, price, category) VALUES (?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, product_id);
        ps.setString(3, name);
        ps.setInt(4, price);
        ps.setString(5, category);
        ps.executeUpdate();
        response.sendRedirect("wishlist.jsp?msg=added");
    }
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("home.jsp?msg=invalid");
}
%>
