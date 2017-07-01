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
import DTO.PrendaDTO;
import DTO.VariedadPrendaDTO;
import businessDelegates.ClienteDelegate;
import businessDelegates.PrendaDelegate;

/**
 * Servlet implementation class PrendasServlet
 */
@WebServlet("/Prendas")
public class PrendasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrendasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PrendaDTO> prendas = PrendaDelegate.GetInstancia().getAllPrendas();
		List<VariedadPrendaDTO> variedades = new ArrayList<VariedadPrendaDTO>();
		for(PrendaDTO p : prendas){
			System.out.println("la descripcion es: "+p.getDescripcion());
			for(VariedadPrendaDTO vp : p.getVariedades()){
				vp.setPrendaString(p.getDescripcion());
				variedades.add(vp);
			}
		}
		 response.setContentType("application/json");
		 String json = new Gson().toJson(variedades);
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
