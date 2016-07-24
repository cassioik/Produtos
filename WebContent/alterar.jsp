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
			<div class="col-md-3"></div>
			<div class="col-md-6">	
				<h2>Alterar Produto</h2>				
					<%
					try {
						String codigo = request.getParameter("codigo");
						Integer id = Integer.valueOf(codigo);
						
						ProdutoFacade facade = new ProdutoFacade();
						Produto produto = facade.find(id);
						
						out.print("<h3>Código do produto: "+produto.getId());
						
					%>
					
					<form action="Produtos" method="post">
						<input type="text" id="codigo" name="codigo" value="<%= produto.getId() %>" hidden="true">
						<input type="text" id="nome" name="nome" class="form-control" value="<%= produto.getNome() %>" required>
						<input type="text" id="descricao" name="descricao" class="form-control" value="<%= produto.getDescricao() %>">
						<input type="text" id="estoque" name="estoque" class="form-control" value="<%= produto.getEstoque() %>" required>
						<button type="submit" class="btn btn-default btn-lg btn-block"  name="action" value="Alterar">Alterar</button>
					</form>
					
					<%
						
					} catch (Exception e) {
						out.println("Erro: Produto não encontrado!");
						e.printStackTrace();
					}
					%>
					<a href="produtos.jsp"><button type="button" class="btn btn-default btn-lg btn-block">Voltar</button></a>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

</body>
</html>