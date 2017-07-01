package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.ClienteDTO;
import DTO.InsumoDTO;
import DTO.PrendaDTO;
import DTO.VariedadPrendaDTO;
import businessDelegates.ClienteDelegate;
import businessDelegates.InsumoDelegate;
import businessDelegates.PrendaDelegate;

/**
 * Servlet implementation class PrendasServlet
 */
@WebServlet("/Insumos")
public class InsumosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsumosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<InsumoDTO> insumos = InsumoDelegate.GetInstancia().getAllInsumos();		
		 response.setContentType("application/json");
		 String json = new Gson().toJson(insumos);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
