<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" required="true" rtexprvalue="true" %>
<%@ attribute name="content" fragment="true"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>@{title }</title>

<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/chosen.min.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/navbar.css">
<link rel="stylesheet" type="text/css" href="/Cliente_Web/css/bootstrap-theme.min.css">

<script src="/Cliente_Web/Scripts/jquery-3.2.1.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table.js"></script>
<script src="/Cliente_Web/Scripts/chosen.jquery.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-es-ES.min.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-filter.js"></script>
<script src="/Cliente_Web/Scripts/bootstrap-table-filter.es-LA.js"></script>



</head>
<body>
<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Nombre Empresa?</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> Pedidos <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">Nuevo</a></li>
							<li><a href="#">Mis pedidos</a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid --> </nav>
	<div class="container">
			<jsp:invoke fragment="content"></jsp:invoke>
		</div>

</body>
</html>