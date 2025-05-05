<%-- 
    Document   : rahul
    Created on : Mar 8, 2025, 1:04:32 PM
    Author     : rahul
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String 
name=request.getParameter("nm");
String 
phone=request.getParameter("ph");
String 
email=request.getParameter("email");
String 
msg=request.getParameter("msg");

try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahul","root", "");
Statement statement=conn.createStatement();
String SQ="insert into singh (name,phone,email,msg) values('"+name+"','"+phone+"','"+email+"','"+msg+"')";
int k=statement.executeUpdate(SQ);
if(k==1)
{
 %>   
 <script>
    alert("Send Success, Contact you Soon")
    window.location.href="index.html"
 </script>
<%    
}
conn.close();
}
catch (Exception e) 
{
out.print(e);
}
%>
