package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
					Long id = Long.decode( request.getParameter("id"));
					Long idProveedor =Long.decode( request.getParameter("proveedor"));					
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
					Date fechaDespacho=df.parse(request.getParameter("fechaDespacho"));					
					Float precioUnidad = Float.parseFloat(request.getParameter("precioUnidad"));
					
					if(id>0 && idProveedor>0 && precioUnidad>0){
						PedidoInsumoDelegate.GetInstancia().completarPedido(id, idProveedor, fechaDespacho, precioUnidad);
					}
					else
						throw new Exception("Faltan datos");	
				json = "{\"Result\":\"OK\"}";
			} else if (request.getParameter("Action").equals("terminar")) {
				Long id = Long.decode( request.getParameter("id"));									
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
				Date fechaDespachoReal=df.parse(request.getParameter("fechaDespachoReal"));	
				
				if(id>0){
					PedidoInsumoDelegate.GetInstancia().terminarPedido(id, fechaDespachoReal);
				}
				else
					throw new Exception("Faltan datos");
				
				
				json = "{\"Result\":\"OK\"}";
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
