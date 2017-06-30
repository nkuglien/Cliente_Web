<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Nuevo Pedido" >
<jsp:attribute name="content">
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



</jsp:attribute>
</mt:Layout>
	