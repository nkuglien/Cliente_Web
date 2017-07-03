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

import DTO.ClienteDTO;
import DTO.LoteVariedadPrendaDTO;
import DTO.OrdenProduccionDTO;
import businessDelegates.ClienteDelegate;
import businessDelegates.OrdenProduccionDelegate;
import businessDelegates.PedidoInsumoDelegate;

/**
 * Servlet implementation class OrdenProduccionServlet
 */
@WebServlet("/OrdenProduccion")
public class OrdenProduccionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdenProduccionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<OrdenProduccionDTO> ordenes = OrdenProduccionDelegate.getInstance().getAll();
		response.setContentType("application/json");
		 String json = new Gson().toJson(ordenes);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = null;
		try {
			if (request.getParameter("Action").equals("producir")) {
					Long id = Long.decode( request.getParameter("id"));
					OrdenProduccionDelegate.getInstance().ponerAProducir(id);
				json = "{\"Result\":\"OK\"}";
			
			
			
			
			
			
			} else if (request.getParameter("Action").equals("terminar")) {
				Long id = Long.decode( request.getParameter("id"));	
				OrdenProduccionDelegate.getInstance().finProduccion(id);
				json = "{\"Result\":\"OK\"}";
			
			
			
			
			}  else if (request.getParameter("Action").equals("detalle")) {
				Long id = Long.decode( request.getParameter("id"));	
				List<LoteVariedadPrendaDTO> lotes = OrdenProduccionDelegate.getInstance().getLotes(id);
				json = new Gson().toJson(lotes);
			
			
			
			
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
