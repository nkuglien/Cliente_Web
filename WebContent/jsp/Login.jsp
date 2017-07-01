<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  padding-top:20px;	
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
#imagenLogo{
    width: 60%;
    margin-bottom: 20px;
}
</style>
<div class="login-page">
  <div class="form">
  <div class="header"><img alt="WWG" id="imagenLogo" src="/Cliente_Web/Images/GGWLogo.png"></div>
   
    <form class="login-form" method="post"  action="/Cliente_Web/Account">
      <input type="text" placeholder="username" name="username" id="username"/>
      <input type="password" placeholder="password" id="pass"/>
      <button type="button">login</button>
      <p class="message" style="color:red; display:none;">Login incorrecto</p>
    </form>
  </div>
</div>
<script src="/Cliente_Web/Scripts/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$("button").click(function(){
	if(($("#username").val()=="empleado" || validaCuit($("#username").val())) && $("#pass").val()!=""){
		$("form").submit();
	}
	else{
		 $('.message').show("slow");
	}
	
});

$('input').keypress(function(){
	   $('.message').hide("slow");
	});
	
	
	
function validaCuit(sCUIT) 
{     
    var aMult = '5432765432'; 
    var aMult = aMult.split(''); 
     
    if (sCUIT && sCUIT.length == 11) 
    { 
        aCUIT = sCUIT.split(''); 
        var iResult = 0; 
        for(i = 0; i <= 9; i++) 
        { 
            iResult += aCUIT[i] * aMult[i]; 
        } 
        iResult = (iResult % 11); 
        iResult = 11 - iResult; 
         
        if (iResult == 11) iResult = 0; 
        if (iResult == 10) iResult = 9; 
         
        if (iResult == aCUIT[10]) 
        { 
            return true; 
        } 
    }     
    return false; 
} 
</script>

</body>
</html>
