<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
    if(request.getSession().getAttribute("user_obj")==null)
    {	
    
   			response.sendRedirect("logIn.jsp");
   			return;
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense</title>
    <link rel="icon" type="/images/png" href="./images/wallet.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
</head>
<%@ page import="com.java.component.RegisterUser" %>
<%@ page import="com.java.service.Service" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.component.Transaction" %>
<%
List<Transaction> list1=(List<Transaction>)request.getSession().getAttribute("expense_list1");
RegisterUser obj=(RegisterUser)request.getSession().getAttribute("user_obj"); 

%>

<body>
    <div class="container-fluid" style="height:100vh">
        <div class="row">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand fw-bold fs-3 "  href="index.jsp">Expense Manager</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link  fs-5 " aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link  fs-5" href="addRevenue.jsp">Add Revenue</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link fs-5  active" href="#">Add Expense</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link fs-5" href="logout.app">Log Out</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div  class="row mt-3 justify-content-center">
            <div class="col-6 " >
                <div class="row justify-content-center ">
                    <div class="card text-black  mb-3" style="max-width: 18rem; background-color: rgba(87, 248, 122, 0.6);">
           
                        <div class="card-body text-center">
                          <h5 class="card-title">Current Balance</h5>
                          <p class="card-text fw-bold">Rs <%=obj.getBalance() %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row  mt-3 bg-light"  style="height:73vh">
            <div class="col-sm-12 col-md-6 col-lg-6 ">
           
                <div class="row justify-content-center">
                    <div class="text-center">
                        <h2>Your Last 10 Expense</h2>
                    </div>
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Category</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Type</th>
                          </tr>
                        </thead>
                        <tbody>
                          <% for(Transaction tx:list1){ %>
                          <tr>
                             
                            <td><%=tx.getDate() %></td>
                            <td><%= tx.getCategory()%></td>
                            <td><%= tx.getAmount()%></td>
                            <td><%=tx.getType() %></td>
                          </tr>
                          <%} %>
                        </tbody>
                      </table>
                </div>

            </div>
            <div class="col-sm-12 col-md-6 col-lg-6">
                <div class="row text-center">
                <h2>Add Your Expense</h2>
            </div>
            <div class="row justify-content-center bg-light">
            <div class="col-8">
                 <form action="addexpense.app" method="post" onsubmit="return validation()">
                   
                    <label>Type Of Expense:</label><br>
                    <select  name="type" class="form-select " aria-label="Default select example">
                       
                        <option  value="Food">Food</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Medical">Medical</option>
                        <option value="Other">Other</option>
                      </select><br>
                   
                    
                        <label>Description:</label><br>
                        <input id="description" class="form-control " name="description" type="text"/>
                        <span id="desc" class="text-danger"></span><br>
                    
                    
                            <label>Amount:</label><br>
                            <input id="amount" class="form-control " name="amount" type="text"/>
                    		<span id="amounterror" class="text-danger"></span><br>
                        <br>
                        <div class="text-center">
                        <input class="btn btn-dark" type="submit" value="ADD EXPENSE"/>
                    </div>
                
                </form>
                </div>
                </div>
            </div>

        </div>
    </div>
    
     
    <script type="text/javascript">
      function validation(){
        let temp=true;
        var description = document.getElementById("description").value;
       
        var amount = document.getElementById("amount").value;
      
        const regexExp = /^[6-9]\d{9}$/gi;

        
            
        if (description.length <= 2 || description.length > 30) {
          document.getElementById("desc").innerHTML =
            " ** Description length must be between 2 and 30 ";
            temp=false;
        }
        else
        if (!isNaN(description)) {
          document.getElementById("desc").innerHTML =
            " ** only characters are allowed";
            temp=false;
        }
        else
        	
        if (description == "") {
                document.getElementById("desc").innerHTML =
                  " ** Please fill the Description field ";
                temp=false;
              
        }
        else
        	{
        	
                document.getElementById("desc").innerHTML =
                  "";
              
        	}
        
        if (amount == "") {
          document.getElementById("amounterror").innerHTML =
            " ** Please fill the amount field ";
            temp=false;
        }
        else

        if (isNaN(amount)) {
          document.getElementById("amounterror").innerHTML =
            " ** User must write digits only not characters ";
            temp=false;
        }
        else{
          document.getElementById("amounterror").innerHTML =
            "";
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