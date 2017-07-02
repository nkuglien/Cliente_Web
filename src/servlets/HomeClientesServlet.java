package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessDelegates.ClienteDelegate;

@WebServlet("/home/clientes")
public class HomeClientesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cuit = getLoggedUser(req);
		req.setAttribute("cliente", ClienteDelegate.getInstance().buscarCliente(cuit));
		req.getRequestDispatcher("/jsp/HomeClientes.jsp").forward(req, resp);
	}
	
	private String getLoggedUser(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
	    String cookieValue = ""; 
	    // Get cookie value
	    if (cookies != null) { 
	        for (int i = 0; i < cookies.length; i++) { 
	            if (cookies[i].getName().equals("usuario")) { 
	                cookieValue = cookies[i].getValue();
	            }
	        }
	    }
	    return cookieValue;
	}

}
