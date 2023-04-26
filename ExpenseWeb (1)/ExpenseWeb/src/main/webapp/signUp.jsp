<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up</title>
    <link rel="icon" type="/images/png" href="./images/wallet.jpg">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
  </head>
  
  <%@ page import="java.util.Map" %>
  
  <%
  
  
  
  %>
  <body>
    <div class="container-fluid bg-secondary " style="background-image:url('./images/expense.gif');background-repeat: no-repeat;  height: 100%;
    background-size: 100% 100%;">
      <div
        class="row justify-content-center align-content-center"
        style="height: 100vh"
      >
        <div class="col-sm-12 col-md-4 col-lg-4  p-3 fw-bold text-dark" style="background-color: rgba(255, 255, 255, 0.4);">
          <div class="text-center">
            <h2>Register Now:</h2>
          </div>

          <form action="register.app" onsubmit="return validation()" class="=" bg-light>
            <label>Enter Your Name</label><br />
            <input
              id="name"
              class="form-control"
              type="text"
              name="name"
              placeholder="Name"
              value="${obj.name}" 
            />
            <span id="name1" class="text-danger"> </span><br>
            <label>Enter Your Email</label><br />
            <input
              id="email"
              class="form-control"
              type="text"
              name="email"
              placeholder="Email"
              value="${obj.email}" 
            />
            <span id="emailid" class="text-danger"> ${valid.isValidEmail}</span><br>
            <label>Enter Your Initial Balance</label><br />
            <input
              id="balance"
              class="form-control"
              type="text"
              name="balance"
              placeholder="Balance Amount"
              value="${obj.balance}" 
            />
            <span id="bal" class="text-danger"> </span><br>
            <label>Enter Your Mobile Number:</label><br />
            <input
              id="mob_no"
              class="form-control"
              type="tel"
              name="mob_no"
              placeholder="Mobile no."
              value="${obj.mob_no}" 
            />
            <span id="mobileno" class="text-danger"> ${valid.isValidMobile} </span><br>
            <label>Enter Your Username</label><br />
            <input
              id="username"
              class="form-control"
              type="text"
              name="username"
              placeholder="Username"
              value="${obj.username}"
            />
            <span id="user" class="text-danger">  ${valid.isValidMobile}</span><br>
            <label>Enter Your Password</label><br />
            <input
              id="password"
              class="form-control"
              type="password"
              name="password"
              placeholder="Password"
              value=""
            />
            <span id="passwords" class="text-danger"> </span><br>

            <div class="text-center">
              <input class="btn btn-dark" type="submit" value="Register" />
            </div>
            <span>Already have an Account: <a href="logIn.jsp">Login Now</a></span>
          </form>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      function validation(){
        let temp=true;
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var balance = document.getElementById("balance").value;
        var mob_no = document.getElementById("mob_no").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        const regexExp = /^[6-9]\d{9}$/gi;

        if (name == "") {
          document.getElementById("name1").innerHTML =
            " ** Please fill the Name field ";
          temp=false;
        }
        else     
        if (name.length <= 2 || name.length > 20) {
          document.getElementById("name1").innerHTML =
            " ** Name length must be between 2 and 20 ";
            temp=false;
        }
        else
        if (!isNaN(name)) {
          document.getElementById("name1").innerHTML =
            " ** only characters are allowed";
            temp=false;
        }
        else{
          document.getElementById("name1").innerHTML =
            "";
        }
        


        if (email == "") {
          document.getElementById("emailid").innerHTML =
            " ** Please fill the Email ID field ";
            temp=false;
        }
        else
        
        if (email.indexOf('@') <= 0) {
          document.getElementById("emailid").innerHTML =
            " ** Invalid @ position ";
            temp=false;
        }
        else
        if ((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')) {
          document.getElementById("emailid").innerHTML =
            " ** Invalid . position ";
            temp=false;
        }
        else{
          document.getElementById("emailid").innerHTML =
            " ";
        }
        


        if (balance == "") {
          document.getElementById("bal").innerHTML =
            " ** Please fill the Balance field ";
            temp=false;
        }
        else

        if (isNaN(balance)) {
          document.getElementById("bal").innerHTML =
            " ** User must write digits only not characters ";
            temp=false;
        }
        else{
          document.getElementById("bal").innerHTML =
            "";
        }


        if (mob_no == "") {
          document.getElementById("mobileno").innerHTML =
            " ** Please fill the Mobile Number field ";
            temp=false;
        }
        else

        if (isNaN(mob_no)) {
          document.getElementById("mobileno").innerHTML =
            " ** User must write digits only not characters ";
            temp=false;
        }
        else
        if (mob_no.length!=10) {
          document.getElementById("mobileno").innerHTML =
            " ** Mobile number must be 10 digits only ";
            temp=false;
        }
        else if(regexExp.test(mob_no)==false)
        {
          document.getElementById("mobileno").innerHTML =
            " ** Mobile number must start with 6 to 9 digits ";
            temp=false;
        }
        else{
          document.getElementById("mobileno").innerHTML =
            "";
        }


        if (username == "") {
          document.getElementById("user").innerHTML =
            " ** Please fill the Username field ";
            temp=false;
        }
        else
        
        if (username.length <= 2 || username.length > 10) {
          document.getElementById("user").innerHTML =
            " ** Username length must be between 2 and 10 ";
            temp=false;
        }
        else{
          document.getElementById("user").innerHTML =
            " ";
        }
       


        if (password == "") {
          document.getElementById("passwords").innerHTML =
            " ** Please fill the Password field ";
            temp=false;
        }
        else

        if (password.length <= 8 || password.length > 20) {
          document.getElementById("passwords").innerHTML =
            " ** Password length must be between 8 and 20 ";
            temp=false;
        }
        else{
          document.getElementById("passwords").innerHTML =
            " ";
        }
        if(temp==true)
        {
          return true;
        }
        else{
          return false;
        }
      }
    </script>
  </body>
</html>
