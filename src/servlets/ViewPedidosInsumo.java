package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.ProveedorDTO;
import businessDelegates.PrendaDelegate;
import businessDelegates.ProveedorDelegate;

/**
 * Servlet implementation class ViewPedidosInsumo
 */
@WebServlet("/PedidosInsumo/View")
public class ViewPedidosInsumo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPedidosInsumo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProveedorDTO> prove =ProveedorDelegate.GetInstancia().getAllProveedores();
		System.out.println(prove);
		request.setAttribute("proveedores", prove);
		
		request.getRequestDispatcher("/jsp/PedidosInsumo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
