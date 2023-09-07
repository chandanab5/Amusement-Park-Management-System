<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html>
<head>
    <title>booking_status</title>
</head>
<style >
    body{
        margin: 0;
        padding: 0;
        font-family: Arial;
        background-image: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)),url("bck2.jpg")
    }
    table,td,th{
        border: 1px solid white;
    }
    .table th,td{
        color: white;
        align-content: center;
    }
    .table{
        margin-left: auto;
        margin-right: auto;
    }
    .h1{
        padding-top: 20px;
        text-align: center;
        color: white;
    }
    .from{
    	align-content: center;
    }
    .option{
    	margin: 25px;
    	padding-left: 50px;
  		background: rgba(0, 0, 0, 0.3);
  		color: darkblue;
  		text-shadow: 0 1px 0 rgba(0, 0, 0, 0.4);
  		background-color: white;
    }
    .submit{
		margin: 25px;
		width: 100px;
		height: 40px;
	}
	.label{
		padding-left: 15px;
		font-family: Arial;
		font-size: 25;
		color: white;
		border: black;

	}
</style>
<body>
    <h1 class="h1">Table of Contents</h1>

<form   method='post'>
	<label class="label" for="book">Type of booking:</label>
    <select name="booking" id="Booking" style="width: 200px; height: 40px;" class="option">
    <option value="rides"> Rides </option>
    <option value="res"> Restaurant </option>
    <option value="shows"> Shows </option>
    </select>       

    <input class="submit" type="submit"/>
</form>
    <table style="width: 400px" class="table">
        
  <%
        PreparedStatement st=null;
		ResultSet rs=null;
		try{
			
			
			PrintWriter A= response.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
            String n=request.getParameter("booking");
            //System.out.println(n);
            String e=(String)session.getAttribute("user");
            if (n.equals("rides")){
            	st=con.prepareStatement("select * from Books_rides where user_id=?");
            	 st.setString(1, e);
            	 rs=st.executeQuery();
            	 %>
            		<tr>
    				<th>Ride No</th>
    				<th>Ride Name</th>
    				<th>No of rides</th>
    				
				</tr>
				<% 
            	 while(rs.next()){
                 	System.out.println("3");
                 
             			%>
             		
             			<tr>
             				<td><%= rs.getString(1) %></td>
             				<td><%= rs.getString(2) %></td>
             				<td><%= rs.getString(3) %></td>
             				
             			</tr>
             			<%
             
     		}
             
                 
            }
            else if (n.equals("res")){
            	st=con.prepareStatement("select * from Restaurant where user_id=?");
            	st.setString(1, e);
            	rs=st.executeQuery();
            	 %>
         		<tr>
 				<th>Booking ID</th>
 				<th>Restaurant</th>
 				<th>Time</th>
 				
				</tr>
				<%
            	while(rs.next()){
                	
                
            %>
            <tr>
            	<td><%= rs.getString(1) %></td>
            	<td><%= rs.getString(2) %></td>
            	<td><%= rs.getString(3) %></td>
            	
            </tr>
            <%
            System.out.println("3");
    		}
            
            }
            else if (n.equals("shows")){
            	st=con.prepareStatement("select * from books_shows where user_id=?");
            	st.setString(1, e);
            	rs=st.executeQuery();
            	 %>
          		<tr>
  					<th>Show No</th>
  					<th>Show Name</th>
  					<th>No of Seats</th>
  				
 				</tr>
 				<%
            	
            	while(rs.next()){
                	
                    
                    %>
                    <tr>
                    	<td><%= rs.getString(1) %></td>
                    	<td><%= rs.getString(2) %></td>
                    	<td><%= rs.getString(3) %></td>
                    	
                    </tr>
                    <%
                    System.out.println("3");
            		}
                    
                    }
            
            
            ResultSetMetaData metadata = rs.getMetaData();
            System.out.println(metadata.getColumnCount());
            System.out.println(rs.getRow());
            
	}
	catch (Exception ex){
		
	}
        %>
      
    </table>
</body>
</html>