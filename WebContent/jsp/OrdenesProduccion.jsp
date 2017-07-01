<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Ordenes" >
<jsp:attribute name="content">
		
<h2>Ordenes de produccion</h2>


<div id="table"></div>

<script>

  $(function () {
  var tabla = $("#table");
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/OrdenProduccion",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    pageSize:10,
                    pageList:[10,25,50]
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
          field: "fecha",
          align: 'center',
          valign: 'middle',
          title: "Fecha",
          width: '10%',
          visible: true
      },
      {
          field: "prenda",
          align: 'center',
          valign: 'middle',
          title: "Prenda",
          width: '40%',
          visible: true
      },
      {
          field: "variedadesString",
          align: 'center',
          valign: 'middle',
          title: "Variedades",
          width: '30%',
          visible: true,
          formatter: function operateFormatter(value, row, index) {              
              return  eval(value);  
    		}
      },     
      {
          field: 'boton',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .producir': function (e, value, row, index) {
                  alert("Vas a producir id "+ row.id)
              },
              'click .finProduccion': function (e, value, row, index) {
                  alert("Vas a completar id "+ row.id)
              }
          },
          formatter: function operateFormatter(value, row, index) {  
        	  if(row.estado=="COMPLETO")
                    return  "<a class='producir' title='Producir'><i class='fa fa-cogs fa-lg' style='color:red'></i></a>";        
        	  if(row.estado=="PRODUCCION")
                  return  "<a class='finProduccion' title='Terminar'><i class='fa fa-step-forward fa-lg' style='color:red'></i></a>";            

          }

      },
  
  ];
  
  </script>


</jsp:attribute>
</mt:Layout>
	