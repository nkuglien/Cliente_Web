<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Prendas" >
<jsp:attribute name="content">
		
<h2>Prendas / Variedades</h2>



<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/Prendas",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    pageSize:10,
                    pageList:[10,25,50],
                    search:true
                });
  
  });
 
  var columnas = [
      {
          field: "id",
          align: 'center',
          valign: 'middle',
          title: "ID",
          width: '5%',
          visible: true
      },
      {
          field: "prendaString",
          align: 'center',
          valign: 'middle',
          title: "Prenda",
          width: '20%',
          visible: true
      },
      {
          field: "talle",
          align: 'center',
          valign: 'middle',
          title: "Talle",
          width: '5%',
          visible: true
      },
      {
          field: "color",
          align: 'center',
          valign: 'middle',
          title: "Color",
          width: '5%',
          visible: true
      },
      {
          field: "cantidadProduccionFija",
          align: 'center',
          valign: 'middle',
          title: "Cantidad a producir",
          width: '10%',
          visible: true         
      },     
      {
          field: "costoProduccionActual",
          align: 'center',
          valign: 'middle',
          title: "Costo",
          width: '10%',
          visible: true         
      },    
      {
          field: "precioVentaActual",
          align: 'center',
          valign: 'middle',
          title: "Precio",
          width: '10%',
          visible: true         
      },    
      {
          field: "stock",
          align: 'center',
          valign: 'middle',
          title: "Stock",
          width: '10%',
          visible: true         
      },    
      {
          field: "enProduccion",
          align: 'center',
          valign: 'middle',
          title: "Vigente",
          width: '10%',
          visible: true         
      },    
      
  
  ];
  
  </script>



</jsp:attribute>
</mt:Layout>
	