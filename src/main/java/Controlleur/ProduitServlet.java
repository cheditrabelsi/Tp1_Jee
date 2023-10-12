package Controlleur;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import DAO.GestionProduit;
import model.Produit;
import model.User;

@WebServlet("*.dao")
public class ProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProduitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Res.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath();
		GestionProduit g=new GestionProduit();
		if(path.equals("/ajouter.dao")) {
		int l=Integer.parseInt(request.getParameter("id"));
		String p=request.getParameter("nomP");
		float prix=Integer.parseInt(request.getParameter("prix")) ;
		String f=request.getParameter("fourn");
		String descrep=request.getParameter("descrep");
		String pic=request.getParameter("pic");
		Produit produit=new Produit(l,p,prix,f,pic,descrep);
		produit.setId(l);
		produit.setNom_P(p);
		produit.setPrix(prix);
		produit.setFournisseur(f);
		produit.setPhoto(pic);
		produit.setDescrep(descrep);
		Produit p1=g.save(produit);
		if(p1!=null) {
			request.setAttribute("resultat",g.getProduits());
		}else {
			request.setAttribute("resultat", g.getProduits());
		}
		}else {
			if(path.equals("/update.dao")) {
				int l=Integer.parseInt(request.getParameter("id"));
				String p=request.getParameter("nomP");
				float prix=Float.parseFloat(request.getParameter("prix")) ;
				String f=request.getParameter("fourn");
				String descrep=request.getParameter("descrep");
				String pic=request.getParameter("pic");
				Produit produit=new Produit(l,p,prix,f,pic,descrep);
				produit.setId(l);
				produit.setNom_P(p);
				produit.setPrix(prix);
				produit.setFournisseur(f);
				produit.setPhoto(pic);
				produit.setDescrep(descrep);
				int p1=g.updateProduit(produit);
				if(p1==1) {
					
					request.setAttribute("resultat", g.getProduits());
				}else {
					request.setAttribute("resultat", g.getProduits());
				}
			}else {
				if(path.equals("/delete.dao")) {
					System.out.print("qsdsqdq");
					
					int l=Integer.parseInt(request.getParameter("id"));
					g.deleteProduit(l);
					
						request.setAttribute("resultat", g.getProduits());
				}
			}
		}
		request.getRequestDispatcher("Res.jsp").forward(request, response);
	}
}
