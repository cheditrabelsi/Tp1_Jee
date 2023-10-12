<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" import="model.Produit"
	import="DAO.GestionProduit"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mon Magasin</title>
<%
int id1 = Integer.parseInt(request.getParameter("id"));
GestionProduit g = new GestionProduit();
Produit p = g.getProduit(id1);
%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	padding: 0px;
	backgrond-color: #fefefe;
}

input[type=text], textarea, input[type=email] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	margin-right: 0px;
	margin-left: 0px;
	resize: vertical;
}

label {
	margin-right: 0px;
	margin-left: 0px;
	width: 100%;
}

input[type=submit] {
	background-color: #1255a2;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #1872D9;
}

.container {
	/* Ajouter box-sizing */
	box-sizing: border-box;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 100%;
	/* redéfinition 400 + 2*20 */
	max-width: 440px;
	margin: 5% auto;
}

h1 {
	color: #ffc800;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h1>
			Modifier le produit
			<%=p.getNom_P()%></h1>
		<form action="update.dao" method="post">

			<label>id</label><br> <input type="number" name="id"
				value="<%=p.getId()%>" readonly><br> <label>nom
				produit</label> <input type="text" name="nomP" value="<%=p.getNom_P()%>"><br>


			<label>Prix produit</label><br> <input type="number" name="prix"
				value="<%=p.getPrix()%>"><br> <label>fournisseur
				produit</label> <input type="text" name="fourn"
				value="<%=p.getFournisseur()%>"><br> 
				<label>descreption produit</label> 
				<input type="text" name="descrep" placeholder="description" value="<%=p.getDescrep() %>"><br>
			<label>image du produit</label> 
			<input type="file" name="pic" placeholder="image" value="<%=p.getPhoto() %>"><br>
		<input type="submit" value="update">
		</form>
	</div>
</body>
</html>