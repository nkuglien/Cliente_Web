<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Clientes" >
<jsp:attribute name="content">
		
<h2>Mis Pedidos</h2>

<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/pedidos/all?cuit=" + usuario,
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
          title: "Numero de Pedido",
          visible: false
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
          title: "Nota",
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
              'click .aceptarPedido': function (e, value, row, index) {
            	 
            	  
            	  
              }
          },
          formatter: function operateFormatter(value, row, index) {
                  return  "<span class='glyphicon glyphicon-ok' aria-hidden='true' onclick='javascript:removeItem(this)'></span>";
          }
      },
      {
          field: 'items',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .search': function (e, value, row, index) {
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
				  alert(tableItems, "Items de mi pedido");
              }
          },
          formatter: function operateFormatter(value, row, index) {
                    return  "<a class='search' title='Search'><i class='fa fa-search fa-lg' style='color:red'></i></a>";             

          }

      },
  
  ];
  
  </script>
</jsp:attribute>
</mt:Layout>
	