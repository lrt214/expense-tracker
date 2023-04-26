


function checklogin()
{
	
let temp=false;
let username= document.getElementById("userin").value;
let password=document.getElementById("passin").value;
if(username=="")
{
	document.getElementById("username").innerHTML="Enter Your Username";
	temp=false;
}
else
{
	document.getElementById("username").innerHTML="";
}

if(password=="")
{
	document.getElementById("password").innerHTML="Enter Your Password";
	temp=false;
}
else
{
	document.getElementById("password").innerHTML="";
}

if(temp==true)
{
	return true;
}
else
{
	return false;
}

console.log("hello validation")
}