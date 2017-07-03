package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.FacturaDTO;
import businessDelegates.PedidoDelegate;

@WebServlet("/pedidos/factura")
public class BuscarFacturaServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long nroPedido = Long.parseLong(req.getParameter("nroPedido"));
		FacturaDTO dto = PedidoDelegate.GetInstancia().obtenerFactura(nroPedido);
		resp.setContentType("application/json");
		 String json = new Gson().toJson(dto);
		 	resp.setContentType("application/json");
		 	resp.setCharacterEncoding("UTF-8");
		 	resp.getWriter().write(json);
	}

}
