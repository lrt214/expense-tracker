<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(request.getSession().getAttribute("user_obj")==null)
    {	
    	System.out.println("hello");
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
    <title>Dashboard</title>
    <link rel="icon" type="/images/png" href="./images/wallet.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<body>
<%@ page import="com.java.component.RegisterUser" %>
<%@ page import="com.java.service.Service" %>
<%@ page import="java.util.List" %>
<%@ page import="com.java.component.Transaction" %>


<% RegisterUser obj=(RegisterUser)request.getSession().getAttribute("user_obj");   
	System.out.println(obj.getId());
	int shopping_total=(Integer)request.getSession().getAttribute("shopping_total");
	
	int food_total=(Integer)request.getSession().getAttribute("food_total");
	
	int other_total=(Integer)request.getSession().getAttribute("other_total");
	
	int medical_total=(Integer)request.getSession().getAttribute("medical_total");
	
	List <Transaction> table_list=(List<Transaction>)request.getSession().getAttribute("table_list1");
  //Service ser=new Service();
//   int shoppingtotal=ser.fetchShoppingTotal(obj.getId());
   
%>


    <div class="container-fluid">
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
                            <a class="nav-link active fs-5 " aria-current="page" href="">Home</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link  fs-5" href="addRevenue.jsp">Add Revenue</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link fs-5" href="addExpense.jsp">Add Expense</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-5" href="logout.app">Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="row text-center shadow">
        <h2>Welcome <%= obj.getName() %></h2>
    </div>
    <div class="row mt-3 ">

        <div class="col">
            <div class="card text-black  mb-3" style="max-width: 18rem; background-color:rgba(233, 192, 13, 0.6);">
           
                <div class="card-body text-center">
                  <h5 class="card-title">Balance</h5>
                  <p class="card-text"><%= obj.getBalance() %></p>
                </div>
            </div>

        </div>
        <div class="col">

            <div class="card text-black  mb-3" style="max-width: 18rem; background-color:rgba(109,120,173,0.6)">
           <%  %>
                <div class="card-body text-center">
                  <h5 class="card-title">Shopping</h5>
                  <p class="card-text">Rs <%=shopping_total %></p>
                </div>
            </div>
        </div>
        <div class="col">

            <div class="card text-black  mb-3" style="max-width: 18rem; background-color:rgba(81,205,160,0.6)">
           
                <div class="card-body text-center">
                  <h5 class="card-title">Food</h5>
                  <p class="card-text">Rs <%=food_total %></p>
                </div>
            </div>
        </div>
        
         <div class="col">

            <div class="card text-black  mb-3" style="max-width: 18rem;background-color:rgba(233,161,155,0.6)">
           <%  %>
                <div class="card-body text-center">
                  <h5 class="card-title">Medical</h5>
                  <p class="card-text">Rs <%=medical_total %></p>
                </div>
            </div>
        </div>

        <div class="col">

            <div class="card text-black  mb-3" style="max-width: 18rem;background-color:rgba(76,156,160,0.2);">
           
                <div class="card-body text-center">
                  <h5 class="card-title">Others</h5>
                  <p class="card-text">Rs<%=other_total %></p>
                </div>
            </div>
        </div>
        
    </div>
    <div class="row" style="height: 75vh;">
        <div class="col-sm-12 col-md-6 col-lg-6 bg-light  border border-dark">
            <div class="row text-center">
                <h2>Your Last 10 Transactions</h2>
            </div>
            <div class="row">

                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Amount (In Rs)</th>
                        <th scope="col">Category</th>
                        <th scope="col">Type</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%for(Transaction tr:table_list){ %>
                      <tr>
                       <td><%=tr.getDate() %></td>
                        <td><b> <%=tr.getAmount() %></b></td>
                        <%if(tr.getCategory().equals("expense")){ %>
                        <td style="color:red";><%= tr.getCategory() %></td>
                        <%}else{ %>
                        <td style="color:green";><%= tr.getCategory() %></td>
                        <%} %>
                       
                        <td><%=tr.getType() %></td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
            </div>



        </div>
       <!--   <div class="col-6 bg-light border">
            <div class="row text-center">
                <h2>Add Expense</h2>
            </div>
            <div class="row bg-light justify-content-center ">
                <div class="col-12 col-md-6  ">
                <form action="addexpense.app" method="post">
                   
                    <label>Type Of Expense:</label><br>
                    <select  name="type" class="form-select " aria-label="Default select example">
                       
                        <option  value="Food">Food</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Medical">Medical</option>
                        <option value="Other">Other</option>
                      </select><br>
                   
                    
                        <label>Description:</label><br>
                        <input class="form-control " name="description" type="text"/><br>
                        
                    
                    
                            <label>Amount:</label><br>
                            <input class="form-control " name="amount" type="text"/>
                    
                        <br>
                        <div class="text-center">
                        <input class="btn btn-dark" type="submit" value="ADD EXPENSE"/>
                    </div>
                
                </form>
            </div>
            </div>
        </div> -->
        <div class="class=col-sm-12 col-md-6 col-lg-6 bg-light  " ">
        
        <%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Shopping"); map.put("y", shopping_total); map.put("exploded", true); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Food"); map.put("y", food_total); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Medical"); map.put("y", medical_total); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Other"); map.put("y", other_total); list.add(map);

String dataPoints = gsonObj.toJson(list);
%>
 
 
 <script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "Your Expense",
	exportEnabled: true,
	title:{
		text: " Expense Breakdown"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}</strong>",
		indexLabel: "{label} {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
<div id="chartContainer" ></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        </div>


    </div>
</div>
    
</body>
</html>