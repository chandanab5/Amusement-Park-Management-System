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
        <label class="label" for="book">Number of tickets:</label>
        <input class="input" type="text" name="No_of_Tickets" placeholder="">
        <label class="label" for="book">Number of Adults:</label>
        <input class="input" type="text" name="Adult" placeholder="" >
        <label class="label" for="book">Number of children:</label>
        <input class="input"type="text" name="child" placeholder="" >
        <input class="submit" type="submit" />
    <table style="width: 80%" class="table">
        <tr>
            <th>S.No</th>
            <th>Number of adults</th>
            <th>Number of children</th>
            <th>price of adult ticket</th>
            <th>price of children ticket</th>
            <th>Total price</th>
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
            String a=request.getParameter("No_of_Tickets");
            String b=request.getParameter("Adult");
            String c=request.getParameter("child");
            String e=(String)session.getAttribute("user");
            int result=0;
            int total_tickets=0;
            System.out.println(e);
            String w="0";
            int n1=Integer.parseInt(request.getParameter("Adult"));
            int n2=Integer.parseInt(request.getParameter("child"));
            if (e == null && b.equals(null) && c.equals(null)){
                System.out.println("error");
            }
            else if(e!=null && b!=null && c!=null){
            	UUID q=UUID.randomUUID(); 
            	System.out.println(q);
            	String r=q.toString();
                result=(n1*400)+(n2*300);
                total_tickets=(n1+n2);
                String d=String.valueOf(result);
                String t=String.valueOf(total_tickets);
                st=con.prepareStatement("insert into entry_ticket_counter values(?,?,?,?,?)");
                st.setString(1, r);
                st.setString(2, w);
                st.setString(3, c);
                st.setString(4, b);
                st.setString(5, d);
                
                rs=st.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                    <td>1</td>
                    <td><%= b %></td>
                    <td><%= c %></td>
                    <td> 400</td>
                    <td>300</td>
                    <td><%= d %></td>
                </tr>
                <% 
                	if(b!=null && c!=null){
                		UUID y=UUID.randomUUID(); 
                    	System.out.println(y);
                    	String s=y.toString();
                		es=con.prepareStatement("insert into PurchasesTicket values(?,?,?)");
                		es.setString(1,e);
                		es.setString(2,r);
                		es.setString(3,s);
                		rq=es.executeQuery();
                		
                	}
                response.sendRedirect("loginwebsite.jsp");
                
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