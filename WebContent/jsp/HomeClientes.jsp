<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<mt:Layout title="Home" >
<jsp:attribute name="content">
		
		<div class="jumbotron">
				<h1>Bienvenido ${cliente.nombre}!</h1>
				<h3>Su estado de cuenta acutal es: $ ${cliente.cc.saldo} y su limite de credito es de $ ${cliente.cc.limiteCredito}</h3>
			
				<table class="table" id="tabla-items">
					<thead>
						<tr>
							<th>Fecha</th>
							<th>Importe</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="MovimientoListItem" items="${cliente.cc.movimientos}">
							<tr>
								<td>
									<fmt:formatDate type="date" value="${MovimientoListItem.fecha}" /> - <fmt:formatDate type="time" value="${MovimientoListItem.fecha}" />
								</td>
								<td>
									${MovimientoListItem.importe}
								</td>
							</tr>
						</c:forEach>	
					</tbody>
				</table>
		</div>

</jsp:attribute>
</mt:Layout>
	