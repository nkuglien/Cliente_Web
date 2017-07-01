package servlets;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DTO.EstadoPedidoCliente;
import DTO.ItemPedidoClienteDTO;
import DTO.PedidoClienteDTO;
import DTO.VariedadPrendaDTO;
import businessDelegates.ClienteDelegate;
import businessDelegates.PedidoDelegate;
import businessDelegates.PrendaDelegate;

@WebServlet("/pedidos/altas/save")
public class SavePedidoClienteServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PedidoClienteDTO dto = new PedidoClienteDTO();
		dto.setFechaGeneracion(new Date());
		
		Date probableDespacho = new Date();
		Calendar c = Calendar.getInstance(); 
		c.setTime(probableDespacho); 
		c.add(Calendar.DATE, 15);
		probableDespacho = c.getTime();
		dto.setFechaProbableDespacho(probableDespacho);
		
		String[] prendas = req.getParameterValues("prenda");
		String[] variedades = req.getParameterValues("variedad");
		String[] precio = req.getParameterValues("precio");
		String[] cantidades = req.getParameterValues("cantidad");
		
		for(int i = 0; i < prendas.length; i++) {
			ItemPedidoClienteDTO item = new ItemPedidoClienteDTO();
			VariedadPrendaDTO variedad = PrendaDelegate.GetInstancia().buscarVariedad(Long.parseLong(variedades[i]));
			item.setItem(variedad);
			item.setCantidad(Integer.valueOf(cantidades[i]));
			item.setPrecioItem(Float.valueOf(precio[i]));
			dto.getItems().add(item);
		}
		
		Float subtotal = Float.valueOf(req.getParameter("subtotal"));
		Float impuestos = Float.valueOf(req.getParameter("impuestos"));
		Float total = Float.valueOf(req.getParameter("total"));
		String nota = req.getParameter("nota");
		
		dto.setSubtotal(subtotal);
		dto.setImpuestos(impuestos);
		dto.setTotal(total);
		dto.setNota(nota);
		dto.setEstado(EstadoPedidoCliente.CREADO);
		
		String cuit = getLoggedUser(req);
		dto.setCliente(ClienteDelegate.getInstance().buscarCliente(cuit));
		
		PedidoClienteDTO pedido = PedidoDelegate.GetInstancia().cargarPedidoCliente(dto);
		req.setAttribute("nroPedido", pedido.getNroPedido());
		req.getRequestDispatcher("/jsp/altaPedidoSuccess.jsp").forward(req, resp);
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
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
