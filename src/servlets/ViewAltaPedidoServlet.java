package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessDelegates.PrendaDelegate;

@WebServlet("/pedidos/alta/view")
public class ViewAltaPedidoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("prendas", PrendaDelegate.GetInstancia().getPrendasVigentes());
		req.getRequestDispatcher("/jsp/viewAltaPedido.jsp").forward(req, resp);
	}

}