<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<mt:Layout title="Pedidos Insumos">
	<jsp:attribute name="content">
		
<h2>Pedidos de compra de insumos</h2>


<div id="table"></div>


<div class="container" style="display: none;">
<form id="formCompletar">
	<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label>Proveedor</label>
			<select name="proveedor" class="form-control">
			<c:forEach var="prov" items="${proveedores}">
				<option value="${prov.id}">${prov.nombre}</option>
			</c:forEach>
			</select>
		</div>
		</div>
		<div class="col-md-3">
		<div class="form-group">
			<label>Fecha despacho</label>
			<input type="text" name="fechaDespacho" 
								class="form-control fecha" />
		</div>
		</div>
		<div class="col-md-3">
		<div class="form-group">
			<label>Precio Unidad</label>
			<input type="text" name="precioUnidad" class="form-control" />
		</div>
		</div>
	</div>
	</form>
	<form id="formTerminar">
	<div class="row">
	
		<div class="col-md-3">
		<div class="form-group">
			<label>Fecha despacho final</label>
			<input type="text" name="fechaDespachoReal" 
								class="form-control fecha" />
		</div>
		</div>
		
	</div>
	</form>
</div>


<script>
var tabla = $("#table");
	$(function() {
		$(".fecha").datepicker({
			format : 'dd/mm/yyyy',
			autoclose : true
		});

		

		tabla.bootstrapTable({
			url : "/Cliente_Web/PedidoInsumo",
			method : "GET",
			columns : columnas,
			pagination : "true",
			pageSize : 10,
			pageList : [ 10, 25, 50 ],
			search : true
		});

	});

	var columnas = [
			{
				field : "id",
				align : 'center',
				valign : 'middle',
				title : "ID",
				visible : true,
				width : '5%',
			},
			{
				field : "proveedor",
				align : 'center',
				valign : 'middle',
				title : "Proveedor",
				width : '15%',
				visible : true
			},
			{
				field : "fechaGeneracion",
				align : 'center',
				valign : 'middle',
				title : "Generacion",
				width : '10%',
				visible : true
			},
			{
				field : "fechaDespacho",
				align : 'center',
				valign : 'middle',
				title : "Despacho",
				width : '10%',
				visible : true
			},
			{
				field : "fechaDespachoReal",
				align : 'center',
				valign : 'middle',
				title : "Despacho real",
				width : '10%',
				visible : true
			},
			{
				field : "estado",
				align : 'center',
				valign : 'middle',
				title : "Estado",
				width : '10%',
				visible : true
			},
			{
				field : "insumo",
				align : 'center',
				valign : 'middle',
				title : "Insumo",
				width : '15%',
				visible : true
			},
			{
				field : "cantidad",
				align : 'center',
				valign : 'middle',
				title : "Cantidad",
				width : '5%',
				visible : true
			},
			{
				field : "precioUnidad",
				align : 'center',
				valign : 'middle',
				title : "Precio Unitario",
				width : '10%',
				visible : true
			},
			{
				field : 'boton',
				align : 'center',
				width : '10%',
				mostrar : true,
				events : {
					'click .completar' : function(e, value, row, index) {
						var formulario = $("#formCompletar");

						confirm(formulario, function() {
							var datos = formulario.serializeArray();
							datos.push({
								name : "Action",
								value : "completar"
							});
							datos.push({
								name : "id",
								value : row.id
							});

							$.post("/Cliente_Web/PedidoInsumo", datos,
									function(data) {
										if(data.Result=="OK"){
											alert("Actualizado correctamente");
											tabla.bootstrapTable("refresh");
										}
										else {
											alert(data.Mensaje);
										}

									});

						}, "Complete los datos del pedido");

					},
					'click .terminar' : function(e, value, row, index) {
						var formulario = $("#formTerminar");

						confirm(formulario, function() {
							var datos = formulario.serializeArray();
							datos.push({
								name : "Action",
								value : "terminar"
							});
							datos.push({
								name : "id",
								value : row.id
							});

							$.post("/Cliente_Web/PedidoInsumo", datos,
									function(data) {
										if(data.Result=="OK"){
											alert("Actualizado correctamente");
											tabla.bootstrapTable("refresh");
										}
										else {
											alert(data.Mensaje);
										}

									});

						}, "Ingrese los datos para terminar el pedido");
					}
				},
				formatter : function operateFormatter(value, row, index) {
					if (row.estado == "INICIAL")
						return "<a class='completar' title='Completar'><i class='fa fa-plus fa-lg' style='color:black'></i></a>";
					else if (row.estado == "COMPLETO")
						return "<a class='terminar' title='Terminar'><i class='fa fa-external-link fa-lg' style='color:black'></i></a>";
					else
						return "";

				}

			},

	];
</script>


</jsp:attribute>
</mt:Layout>
