package Controlleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GestionProduit;
import DAO.GestionUser;
import model.Produit;
import model.User;
@WebServlet("*.DAO")
public class Myservlet extends HttpServlet {
    public Myservlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		request.getRequestDispatcher("login.html").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path=request.getServletPath();
		GestionUser g=new GestionUser();
		if(path.equals("/Login.DAO")) {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		User user = new User();
		
		GestionProduit g1=new GestionProduit();
	
			
			String l = request.getParameter("login");
			String p = request.getParameter("pass");

			user.setLogin(l);
			user.setPass(p);
			if (g.exist(user)) {
				session.setAttribute("username", l);
				user=g.getUser(l);
				session.setAttribute("role", user.getProfile());
				List<Produit> list=g1.getProduits();
				request.setAttribute("resultat", list);
				if(user.getProfile().equals("admin")) {
				  request.getRequestDispatcher("Res.jsp").forward(request, response);}
				else {
					request.getRequestDispatcher("listeDesProduits.jsp").forward(request, response);
				}
			} else {
				request.getRequestDispatcher("login.html").forward(request, response);
				
			}
		
	}else {
		if(path.equals("/Register.DAO")) {
			User user1 = new User();
			String l = request.getParameter("login");
			String p = request.getParameter("pass");
			String pr=request.getParameter("profile");
			user1.setLogin(l);
			user1.setPass(p);
			user1.setProfile(pr);
			g.save(user1);
			request.getRequestDispatcher("login.html").forward(request, response);
		}else {
			if(path.equals("/deconnecter.DAO")) {
				//session.invalidate();
				request.getRequestDispatcher("login.html").forward(request, response);
			}
		}
			
		}
	}

}
