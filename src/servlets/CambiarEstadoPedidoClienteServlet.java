package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.EstadoPedidoCliente;
import businessDelegates.PedidoDelegate;

@WebServlet("/pedidos/estado")
public class CambiarEstadoPedidoClienteServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long nroPedido = Long.parseLong(req.getParameter("nroPedido"));
		EstadoPedidoCliente estado = EstadoPedidoCliente.valueOf(req.getParameter("estado"));
		PedidoDelegate.GetInstancia().cambiarEstadoPedido(nroPedido, estado);
		
		req.getRequestDispatcher("/jsp/viewPedidosCliente.jsp").forward(req, resp);
	}

}
