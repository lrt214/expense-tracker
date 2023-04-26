<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" type="/images/png" href="./images/wallet.jpg">
    
    <link rel="icon" type="image/png" href="pictures/icon.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

<script>
    function  login()
    {
        let a=true;
        let user=document.querySelector(".user").value;
        let pass=document.querySelector(".pass").value;
      
        if(user=="")
        {
            document.querySelector("#username").innerHTML="Enter Username"
            a=false
        }
        else
        {
            document.querySelector("#username").innerHTML=""
        }
        
        if(pass=="")
        {
            document.querySelector("#password").innerHTML="Enter Password"
            a=false
        }
        else
        {
            document.querySelector("#password").innerHTML=""
        }
       
        if(a==true)
        {
           return true
           
        }
        else
        {

            
            return false
        }
    }
</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<style>
    

    
</style>
</head>
<body>
  
    <div class="container-fluid bg-light" style="height:100vh; background-image:url('./images/4-investing.gif');background-repeat: no-repeat;  height: 100%;
    background-size: 100% 100%;">
        <div class="row mt-2 justify-content-center align-content-center  " style="height:100vh">
            <div class="col-sm-12 col-md-4 fw-bold text-dark  shadow" style="height: 350px;background-color:  rgba(255, 255, 255, 0.4);" >
                <div class="text-center"><h1>LOGIN</h1></div>
            <form action="login.app" class="mt-5 " method="post" onsubmit="return login()">
                
                <label>Enter Username:</label><br>
                <input type="text" name="username" class="form-control user" placeholder="Username"/>
                <span id="username" class="text-danger"></span><br>
           
            <div>
                <label>Enter Password:</label><br>
                <input type="password" name="password" class="form-control pass" placeholder="Password"/>
                <span id="password" class="text-danger">${valid.loginError}</span><br>
            </div>
               <div class="text-center"> <input  
                type="submit"
                class="btn btn-dark justify-content-center" value="Login"/></div>
                <span>Dont have Account: <a href="signUp.jsp">Register Now</a></span>
            </form>
        </div>
        </div>
    </div>
</body>
</html>