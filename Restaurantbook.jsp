<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.UUID" %>
<%@page import="java.util.Scanner" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Booking</title>
</head>
<style >
	body{
		height: 80vh;
		background-size: cover;
		background-position: center;
		background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("img2.png");
	}
	.h1{
		text-align: center;
		font-family: Arial;
		color: white;
	}
	.label{
		padding-left: 15px;
		font-family: Arial;
		font-size: 15;
		color: white;
		border: black;

	}
	.option{
		margin: 25px;
  		background: rgba(0, 0, 0, 0.3);
  		color: darkblue;
  		text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
  		background-color: white;
	}
	.submit{
		margin: 25px;
		width: 100px;
		height: 25px;
	}
</style>
<body>
	<h1 class="h1">Restaurant Booking</h1>
	<form class="form" method="post" >
		
		<label class="label">Restaurant name</label>
		<select name="option1" id="Option2" style="width: 200px; height: 35px;" class="option">
			<option>-select-</option>
			<option value="udupi">Udupi Park</option>
			<option value="mcd">Mc'D</option>
			<option value="dominos">Dominos</option>
			<option value="punjabi">Punjabi Dhaba</option>
			<option value="spicy">Spicy Corner</option>
		</select>
		<label class="label">How many Seats</label>
		<select name="option2" id="Option1" style="width: 200px; height: 35px;" class="option">
			<option>-select-</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>

		
		<input class="submit" type="submit"/>
		</form>
	
	<%
	PreparedStatement ps=null;
	ResultSet rs=null;
	try{
		
		
		PrintWriter A= response.getWriter();
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
        String n=request.getParameter("option1");
        String k=request.getParameter("option2");
        
        //System.out.println(n);
        String e=(String)session.getAttribute("user");
        
        if (e == null){
        	System.out.println("Error");
        }
        else if(e!=null && n!=null){
        	UUID q=UUID.randomUUID(); 
        	System.out.println(q);
        	String w=q.toString();
        	if (w != null){
        		
        		ps=con.prepareStatement("insert into Restaurant values(?,?,?,?)");
                ps.setString(1, w);
                ps.setString(2, e);
                ps.setString(3, n);
                ps.setString(4,k);
                rs=ps.executeQuery();
        		
        	}
        	
        }
        	
        
	}
catch (Exception ex){
		
	}
	%>
</body>
</html>