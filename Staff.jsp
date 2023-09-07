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
	<label class="label" for="book">Staff:</label>
    <select name="booking" id="Booking" style="width: 200px; height: 40px;" class="option">
    <option value="Astaff"> A Staff </option>
    <option value="Mstaff"> M Staff </option>
    <option value="Pstaff"> P Staff </option>
    </select>       

    <input class="submit" type="submit"/>
</form>
    <table style="width: 550px" class="table">
        
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
            if (n.equals("Astaff")){
            	st=con.prepareStatement("select * from AccountingStaff");
            	 
            	 rs=st.executeQuery();
            	 %>
            		<tr>
    				<th>Astaff ID</th>
    				<th>Counter No</th>
    				<th>Name</th>
    				<th>Address</th>
    				<th>Salary</th>
				</tr>
				<% 
            	 while(rs.next()){
                 	System.out.println("3");
                 
             			%>
             		
             			<tr>
             				<td><%= rs.getString(1) %></td>
             				<td><%= rs.getString(2) %></td>
             				<td><%= rs.getString(3) %></td>
             				<td><%= rs.getString(4) %></td>
             				<td><%= rs.getString(5) %></td>
             				
             			</tr>
             			<%
             
     		}
             
                 
            }
            else if (n.equals("Mstaff")){
            	st=con.prepareStatement("select * from MaintenanceStaff ");
            	
            	rs=st.executeQuery();
            	 %>
         		<tr>
 				<th>Mstaff ID</th>
 				<th>Ride no</th>
 				<th>Name</th>
 				<th>Work Start Time</th>
 				<th>Work end Time</th>
 				<th>Salary</th>
				</tr>
				<%
            	while(rs.next()){
                	
                
            %>
            <tr>
            	<td><%= rs.getString(1) %></td>
            	<td><%= rs.getString(2) %></td>
            	<td><%= rs.getString(3) %></td>
            	<td><%= rs.getString(4) %></td>
            	<td><%= rs.getString(5) %></td>
            	<td><%= rs.getString(6) %></td>
            	
            </tr>
            <%
            
    		}
            
            }
            else if (n.equals("Pstaff")){
            	st=con.prepareStatement("select * from Performers");
            	
            	rs=st.executeQuery();
            	 %>
          		<tr>
  					<th>Performer ID</th>
  					<th>Show No</th>
  					<th>Name</th>
  					<th>Email</th>
  					<th>Salary</th>
  				
 				</tr>
 				<%
            	
            	while(rs.next()){
                	
                    
                    %>
                    <tr>
                    	<td><%= rs.getString(1) %></td>
                    	<td><%= rs.getString(2) %></td>
                    	<td><%= rs.getString(3) %></td>
                    	<td><%= rs.getString(4) %></td>
                    	<td><%= rs.getString(5) %></td>
                    	
                    </tr>
                    <%
                    
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