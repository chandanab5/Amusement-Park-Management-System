<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.UUID" %>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ticket booking</title>
</head>
<style type="text/css">
    body{
        background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url(bck2.jpg);
    }
    .h1{
        margin: 20px;
        text-align: center;
        color: white;
        font-family: Times New Roman;
        letter-spacing: 1px;
    }
    .form{
        margin-top: 50px;
    }
    .label{
        margin-left: 30px;
        font-family: Arial;
        font-size: 20px;
        color: white;
    }
    .input{
        margin-left: 10px;  
    }
    .submit{
        margin-left: 40px;
        width: 80px;
        height: 25px;
    }
    .table{
        color: white;
        font-family: Arial;
        font-size: 20px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 30px;
    }
    th, td {
        border: 1px solid white;
    }
</style>
<body>
    <h1 class="h1">Ticket booking</h1>
    <form class="form" method="post">
        <label class="label" for="book">User ID:</label>
        <input class="input" type="text" name="userid" placeholder="">
        <label class="label" for="book">Counter ID:</label>
        <input class="input" type="text" name="counterid" placeholder="" >
        
        <input class="submit" type="submit" />
    <table style="width: 80%" class="table">
        <tr>
            <th>User ID</th>
            <th>Counter ID</th>
            <th>TicketID </th>
            
        </tr>
        <%
        PreparedStatement st=null;
        ResultSet rs=null;
        PreparedStatement es=null;
        ResultSet rq=null;
        
        try{
            PrintWriter A= response.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
            String a=request.getParameter("userid");
            String b=request.getParameter("counterid");
            String e=(String)session.getAttribute("user");
            
            if (e == null ){
                System.out.println("error");
            }
            else if(e!=null && a!=null ){
            	
                st=con.prepareStatement("select * from purchasesticket where user_id=?");
                st.setString(1, a);
                rs=st.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    
                </tr>
                <% 
                	
                
                }
            }
            else if(e!= null && b!=null){
            	st=con.prepareStatement("select * from purchasesticket where Counter_id=?");
                st.setString(1, a);
                rs=st.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    
                </tr>
                <% 
                	
                
                }
            }
            
            
        }
        catch (Exception e){
        }
        %>
    </table>
    </form>
</body>
</html>