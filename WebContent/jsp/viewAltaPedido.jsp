<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pantalla de Creacion de Pedidos</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../css/navbar.css">

<script type="text/javascript">
	function agregarItem() {
		var trToClone= $('#tabla-items tbody tr:last');
		var clone = trToClone.clone();
		$('#tabla-items tbody').append(clone);
	};
	
	function onChangePrenda(prendaCombo) {
		var prendaSelected = prendaCombo.value;
		
		
	};
	
	function removeItem(removeButton) {
		$(removeButton).closest("tr").remove();
	};
</script>
</head>
<body>

	<div class="container">

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

		<div class="jumbotron">
			<h1>Realizar Nuevo Pedido</h1>
			<form>
				<table class="table" id="tabla-items">
					<thead>
						<tr>
							<th>Prenda</th>
							<th>Variedad</th>
							<th>Precio Unitario</th>
							<th>Cantidad</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						
							<tr>
								<td>
									<select name="prenda" class="form-control" onchange="javascript:onChangePrenda(this)">
										<c:forEach var="PendaListItem" items="${prendas}">
											<option value="${PendaListItem.codigo}">${PendaListItem.descripcion}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select name="variedad" class="form-control" onchange="javascript:onChangeVariedad(this)">
									</select>
								</td>
								<td><input type="text" class="form-control" name="precio" disabled></input></td>
								<td>
									<input type="number" name="cantidad" min="1"
									class="form-control"></input>
								</td>
								<td style="vertical-align:middle">
									<span class="glyphicon glyphicon-remove" aria-hidden="true" onclick="javascript:removeItem(this)"></span>
								</td>
							</tr>
					</tbody>
				</table>

				<div class="form-group">
					<a href="javascript:agregarItem()" class="btn btn-primary"
						role="button">Agregar Item</a>
				</div>


				<div class="form-group">
					<label for="subtotal">Subtotal</label> <input type="text"
						class="form-control" id="subtotal" placeholder="Subtotal">
				</div>
				<div class="form-group">
					<label for="impuestos">Impuestos</label> <input type="text"
						class="form-control" id="impuestos" placeholder="Impuestos">
				</div>
				<div class="form-group">
					<label for="total">Total</label> <input type="text"
						class="form-control" id="total" placeholder="Importe total">
				</div>
				<div class="form-group">
					<label for="nota">Nota</label>
					<textarea class="form-control" id="nota" rows="3"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Enviar Pedido</button>
			</form>

		</div>

	</div>
	<!-- /container -->

</body>
</html>