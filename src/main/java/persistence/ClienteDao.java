package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import model.Cliente;

public class ClienteDao implements IClienteDao{

	private GenericDao gDao;
	
	public ClienteDao(GenericDao gDao) {
		this.gDao = gDao;
	}

	@Override
	public String insereCliente(Cliente c) throws SQLException, ClassNotFoundException {
		Connection f = gDao.getConnection();
		String sql = "{CALL sp_inserircliente (?,?,?,?,?,?)}";
		CallableStatement cs = f.prepareCall(sql);
		cs.setString(1, c.getCPF());
		cs.setString(2, c.getNome());
		cs.setString(3, c.getEmail());
		cs.setFloat(5, c.getLimite_de_credito());
		cs.setDate(5, c.getDt_Nascimento());
		cs.registerOutParameter(6, Types.VARCHAR);
		cs.execute();
		
		String saida = cs.getString(5);
		
		cs.close();
		f.close();
		
		return saida;
	}

	@Override
	public String atualizaCliente(Cliente c) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deletaCliente(Cliente c) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
	
}
