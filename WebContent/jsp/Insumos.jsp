<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Insumos" >
<jsp:attribute name="content">		
<h2>Insumos</h2>

	
<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/Insumos",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    pageSize:10,
                    pageList:[10,25,50],
                    search:true,
                    cache:false
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
          field: "codigo",
          align: 'center',
          valign: 'middle',
          title: "Codigo",
          width: '20%',
          visible: true
      },
      {
          field: "descripcion",
          align: 'center',
          valign: 'middle',
          title: "Descripcion",
          width: '5%',
          visible: true
      },
      {
          field: "nombre",
          align: 'center',
          valign: 'middle',
          title: "Nombre",
          width: '5%',
          visible: true
      },
      {
          field: "stockMinimo",
          align: 'center',
          valign: 'middle',
          title: "Stock minimo",
          width: '10%',
          visible: true         
      },     
      {
          field: "cantCompra",
          align: 'center',
          valign: 'middle',
          title: "Cantidad compra",
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
      } 
      
      
  
  ];
  
  </script>

	


</jsp:attribute>
</mt:Layout>
	