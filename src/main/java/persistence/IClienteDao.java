package persistence;

import java.sql.SQLException;

import model.Cliente;

public interface IClienteDao {

	public String insereCliente(Cliente c) throws SQLException, ClassNotFoundException;
	public String atualizaCliente(Cliente c) throws SQLException, ClassNotFoundException;
	public String deletaCliente(Cliente c) throws SQLException, ClassNotFoundException;
	
}
