<%-- 
    Document   : cookies
    Created on : Mar 27, 2025, 4:03:04 PM
    Author     : rahul
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
          
    
String id=request.getParameter("id");
String pwd=request.getParameter("psw");
Cookie username = new Cookie("id",
 			  request.getParameter("id"));
   Cookie email = new Cookie("psw",
			  request.getParameter("psw"));

   
   username.setMaxAge(60*60*10); 
   email.setMaxAge(60*60*10); 

   // Add both the cookies in the response header.
   response.addCookie( username );
   response.addCookie( email );


try{
Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahul", "root", "");
Statement statement=conn.createStatement();
String sql ="select * from password";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
if(id.equals(resultSet.getString("Id")) && pwd.equals(resultSet.getString("Password")))
{
%>
<script>window.location.href="Admin/index.jsp"</script>
<%
}
else
{
%>
<script>alert("id and Password is wrong")
window.location.href="servlet.jsp"
</script>
<%
}

}
conn.close();
} catch (Exception e) {
out.print(e);
}
%>  
