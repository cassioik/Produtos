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
				<h2>Pesquisa de Produtos</h2>				
					<%
					try {
						String pesquisar = request.getParameter("pesquisar");
						String action = request.getParameter("action");
						
						if(action.equals("codigo")){
							out.println("<h3>Pesquisado código: "+ pesquisar +" </h3>");
							
							Integer id = Integer.valueOf(pesquisar);
							ProdutoFacade facade = new ProdutoFacade();
							Produto p = facade.find(id);
							out.print("<table class='table'><thead><tr><td>Código</td><td>Nome</td><td>Descrição</td><td>Estoque</td></tr></thead>");
							out.print("<tr>");
							out.print("<td>"+p.getId()+"</td>");
							out.print("<td>"+p.getNome()+"</td>");
							out.print("<td>"+p.getDescricao()+"</td>");
							out.print("<td>"+p.getEstoque()+"</td>");
							out.print("<tr>");
							out.print("</table>");
							
						}else{
							out.println("<h3>Pesquisado por: "+ pesquisar +" </h3>");
							
							ProdutoFacade facade = new ProdutoFacade();
							List<Produto> produtos = facade.pesquisar(pesquisar);
							out.print("<table class='table'><thead><tr><td>Código</td><td>Nome</td><td>Descrição</td><td>Estoque</td></tr></thead>");
							for(Produto p:produtos){
								out.print("<tr>");
								out.print("<td>"+p.getId()+"</td>");
								out.print("<td>"+p.getNome()+"</td>");
								out.print("<td>"+p.getDescricao()+"</td>");
								out.print("<td>"+p.getEstoque()+"</td>");
								out.print("<tr>");
							}
							out.print("</table>");
						}
						
					} catch (Exception e) {
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