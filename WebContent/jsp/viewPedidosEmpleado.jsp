<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Clientes" >
<jsp:attribute name="content">
		
<h2>Pedidos</h2>

<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/pedidos/all/empleado",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    pageSize:10,
                    pageList:[10,25,50],
                    search: true
                });
  
  });
  var columnas = [
      {
          field: "nroPedido",
          align: 'center',
          valign: 'middle',
          title: "Nro",
          visible: true
      },
      {
          field: "fechaGeneracion",
          align: 'center',
          valign: 'middle',
          title: "Fecha de Generacion",
          width: '20%',
          visible: true
      },
      {
          field: "fechaProbableDespacho",
          align: 'center',
          valign: 'middle',
          title: "Fecha Probable Despacho",
          width: '20%',
          visible: true
      },
      {
          field: "fechaDespacho",
          align: 'center',
          valign: 'middle',
          title: "Fecha Despacho",
          width: '20%',
          visible: true
      },
      {
          field: "total",
          align: 'center',
          valign: 'middle',
          title: "Total",
          width: '20%',
          visible: true,
          formatter: function operateFormatter(value, row, index) {
              return  "$" + value;             

      }
      },
      {
          field: "estado",
          align: 'center',
          valign: 'middle',
          title: "Estado",
          width: '20%',
          visible: true
      },
      {
          field: "nota",
          align: 'center',
          valign: 'middle',
          title: "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nota&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;",
          width: '20%',
          visible: true
      },
      {
          field: "botonAceptar",
          align: 'center',
          valign: 'middle',
          width: '20%',
          visible: true,
          title: "",
          events: {
              'click .validarPedido': function (e, value, row, index) {
            	  console.log(row);
            	  $.ajax({
          			method: "GET",
          			url: "/Cliente_Web/pedidos/estado?nroPedido=" + row.nroPedido + "&estado=VALIDADO"
          		  })
          		  .done(function(data) {
          				window.location.href = "/Cliente_Web/jsp/viewPedidosEmpleado.jsp";
          		  });
              },
              'click .rechazarPedido': function (e, value, row, index) {
            	  console.log(row);
            	  $.ajax({
          			method: "GET",
          			url: "/Cliente_Web/pedidos/estado?nroPedido=" + row.nroPedido + "&estado=RECHAZADO"
          		  })
          		  .done(function(data) {
          				window.location.href = "/Cliente_Web/jsp/viewPedidosEmpleado.jsp";
          		  });
              },
              'click .despacharPedido': function (e, value, row, index) {
            	  console.log(row);
            	  $.ajax({
          			method: "GET",
          			url: "/Cliente_Web/pedidos/estado?nroPedido=" + row.nroPedido + "&estado=DESPACHADO"
          		  })
          		  .done(function(data) {
          				window.location.href = "/Cliente_Web/jsp/viewPedidosEmpleado.jsp";
          		  });
              }
          },
          formatter: function operateFormatter(value, row, index) {
        	  var acciones = "";
        	  if (row.estado == "CREADO") {
        		  acciones += "<a class='validarPedido'><span class='glyphicon glyphicon-ok ' aria-hidden='true'></span></a>";
        		  acciones += "<a class='rechazarPedido'><span class='glyphicon glyphicon-remove ' aria-hidden='true'></span></a>";
        	  } else if (row.estado == "COMPLETO") {
        		  acciones += "<a class='despacharPedido'><span class='glyphicon glyphicon-road ' aria-hidden='true'></span></a>";
        	  } 
              return acciones;
          }
      },
      {
          field: 'items',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .verDetalle': function (e, value, row, index) {
            	  var tableItems = "<table class='table'>"
             	  tableItems += "<thead><tr><th>Preda</th><th>Variedad</th><th>Precio Unitario</th><th>Cantidad</th></tr></thead><tbody>";
           		  for(i=0; i<value.length; i++) {
           			  tableItems += '<tr>';
           			  tableItems += '<td>' + value[i].item.prenda.descripcion + '</td>';
           			  tableItems += '<td>' + value[i].item.color + ' - ' + value[i].item.talle + '</td>';
           			  tableItems += '<td>' + value[i].precioItem + '</td>';
           			  tableItems += '<td>' + value[i].cantidad + '</td>';
           			  tableItems += '</tr>';
           		  }
            	  tableItems += "</tbody></table>";
				  alert(tableItems, "Items del pedido");
              }
          },
          formatter: function operateFormatter(value, row, index) {
        	  return  "<a class='verDetalle'><span class='glyphicon glyphicon-list ' aria-hidden='true'></span></a>";      
          }

      },
      {
          field: 'verFactura',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .verFactura': function (e, value, row, index) {
            	  $.ajax({
           			  method: "GET",
           			  url: "/Cliente_Web/pedidos/factura?nroPedido=" + row.nroPedido
           		  })
           		  .done(function(data) {
           			  console.log(data);
           			  var encabezado = "<h1 style=\"text-align:center\">FACTURA " + data.nroFactura + "</h1><table class='table'>";
           			  encabezado += '<tr><td>PARA: ' + data.pedidoCliente.cliente.nombre + '</td>';
           		  	  encabezado += '<td>CUIT nro:' + data.pedidoCliente.cliente.cuit + '</td></tr>';
           			  encabezado += '<tr><td>Domicilio:' + data.pedidoCliente.cliente.direccion + '</td>';
           			  encabezado += '<td>Telefono:' + data.pedidoCliente.cliente.telefono + '</td></tr>';
           			  encabezado += '</table>';
           				
           			  var tableItems = "<table class='table'>"
                      tableItems += "<thead><tr><th>Preda</th><th>Variedad</th><th>Precio Unitario</th><th>Cantidad</th></tr></thead><tbody>";
	           		  for(i=0; i<row.items.length; i++) {
	           			  tableItems += '<tr>';
	           			  tableItems += '<td>' + row.items[i].item.prenda.descripcion + '</td>';
	           			  tableItems += '<td>' + row.items[i].item.color + ' - ' + row.items[i].item.talle + '</td>';
	           			  tableItems += '<td>' + row.items[i].precioItem + '</td>';
	           			  tableItems += '<td>' + row.items[i].cantidad + '</td>';
	           			  tableItems += '</tr>';
	           		  }
                 	  tableItems += "</tbody></table>";
                 	  
                 	  var footer = "<table class='table'>";
                 	  footer += '<tr><td>Subtotal:</td><td>$' + data.pedidoCliente.subtotal+ '</td></tr>';
                 	  footer += '<tr><td>Impuestos:</td><td>$' + data.pedidoCliente.impuestos+ '</td></tr>';
                 	  footer += '<tr><td>Total:</td><td>$' + data.pedidoCliente.total+ '</td></tr>';
          		      footer += '</table>';
                 	  
     				  alert(encabezado + tableItems + footer, "Factura del pedido numero: " + data.nroFactura);
           		  });
              }
          },
          formatter: function operateFormatter(value, row, index) {
        	  if (row.estado == "DESPACHADO") {
	        	  return "<a class='verFactura'><span class='glyphicon glyphicon-file' aria-hidden='true'></span></a>";
        	  }
          }

      }
  
  ];
  
  </script>
</jsp:attribute>
</mt:Layout>
	