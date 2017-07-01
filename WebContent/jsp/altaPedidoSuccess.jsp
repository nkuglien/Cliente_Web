<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<mt:Layout title="Nuevo Pedido" >
<jsp:attribute name="content">
		<div class="jumbotron">
			<h1>Pedido Creado Exitosamente!</h1>
			<h2>Su numero de pedido es: <span id="nroPedido">${nroPedido}</span></h2>
		</div>
</jsp:attribute>
</mt:Layout>
	