<%@ page import="up.servlets.facade.ProdutoFacade"%>
<%@ page import="up.servlets.model.Produto"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Produtos</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
</head>
<body>
<%
	if(session.getAttribute("userid") == null){
		response.sendRedirect("login.jsp");
	}
%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>Lista de Produtos</h2>
					<table class="table">
						<thead><tr><td>C�digo</td><td>Nome</td><td>Descri��o</td><td>Estoque</td></tr></thead>
						<%
							ProdutoFacade facade = new ProdutoFacade();
							List<Produto> produtos = facade.listar();
							for(Produto p:produtos){
								out.print("<tr>");
								out.print("<td>"+p.getId()+"</td>");
								out.print("<td>"+p.getNome()+"</td>");
								out.print("<td>"+p.getDescricao()+"</td>");
								out.print("<td>"+p.getEstoque()+"</td>");
								out.print("<tr>");
							}
						%>
					</table>
			</div>
			<div class="col-md-6">
				<h2>Op��es</h2>
				<form action="pesquisa.jsp" method="get">
					<input type="text" id="pesquisar" name="pesquisar" class="form-control" placeholder="Pesquisar"> 
					<button type="submit" class="btn btn-default btn-lg btn-block" name="action" value="nome">Pesquisar por nome</button>
				</form>
				
				<hr>
				
				<form action="pesquisa.jsp" method="get">
					<input type="text" id="pesquisar" name="pesquisar" class="form-control" placeholder="Pesquisar"> 
					<button type="submit" class="btn btn-default btn-lg btn-block" name="action" value="codigo">Pesquisar por c�digo</button>
				</form>
				
				<hr>
				
				<form action="Produtos" method="post">
					<input type="text" id="nome" name="nome" class="form-control" placeholder="Nome" required>
					<input type="text" id="descricao" name="descricao" class="form-control" placeholder="Descri��o">
					<input type="text" id="estoque" name="estoque" class="form-control" placeholder="Estoque" required>
					<button type="submit" class="btn btn-default btn-lg btn-block"  name="action" value="Adicionar">Adicionar</button>
				</form>
				
				<hr>
				
				<form action="alterar.jsp" method="post">
					<input type="text" id="codigo" name="codigo" class="form-control" placeholder="C�digo" required>
					<button type="submit" class="btn btn-default btn-lg btn-block"  name="action" value="Alterar">Alterar</button>
				</form>
				
				<hr>
				
				<form action="remover.jsp" method="get">
					<input type="text" id="codigo" name="codigo" class="form-control" placeholder="C�digo do produto a ser removido" required>
					<button type="submit" class="btn btn-default btn-lg btn-block">Remover</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>