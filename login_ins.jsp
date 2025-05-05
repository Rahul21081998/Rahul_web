<%-- 
    Document   : login_ins
    Created on : Mar 11, 2025, 4:08:48 PM
    Author     : rahul
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("psw");
out.print(pwd);
try{
Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahul", "root", "");//database name
Statement statement=conn.createStatement();
String sql ="select * from password";//table name
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
if(id.equals(resultSet.getString("Id")) && pwd.equals(resultSet.getString("Password")))
{
%>
<script>window.location.href="admin/index.jsp"</script>
<%
}
else
{
%>
<script>alert("id and Password is wrong")
window.location.href="login12.jsp"
</script>
<%
}

}
conn.close();
} catch (Exception e) {
out.print(e);
}
%>  
          
