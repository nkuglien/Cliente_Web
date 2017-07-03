<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:Layout title="Ordenes" >
<jsp:attribute name="content">
		
<h2>Ordenes de produccion</h2>


<div id="table"></div>

<script>
var tabla = $("#table");
  $(function () {
 
  
  tabla.bootstrapTable(
                {
                    url: "/Cliente_Web/OrdenProduccion",
                    method: "GET",
                    columns: columnas,
                    pagination: "true",
                    pageSize:10,
                    pageList:[10,25,50],
                    search:true,
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
          field: "tipo",
          align: 'center',
          valign: 'middle',
          title: "Tipo",
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
         
      },     
      {
          field: "fecha",
          align: 'center',
          valign: 'middle',
          title: "Fecha",
          width: '10%',
          visible: true,
          formatter : function operateFormatter(value, row, index) {
				if (value!=undefined && value!="")
					return value.substring(0, 11);
				else
					return "";

			}
      },
      {
          field: "estado",
          align: 'center',
          valign: 'middle',
          title: "Estado",
          width: '10%',
          visible: true
      },
      {
          field: 'boton',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .producir': function (e, value, row, index) {            	  
            	  var datos={};
            	  datos.id = row.id;
            	  datos.Action="producir";
                  confirm("Esta seguro que desea mandar a producir la orden id "+row.id,function(){
                	  $.post("/Cliente_Web/OrdenProduccion",datos,function(data){
                		  if(data.Result="OK"){
                		  alert("La orden se ha enviado a producir");
                		  tabla.bootstrapTable('refresh');
                		  }
                		  else{
                			  alert("Error: "+data.Mensaje);
                		  }
                	  });
                	  
                  });
              },
              'click .finProduccion': function (e, value, row, index) {            	  
            	  var datos={};
            	  datos.id = row.id;
            	  datos.Action="terminar";
                  confirm("Esta seguro que desea terminar a producir la orden id "+row.id,function(){
                	  $.post("/Cliente_Web/OrdenProduccion",datos,function(data){
                		  if(data.Result="OK"){
                		  alert("La orden se ha enviado a deposito");
                		  tabla.bootstrapTable('refresh');
                		  }
                		  else{
                			  alert("Error: "+data.Mensaje);
                		  }
                	  });
                	  
                  });
              }
          },
          formatter: function operateFormatter(value, row, index) {  
        	  if(row.estado=="COMPLETO")
                    return  "<a class='producir' title='Producir'><i class='fa fa-cogs fa-lg' ></i></a>";        
                    else if(row.estado=="PRODUCCION")
                  return  "<a class='finProduccion' title='Terminar'><i class='fa fa-step-forward fa-lg' '></i></a>";            
                  else
                	  return "";
          }

      },
      {
          field: 'boton2',
          align: 'center',
          width: '20%',
          mostrar: true,
          events: {
              'click .verDetalle': function (e, value, row, index) {            	  
            	  $.post("/Cliente_Web/OrdenProduccion",{Action:"detalle",id:row.id},function(data){
            	              	  
            	  var tableItems = "<table class='table'>"
                 	  tableItems += "<thead><tr><th>Preda</th><th>Cantidad</th><th>Lote</th><th>Disponible</th><th>Almacen</th></tr></thead><tbody>";
               		  data.forEach(function(item,index) {
               			  tableItems += '<tr>';
               			  tableItems += '<td>' + item.variedadPrenda.prendaString + ' talle: '+item.variedadPrenda.talle+' color: '+item.variedadPrenda.color+'</td>';
               			  tableItems += '<td>' + item.cantidad + '</td>';
               			  tableItems += '<td>' + item.id+ '</td>';
               			  tableItems += '<td>' + item.cantDisponible + '</td>';
               			  tableItems += '<td>' + item.posicion + '</td>';
               			  tableItems += '</tr>';
               		  });
                	  tableItems += "</tbody></table>";
    				  alert(tableItems, "Lotes de la orden");
            	  });
              },
             
          },
          formatter: function operateFormatter(value, row, index) {  
        	  
                  return  "<a class='verDetalle' title='Detalle'><i class='fa fa-search fa-lg' ></i></a>";            
                 
          }

      }
  
  ];
  
  </script>


</jsp:attribute>
</mt:Layout>
	