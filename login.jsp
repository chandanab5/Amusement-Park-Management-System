<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter" %>
<html >
  <head>
    <meta >
    <title>Login Form</title>
    <link rel="stylesheet" href="style.css">
  </head>

<style>
body{
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background-image:linear-gradient(rgba(0, 0, 0, 0.7),rgba(0, 0, 0, 0.7)) ,url("bck2.jpg");
	height: 100vh;
	background-size: cover;
	background-position: center;
}
.box{
  width: 300px;
  padding: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  background-color: rgba(0,0,0,0.7);
  text-align: center;
}
.box h1{
  color: white;
  text-transform: uppercase;
  font-weight: 500;
}
.box input[type = "text"],.box input[type = "password"]{
  border:0;
  background: none;
  name: "Madhav";
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #3498db;
  padding: 14px 10px;
  width: 200px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.25s;
}
.box input[type = "text"]:focus,.box input[type = "password"]:focus{
  width: 280px;
  border-color: #2ecc71;
}
.box input[type = "submit"]{
  border:0;
  background: none;
  display: block;
  margin: 20px auto;
  text-align: center;
  border: 2px solid #2ecc71;
  padding: 14px 40px;
  outline: none;
  color: white;
  border-radius: 24px;
  transition: 0.25s;
  cursor: pointer;
}
.box input[type = "submit"]:hover{
  background: #2ecc71;
}


</style>
  <body>
 

<form class="box"  method="post">
  <h1>Login</h1>
  <input type="text" name="txtName" placeholder="Username">
  <input type="password" name="txtPwd" placeholder="Password">
  <input type="submit" name="" value="Login">
  
   <a href="Registration.jsp">Don't have an account yet?  Sign Up</a>
</form>
 <%
  try {
      PrintWriter B= response.getWriter();
      Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
      String n=request.getParameter("txtName");
      String p=request.getParameter("txtPwd");
      PreparedStatement ps=con.prepareStatement("select user_id from user_login where user_id=? and password=?");
      ps.setString(1, n);
      ps.setString(2, p);
      session.setAttribute("user",n);
      
      //System.out.println(ps);
      ResultSet rs=ps.executeQuery();
      //System.out.println(rs);
      
      int count=0;
      if(rs.next()){
          RequestDispatcher rd=request.getRequestDispatcher("loginwebsite.jsp");
          rd.forward(request, response);
      }
      else  {
    	  if (count!=0){
    		  out.println("<font color=red size=18>Login Failed!!<br>");
              out.println("<a href=login.jsp>Try AGAIN!!</a>");  
    	  }
          
      }
  }
  catch (ClassNotFoundException e) {
      e.printStackTrace();
  }
  catch (SQLException e) {
      e.printStackTrace();
  }
  %>

  </body>
</html>