<%@ page import="up.servlets.model.Produto" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teste</title>
</head>
<body>

<%
	EntityManagerFactory factory = null;
	EntityManager em = null;
	
	try {
		factory = Persistence.createEntityManagerFactory("produtos_pu");
		em = factory.createEntityManager();
		
		Produto produto = null;
		
		em.getTransaction().begin();
		produto = em.find(Produto.class, 1);
		em.getTransaction().commit();
		
		System.out.println(produto.getNome());
		
	} catch (Exception e) {
		if(em!=null && em.getTransaction().isActive())
			em.getTransaction().rollback();
		e.printStackTrace();
	} finally {
		if(em!=null)
			em.close();
		if(factory!=null)
			factory.close();
	}

%>

</body>
</html>