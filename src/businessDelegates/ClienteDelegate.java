package businessDelegates;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import DTO.ClienteDTO;
import RemoteObject.ClienteRemote;

public class ClienteDelegate {

	private static ClienteDelegate delegate;
	private ClienteRemote remote;
	
	public static ClienteDelegate GetInstancia(){
		if(delegate ==null)
			delegate = new ClienteDelegate();
		return delegate;
	}
	
	private ClienteDelegate()
	{
		try {
			remote = (ClienteRemote) Naming.lookup("TPO_Rodamientos");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}
	
	public List<ClienteDTO> GetClientes() throws RemoteException{
		return remote.GetClientes();
	}
	
	
}
