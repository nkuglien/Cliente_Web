package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.VariedadPrendaDTO;
import businessDelegates.PrendaDelegate;

@WebServlet("/variedades/findAll")
public class GetVariedadesServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String codigoPrenda = req.getParameter("codigoPrenda");
		List<VariedadPrendaDTO> variedades = PrendaDelegate.GetInstancia().solicitarPrendaView(Long.parseLong(codigoPrenda)).getVariedades();
		resp.setContentType("application/json");
		 String json = new Gson().toJson(variedades);
		 	resp.setContentType("application/json");
		    resp.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(json);
	}

}
