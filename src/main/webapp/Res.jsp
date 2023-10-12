<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" import="model.Produit" import="DAO.GestionProduit"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Magasin</title>
<%
GestionProduit g=new GestionProduit();
List<Produit> list = (List<Produit>) request.getAttribute("resultat");
String search = request.getParameter("search");
Produit productList;
if (search != null && !search.isEmpty()) {
   list =g.produitsParMC(search);
} else {
    list = g.getProduits();
} 	
String name=(String)session.getAttribute("username");
String role=(String)session.getAttribute("role");
if(!role.equals("admin")){
	 String redirectURL = "login.html"; // Replace with your desired destination JSP file
	    response.sendRedirect(redirectURL); 
}
%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<style>

		nav {
			width: 100%;
			height: 10vh;
			display: flex;
			flex-direction: row;
			justify-content: space-around;
			align-items: center;
			background: #FFFFFF;
			top: 0;
			margin: 0;
			box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
			z-index: 5;
			text-align: center;
		}

		#logo{
			align-self: center;
			justify-self: center;

		}
		nav ul {
			list-style: none;
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: center;
			justify-self: center;
			align-self: center;
			text-align: center;
		}
		nav ul li a{
			text-decoration: none;
			margin: 2vw;
			color: black;
			font-size: 20px;
			border-bottom: 3px transparent;
			transition: border-bottom-color 0.3s ease-in ;
			text-align: center;
		}
		nav ul li a:hover{
			border-bottom: 3px solid #ffb400;
		}
</style>
<script src="https://kit.fontawesome.com/ea776a88da.js" crossorigin="anonymous"></script>
</head>
<body>
      <nav>
		<div id="logo">
			<img height="60" src="https://www.shutterstock.com/image-vector/creative-modern-abstract-ecommerce-logo-260nw-2134594695.jpg">
			
			</div>
<div> <form action="Res.jsp" method="get" class="search-form">
                <input type="text" name="search" class="form-control" placeholder="Search">
                <button type="submit" class="btn btn-primary" hidden>
                </button>
                 
            </form></div>
		<ul>
			<li>
				<a href="ajouter.jsp">add to List</a>
			</li>
			
			<li>
				<a href="deconnecter.DAO">deconnexion</a>
			</li>
			<li>
			<i class="fa-solid fa-user"></i> <%=name %>
			</li>
		</ul>
	</nav>
      <div class="container-fluid" >
      <div>
        <div class="container-fluid">
          <table class="table table-striped" >
            <thead class=" text-primary">
              <th>
                ID
              </th>
              <th>
                NOM
              </th>
              <th>
                Prix
              </th>
              <th class="text-right">
                nom de fournisseur
              </th>
              <th class="text-right">
                image de produit
              </th>
              <th>update</th>
              <th>delete</th>
            </thead>
            <tbody>
             <%  
					for (Produit p : list) {
					%>
					<tr>
						<td><%=p.getId()%></td>
						<td><%=p.getNom_P()%></td>
						<td><%=p.getPrix()%></td>
						<td><%=p.getFournisseur()%></td>
						<td><img src="images/<%=p.getPhoto()%>"style="width: 100px;height: 100px;"></td>
						<td><a class="btn btn-success " href="edit.jsp?id=<%=p.getId()%>">    <i class="fa-solid fa-pen-to-square"></i>
						
						</a></td>
						<td>
    <form action="delete.dao" method="post" onsubmit="return confirm('Are you sure you want to delete this <%=p.getNom_P()%>?');">
                                    <input type="hidden" name="id" value="<%=p.getId()%>">
                                    <button class="btn btn-danger" type="submit">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form></td>
						<%
						}
						%>
				 	</tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  </div></div>
</body>
</html>