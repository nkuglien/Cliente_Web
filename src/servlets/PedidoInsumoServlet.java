package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.InsumoDTO;
import DTO.PedidoInsumoDTO;
import businessDelegates.InsumoDelegate;
import businessDelegates.PedidoInsumoDelegate;

/**
 * Servlet implementation class PedidoInsumoServlet
 */
@WebServlet("/PedidoInsumo")
public class PedidoInsumoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PedidoInsumoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<PedidoInsumoDTO> insumos = PedidoInsumoDelegate.GetInstancia().getAllPedidos();

		String json = new Gson().toJson(insumos);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String json = null;
		try {
			if (request.getParameter("Action").equals("completar")) {
					
				
				json = "{\"Result\":\"OK\",\"Mensaje\":\"Ingresado correctamente id:" + request.getParameter("id")
						+ " fecha:" + request.getParameter("fechaDespacho") + "\"}";
			} else if (request.getParameter("Action").equals("completar")) {
				json = "{\"Result\":\"OK\",\"Mensaje\":\"Ingresado correctamente\"}";
			} else {
				json = "{\"Result\":\"ERROR\",\"Mensaje\":\"Operacion no valida\"}";
			}
		} catch (Exception e) {
			json = "{\"Result\":\"ERROR\",\"Mensaje\":\"" + e.getMessage() + "\"}";
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
