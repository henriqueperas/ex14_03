package model;

import java.sql.Date;

public class Cliente {

	String CPF;
	String Nome;
	String Email;
	float Limite_de_credito;
	Date Dt_Nascimento;
	public String getCPF() {
		return CPF;
	}
	public void setCPF(String cPF) {
		CPF = cPF;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public float getLimite_de_credito() {
		return Limite_de_credito;
	}
	public void setLimite_de_credito(float limite_de_credito) {
		Limite_de_credito = limite_de_credito;
	}
	public Date getDt_Nascimento() {
		return Dt_Nascimento;
	}
	public void setDt_Nascimento(Date dt_Nascimento) {
		Dt_Nascimento = dt_Nascimento;
	}
	@Override
	public String toString() {
		return "Cliente [CPF=" + CPF + ", Nome=" + Nome + ", Email=" + Email + ", Limite_de_credito="
				+ Limite_de_credito + ", Dt_Nascimento=" + Dt_Nascimento + "]";
	}
	
}
