<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" required="true" rtexprvalue="true" %>
<%@ attribute name="content" fragment="true"  %>
<% 
    Cookie[] cookies = request.getCookies();
    String cookieValue = null; 
    // Get cookie value
    if (cookies != null) { 
        for (int i = 0; i < cookies.length; i++) { 
            if (cookies[i].getName().equals("usuario")) { 
                cookieValue = cookies[i].getValue();
            }
        }
    }
    

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=title %></title>

<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/chosen.min.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/navbar.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap-datepicker.min.css">

<script src="/Cliente_Web/Scripts/jquery-3.2.1.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table.js"></script>
<script src="/Cliente_Web/Scripts/chosen.jquery.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-es-ES.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-filter.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-filter.es-LA.js"></script>
<script src="/Cliente_Web/Scripts/Mati.js"></script>
<script src="/Cliente_Web/Scripts/jquery.blockUI.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-datepicker.min.js"></script>



</head>
<body>
<style>
li{
list-style: none;
}
a{
cursor:pointer;
}
.navbar-brand{
	padding: 5px;
    margin: 0px 30px;
    margin-left:30px !important;
}
#imagenLogo{
height: 100%;
}
</style>
<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/Cliente_Web/jsp/Home.jsp"><img alt="WWG" id="imagenLogo" src="/Cliente_Web/Images/GGWLogo.png"> </a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<%if(cookieValue.equals("empleado")){ %>
							<li><a href="/Cliente_Web/jsp/Home.jsp">Home</a></li>
							<li><a href="/Cliente_Web/jsp/Pedidos.jsp">Pedidos</a></li>
							<li><a href="/Cliente_Web/jsp/OrdenesProduccion.jsp">Ordenes de Produccion</a></li>
							<li><a href="/Cliente_Web/PedidosInsumo/View">Pedidos Insumos</a></li>
							<li><a href="/Cliente_Web/jsp/Insumos.jsp">Insumos</a></li>
							<li><a href="/Cliente_Web/jsp/Prendas.jsp">Prendas</a></li>
							<li><a href="/Cliente_Web/jsp/Clientes.jsp">Clientes</a></li>
								<%} else{%>
					<li><a href="/Cliente_Web/home/clientes">Home</a></li>			
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> Pedidos <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
						
							
					
							<li><a href="/Cliente_Web/pedidos/alta/view" >Nuevo</a></li>
							<li><a href="/Cliente_Web/jsp/viewPedidosCliente.jsp">Mis pedidos</a></li>
							
						</ul></li>
						<%} %>
						
				</ul>
				<ul><li class="pull-right">
				<a class="navbar-brand" href="/Cliente_Web/jsp/Login.jsp">Salir</a>
			</li></ul>
			</div>
			
			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid --> </nav>
	<div class="container">
	<script>
	function getCookie(name) {
		  var value = "; " + document.cookie;
		  var parts = value.split("; " + name + "=");
		  if (parts.length == 2) return parts.pop().split(";").shift();
		}
	var usuario = getCookie('usuario');
	var kdmskd = '<%=cookieValue%>'
	</script>
			<jsp:invoke fragment="content"></jsp:invoke>
		</div>

</body>
</html>