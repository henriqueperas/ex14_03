<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ex14_03</title>
</head>
<body>
	<div align="center" class="container">
		<form action="cliente" method="post">
			<p class="title">
				<b>Cliente</b>
			</p>
			<table>
				<tr>
					<td>
						<input class="id_input_data" type="text"
						id="CPF" name="CPF"
						placeholder="#CPF">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_data" type="text"
						id="Nome" name="Nome"
						placeholder="Nome">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_data" type="text"
						id="Email" name="Email"
						placeholder="Email">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_data" type="number"
						min="0" step="0.01" id="Limite_de_credito" name="Limite_de_credito"
						placeholder="Limite_de_credito">
					</td>
				</tr>
				<tr>
					<td>
						<input class="input_data" type="date"
						id="Dt_Nascimento" name="Dt_Nascimento"
						placeholder="Dt_Nascimento">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit"
						id="botao" name="botao" value="Inserir">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<br />
	<div align="center">
		<h2><c:out value="${erro }" /></h2>
	</div>
	<div align="center">
		<h3><c:out value="${saida }" /></h3>
	</div>
</body>
</html>