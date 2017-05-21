<%@page import="java.util.Iterator"%>
<%@page import="businessDelegates.ClienteDelegate"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ClienteDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
List<ClienteDTO> clientes = ClienteDelegate.GetInstancia().GetClientes();

for(Iterator cli = clientes.iterator();cli.hasNext();){
	
	ClienteDTO client = (ClienteDTO)cli.next();
	
	out.print(client.getNombre());
}
%>
</body>
</html>