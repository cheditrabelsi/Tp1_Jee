<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
    import="model.Produit" 
    import="DAO.GestionProduit"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<% Produit p=(Produit)request.getAttribute("add"); %>
</head>
<body>
 <table class="table table-bordered border-primary">
					<tr>
						<th>Id</th>
						<th>Nom</th>
						<th>Prix</th>
						<th>Fournisseur</th>
						<th colspan="2">Action</th>
					</tr>
					<tr>
						<td><%=p.getId()%></td>
						<td><%=p.getNom_P()%></td>
						<td><%=p.getPrix()%></td>
						<td><%=p.getFournisseur()%></td>
						<td><button class="btn btn-primary"><a class="nav-link" href="edit.jsp?id=<%=p.getId()%>">modifier</a><button></td>
						<td><button class="btn btn-primary"><a class="nav-link" href="delete.jsp?id=<%=p.getId()%>">supprimer</a></button></td>
						
					</tr>
				</table>
</body>
</html>