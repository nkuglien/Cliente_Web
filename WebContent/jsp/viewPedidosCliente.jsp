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
          field: 'boton',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .search': function (e, value, row, index) {
                  alert("Apretaste Lupa")
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
	