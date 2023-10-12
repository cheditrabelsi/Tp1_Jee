<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" import="model.Produit" import="DAO.GestionProduit"%>
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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<%
GestionProduit g=new GestionProduit();
List<Produit> list = (List<Produit>) request.getAttribute("resultat");
String search = request.getParameter("search");
if (search != null && !search.isEmpty()) {
   list =g.produitsParMC(search);
} else {
    list = g.getProduits();
} 	
String name=(String)session.getAttribute("username");
String role=(String)session.getAttribute("role");
if(!role.equals("user")){
	 String redirectURL = "login.html"; // Replace with your desired destination JSP file
	    response.sendRedirect(redirectURL);

}
%>
<style>
@import url('https://fonts.googleapis.com/css?family=Cardo:400i|Rubik:400,700&display=swap');
 :root {
	 --d: 700ms;
	 --e: cubic-bezier(0.19, 1, 0.22, 1);
	 --font-sans: 'Rubik', sans-serif;
	 --font-serif: 'Cardo', serif;
}
 * {
	 box-sizing: border-box;
}
 html, body {
	 height: 100%;
}
 body {
	 display: grid;
	 place-items: center;
}
 .page-content {
	 display: grid;
	 grid-gap: 1rem;
	 padding: 1rem;
	 max-width: 1024px;
	 margin: 0 auto;
	 font-family: var(--font-sans);
}
 @media (min-width: 600px) {
	 .page-content {
		 grid-template-columns: repeat(2, 1fr);
	}
}
 @media (min-width: 800px) {
	 .page-content {
		 grid-template-columns: repeat(4, 1fr);
	}
}
 .card {
	 position: relative;
	 display: flex;
	 align-items: flex-end;
	 overflow: hidden;
	 padding: 1rem;
	 width: 100%;
	 text-align: center;
	 color: whitesmoke;
	 background-color: whitesmoke;
	 box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1), 0 2px 2px rgba(0, 0, 0, 0.1), 0 4px 4px rgba(0, 0, 0, 0.1), 0 8px 8px rgba(0, 0, 0, 0.1), 0 16px 16px rgba(0, 0, 0, 0.1);
}
 @media (min-width: 600px) {
	 .card {
		 height: 350px;
	}
}
 .card:before {
	 content: '';
	 position: absolute;
	 top: 0;
	 left: 0;
	 width: 100%;
	 height: 110%;
	 background-size: cover;
	 background-position: 0 0;
	 transition: transform calc(var(--d) * 1.5) var(--e);
	 pointer-events: none;
}
 .card:after {
	 content: '';
	 display: block;
	 position: absolute;
	 top: 0;
	 left: 0;
	 width: 100%;
	 height: 200%;
	 pointer-events: none;
	 background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.009) 11.7%, rgba(0, 0, 0, 0.034) 22.1%, rgba(0, 0, 0, 0.072) 31.2%, rgba(0, 0, 0, 0.123) 39.4%, rgba(0, 0, 0, 0.182) 46.6%, rgba(0, 0, 0, 0.249) 53.1%, rgba(0, 0, 0, 0.320) 58.9%, rgba(0, 0, 0, 0.394) 64.3%, rgba(0, 0, 0, 0.468) 69.3%, rgba(0, 0, 0, 0.540) 74.1%, rgba(0, 0, 0, 0.607) 78.8%, rgba(0, 0, 0, 0.668) 83.6%, rgba(0, 0, 0, 0.721) 88.7%, rgba(0, 0, 0, 0.762) 94.1%, rgba(0, 0, 0, 0.790) 100%);
	 transform: translateY(-50%);
	 transition: transform calc(var(--d) * 2) var(--e);
}
 /*.card:before {
	 background-image: url("images/lenovo.jpg");
}*/

 .content {
	 position: relative;
	 display: flex;
	 flex-direction: column;
	 align-items: center;
	 width: 100%;
	 padding: 1rem;
	 transition: transform var(--d) var(--e);
	 z-index: 1;
}
 .content > * + * {
	 margin-top: 1rem;
}
 .title {
	 font-size: 1.3rem;
	 font-weight: bold;
	 line-height: 1.2;
}
 .copy {
	 font-family: var(--font-serif);
	 font-size: 1.125rem;
	 font-style: italic;
	 line-height: 1.35;
}
 .btn {
	 cursor: pointer;
	 margin-top: 1.5rem;
	 padding: 0.75rem 1.5rem;
	 font-size: 0.65rem;
	 font-weight: bold;
	 letter-spacing: 0.025rem;
	 text-transform: uppercase;
	 color: white;
	 background-color: black;
	 border: none;
}
 .btn:hover {
	 background-color: #0d0d0d;
}
 .btn:focus {
	 outline: 1px dashed yellow;
	 outline-offset: 3px;
}
.card{background-size: cover;}
 @media (hover: hover) and (min-width: 600px) {
	 .card:after {
		 transform: translateY(0);
	}
	 .content {
		 transform: translateY(calc(100% - 4.5rem));
	}
	 .content > *:not(.title) {
		 opacity: 0;
		 transform: translateY(1rem);
		 transition: transform var(--d) var(--e), opacity var(--d) var(--e);
	}
	 .card:hover, .card:focus-within {
		 align-items: center;
	}
	 .card:hover:before, .card:focus-within:before {
		 transform: translateY(-4%);
	}
	 .card:hover:after, .card:focus-within:after {
		 transform: translateY(-50%);
	}
	 .card:hover .content, .card:focus-within .content {
		 transform: translateY(0);
	}
	 .card:hover .content > *:not(.title), .card:focus-within .content > *:not(.title) {
		 opacity: 1;
		 transform: translateY(0);
		 transition-delay: calc(var(--d) / 8);
	}
	 .card:focus-within:before, .card:focus-within:after, .card:focus-within .content, .card:focus-within .content > *:not(.title) {
		 transition-duration: 0s;
	}
}
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
		.imag{
		background-size:cover;
		}
</style>
<script src="https://kit.fontawesome.com/ea776a88da.js" crossorigin="anonymous"></script>
</head>
<body>
  <nav>
		<div id="logo">
			<img height="60" src="data:image/jpeg;base64,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">
</div>
<div> <form action="listeDesProduits.jsp" method="get" class="search-form">
                <input type="text" name="search" class="form-control" placeholder="Search">
                <button type="submit" class="btn btn-primary" hidden>
                </button>
                 
            </form></div>
		<ul>
			<li>
				<a href="deconnecter.DAO">deconnexion</a>
			</li>
			<li>
				<i class="fa-solid fa-user"></i>  <%=name %>
			</li>
		</ul>
	</nav>
  <main class="page-content">
  <% for (Produit p1 : list) { %>
  <div class="card" style="background-image: url('images/<%= p1.getPhoto() %>');">
    <div class="content">
      <h2 class="title"><%=p1.getNom_P() %></h2>
      <p class="copy"><%=p1.getPrix() %></p>
      <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal-<%= p1.getId() %>"> descreption produit</button>
    </div>
  </div>
 <%} %>
</main>
<% for (Produit p1 : list) { %>
<div class="modal fade" id="exampleModal-<%= p1.getId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><%=p1.getNom_P() %></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body imag">
        <img src='images/<%=p1.getPhoto() %>' style="width:100%">
        <%=p1.getDescrep() %>
        <br><div style="font-weight: bold;">prix:</div><div><%=p1.getPrix() %></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%} %>
</body>
</html>