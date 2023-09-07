<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <link rel="stylesheet" href="style.css" />
    <title>dropdown Menu</title>
  </head>
  <style >
  	:root {
  --color-primary: #0073ff;
  --color-white: #e9e9e9;
  --color-black: #141d28;
  --color-black-1: #212b38;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: sans-serif;
 
}
.title{

	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);

}
.title h1{
	color: #fff;
	font-size: 80px;
}


.logo {
  color: white;
  font-size: 30px;
}

.logo span {
  color: white;
}

.menu-bar {
  background-color: var(--color-black);
  height: 80px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 5%;

  position: relative;
}

.menu-bar ul {
  list-style: none;
  display: flex;
}

.menu-bar ul li {
  /* width: 120px; */
  padding: 10px 20px;
  /* text-align: center; */

  position: relative;
}

.menu-bar ul li a {
  font-size: 20px;
  color: var(--color-white);
  text-decoration: none;

  transition: all 0.3s;
}

.menu-bar ul li a:hover {
  color: var(--color-primary);
}

.fas {
  float: right;
  margin-left: 10px;
  padding-top: 3px;
}

/* dropdown menu style */
.dropdown-menu {
  display: none;
}

.menu-bar ul li:hover .dropdown-menu {
  display: block;
  position: absolute;
  left: 0;
  top: 100%;
  background-color: var(--color-black);
}

.menu-bar ul li:hover .dropdown-menu ul {
  display: block;
  margin: 10px;
}

.menu-bar ul li:hover .dropdown-menu ul li {
  width: 150px;
  padding: 10px;
}

.dropdown-menu-1 {
  display: none;
}

.dropdown-menu ul li:hover .dropdown-menu-1 {
  display: block;
  position: absolute;
  left: 150px;
  top: 0;
  background-color: var(--color-black);
}

.hero {
  height: calc(100vh - 80px);
  background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(./bck.jpg);
  background-position: center;
}
.button{
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%,-50%);
}
.btn1{
	border: 1px solid #fff;
	padding: 10px 30px;
	margin-right: 10px;
	color: #fff;
	text-decoration: none;
}
.btn2{
	border: 1px solid #fff;
	padding: 10px 30px;
	margin-left: 10px;
	color: #fff;
	text-decoration: none;
}
.btn1:hover{
	background-color: #fff;
	color: #000;
}
.btn2:hover{
	background-color: #fff;
	color: #000;
}

  </style>
  <body>
  	<div class=title>
        <h1>Welcome to 7Flags <br>Amusement Park</h1>
      </div>
    <div class="menu-bar">
      <h1 class="logo"><span>7 Flags Amusement park</span></h1>
      <ul>
        <li><a href="website.jsp">Home</a></li>
        
        <li><a href="login.jsp">Booking<i class="fas fa-caret-down"></i></a>

            <div class="dropdown-menu">
                <ul>
                  <li><a href="login.jsp">My Bookings</a></li>
                  
                  <li>
                    <a href="login.jsp">Book<i class="fas fa-caret-right"></i></a>
                    
                    <div class="dropdown-menu-1">
                      <ul>
                        <li><a href="login.jsp">Rides</a></li>
                        <li><a href="login.jsp">Restaurants</a></li>
                        <li><a href="login.jsp">Shows</a></li>
                        
                      </ul>
                    </div>
                  </li>
                  
                </ul>
              </div>
        </li>
        <li><a href="#">Login<i class="fas fa-caret-down"></i></a>
        	<div class="dropdown-menu">
        		<ul>
        			<li><a href="login.jsp">User Login</a></li>
        			<li><a href="Adminlogin.jsp">Admin Login</a></li>
        		</ul>
        	</div>
        
        <li><a href="About.jsp">About</a></li>
       
      </ul>
    </div>

    <div class="hero">
      &nbsp;
    </div>
    <div class="button">
      <a href="#" class="btn1">Rides</a>
      <a href="#" class="btn2">Learn More</a>
    </div>
  </body>
</html>