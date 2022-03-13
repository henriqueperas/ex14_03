package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import persistence.ClienteDao;
import persistence.GenericDao;

@WebServlet("/cliente")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cliente c = new Cliente();
		
		String cpf = request.getParameter("CPF");
		String nome = request.getParameter("Nome");
		String email = request.getParameter("Email");
		String limite_credito = request.getParameter("Limite_de_credito");
		String dt_nascimento = request.getParameter("Dt_Nascimento");
		
		c = validaCliente(cpf, nome, email, limite_credito, dt_nascimento);
		
		String erro = "";
		String saida = "";
		
		try {
			if(c == null) {
				erro = "Preencha os campos corretamente";
			}else {
				GenericDao gDao = new GenericDao();
				ClienteDao cDao = new ClienteDao(gDao);
				saida = cDao.insereCliente(c);
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			rd.forward(request, response);
		}
	}

	private Cliente validaCliente(String cpf, String nome, String email, String limite_credito, String dt_nascimento) {
		Cliente c = new Cliente();
		
		if (cpf.equals("") || nome.equals("") || email.equals("") || limite_credito.equals("") || dt_nascimento.equals("")) {
			c = null;
		}else {
			c.setCPF(cpf);
			c.setNome(nome);
			c.setEmail(email);
			c.setLimite_de_credito(Float.parseFloat(limite_credito));
			c.setDt_Nascimento(Date.valueOf(dt_nascimento));
		}
		
		return c;
	}

}
