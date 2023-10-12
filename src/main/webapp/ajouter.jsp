<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<h1>Ajouter un produit</h1>
		<form action="ajouter.dao" method="post">
			<label>id</label> <input type="number" name="id" placeholder="id"><br>
			<label>nom produit</label> <input type="text" name="nomP"
				placeholder="le nom du produit"><br> <label>Prix
				produit</label> <input type="number" name="prix"
				placeholder="le prix du produit"><br> 
				<label>fournisseur produit</label> 
				<input type="text" name="fourn" placeholder="le fournisseur"><br>
			   <label>descreption produit</label>
			  <input type="text" name="descrep" placeholder="description"><br>
			  <label>image du produit</label>
			  <input type="file" name="pic" placeholder="image"><br><br>
			<input type="submit" value="add" name="add">
		</form>
	</div>
</body>
</html>