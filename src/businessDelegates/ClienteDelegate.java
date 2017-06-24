package businessDelegates;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;

import DTO.ClienteDTO;
import RemoteObject.TDACliente;

public class ClienteDelegate {

	private static ClienteDelegate instance;
	private TDACliente remote;

	public static ClienteDelegate getInstance() {
		if (instance == null) {
			instance = new ClienteDelegate();
		}
		return instance;
	}

	private ClienteDelegate() {
		try {
			remote = (TDACliente) Naming.lookup("ClienteRemoto");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (NotBoundException e) {
			e.printStackTrace();
		}
	}

	public List<ClienteDTO> getAll() throws RemoteException {
		return remote.getAllClientes();
	}

}
