<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<mt:Layout title="Nuevo Pedido" >
<jsp:attribute name="content">
		<div class="jumbotron">
			<h1>Realizar Nuevo Pedido</h1>
			<form action="/Cliente_Web/pedidos/altas/save" method="POST">
				<table class="table" id="tabla-items">
					<thead>
						<tr>
							<th>Preda</th>
							<th>Variedad</th>
							<th>Precio Unitario</th>
							<th>Cantidad</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						
							<tr>
								<td>
									<select name="prenda" class="form-control prendaCombo" onchange="javascript:onChangePrenda(this)">
										<c:forEach var="PendaListItem" items="${prendas}">
											<option value="${PendaListItem.codigo}">${PendaListItem.descripcion}</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select name="variedad" class="form-control variedadCombo" onchange="javascript:onChangeVariedad(this)">
									</select>
								</td>
								<td><input type="text" class="form-control precioInput" name="precio" readonly="readonly"></input></td>
								<td>
									<input type="number" name="cantidad" min="1" onChange="javascript:calcularTotales()"
									class="form-control cantidadInput"></input>
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
					<label for="subtotal">Subtotal</label> <input type="text" name="subtotal" readonly="readonly"
						class="form-control inputSubtotal" id="subtotal" placeholder="Subtotal">
				</div>
				<div class="form-group">
					<label for="impuestos">Impuestos</label> <input type="text" name="impuestos" readonly="readonly"
						class="form-control inputImpuestos" id="impuestos" placeholder="Impuestos">
				</div>
				<div class="form-group"> 
					<label for="total">Total</label> <input type="text" name="total" readonly="readonly"
						class="form-control inputTotal" id="total" placeholder="Importe total">
				</div>
				<div class="form-group">
					<label for="nota">Nota</label>
					<textarea name="nota" class="form-control" id="nota" rows="3"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">Enviar Pedido</button>
			</form>

		</div>
		
<script type="text/javascript">

	$(document).ready(function() {
		var prendaCombo = $('#tabla-items tbody tr:first .prendaCombo');
		var defaultCodigoPrenda = prendaCombo[0].value;
		loadVariedades(defaultCodigoPrenda, prendaCombo);
	});

	function agregarItem() {
		var trToClone= $('#tabla-items tbody tr:last');
		var clone = trToClone.clone();
		$('#tabla-items tbody').append(clone);
		
		var prendaCombo = $(clone).find('.prendaCombo');
		var codigoPrenda = prendaCombo[0].value;
		loadVariedades(codigoPrenda, prendaCombo);
	};
	
	function onChangePrenda(prendaCombo) {
		var prendaSelected = prendaCombo.value;
		loadVariedades(prendaSelected, prendaCombo);
	};
	
	function loadVariedades(codigoPrenda, prendaCombo) {
		$.ajax({
			method: "GET",
			url: "/Cliente_Web/variedades/findAll?codigoPrenda=" + codigoPrenda
		})
		.done(function(data) {
		    var variedadCombo = $(prendaCombo).closest("tr").find("select.variedadCombo");
		    $(variedadCombo).find('option').remove();
		    for(i = 0; i < data.length; i++) {
		    	console.log(data[i]);
		    	var option = '<option data-precio="' + data[i].precioVentaActual + '" value="' + 
		    					data[i].id + '">' + data[i].color + ' - ' + data[i].talle + '</option>';
		    	variedadCombo.append(option);
		    }
		    onChangeVariedad(variedadCombo);
		});
		
	};
	
	function removeItem(removeButton) {
		$(removeButton).closest("tr").remove();
	};
	
	function onChangeVariedad(variedadSelect) {
		var precioInput = $(variedadSelect).closest("tr").find("input.precioInput");
		var selectedOption = $(variedadSelect).find('option:selected')[0];
		precioInput.val(selectedOption.attributes['data-precio'].value);
		calcularTotales();
	};
	
	function calcularTotales() {
		var subtotal = 0;
		var trs = $('#tabla-items tbody tr');
		for (i=0; i<trs.length; i++) {
			var precio = $(trs[i]).find('.precioInput').val();
			var cantidad = $(trs[i]).find('.cantidadInput').val();
			if (!cantidad) {
				cantidad = 0;
			}
			subtotal += precio * cantidad;
		}	
		
		$('.inputSubtotal').val(subtotal);
		$('.inputImpuestos').val(Math.floor(subtotal * 0.21 * 100) / 100);
		$('.inputTotal').val(Math.floor(subtotal * 1.21 * 100) / 100);
	};
	
</script>



</jsp:attribute>
</mt:Layout>
	