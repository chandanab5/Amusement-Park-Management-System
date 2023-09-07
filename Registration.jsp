<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

<form class="box" action="Register" method="post">
  <h1>Sign Up</h1>
  <input type="text" name="userid" placeholder="User ID">
  <input type="text" name="firstname" placeholder="First Name">
  <input type="text" name="lastname" placeholder="Last Name">
  <input type="password" name="password" placeholder="Password">
  <input type="text" name="email" placeholder="Email">
  <input type="submit" name="" value="Sign Up">
</form>


  </body>
</html>
