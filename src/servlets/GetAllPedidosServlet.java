package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.PedidoClienteDTO;
import businessDelegates.PedidoDelegate;

@WebServlet("/pedidos/all/empleado")
public class GetAllPedidosServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<PedidoClienteDTO> pedidos = PedidoDelegate.GetInstancia().getAllPedidos();
		resp.setContentType("application/json");
		 String json = new Gson().toJson(pedidos);
		 	resp.setContentType("application/json");
		 	resp.setCharacterEncoding("UTF-8");
		 	resp.getWriter().write(json);
	}

}
