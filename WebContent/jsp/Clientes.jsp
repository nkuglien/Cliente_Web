<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Clientes" >
<jsp:attribute name="content">
		
<h2>Clientes</h2>

<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/clientes/all",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    sidePagination: "client"                    
                });
  
  });
  var columnas = [
      {
          field: "id",
          align: 'center',
          valign: 'middle',
          title: "ID",
          visible: false
      },
      {
          field: "nroCliente",
          align: 'center',
          valign: 'middle',
          title: "Numero",
          visible: true
      },
      {
          field: "nombre",
          align: 'center',
          valign: 'middle',
          title: "Nombre",
          visible: true
      },
      {
          field: "direccion",
          align: 'center',
          valign: 'middle',
          title: "Direccion",
          visible: true
      },
      {
          field: "telefono",
          align: 'center',
          valign: 'middle',
          title: "Telefono",
          visible: true
      },
      {
          field: "cuit",
          align: 'center',
          valign: 'middle',
          title: "CUIT",
          visible: true
      },
      {
          field: 'boton',
          align: 'center',
          width: '2%',
          mostrar: true,
          events: {
              'click .search': function (e, value, row, index) {
                  alert("Apretaste Lupa")
              }
          },
          formatter: function operateFormatter(value, row, index) {              
                    return  "<a class='search' title='Search'><i class='fa fa-exclamation-triangle fa-lg' style='color:red'></i></a>";             

          }

      },
  
  ];
  
  </script>
</jsp:attribute>
</mt:Layout>
	