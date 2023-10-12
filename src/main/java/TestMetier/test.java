package TestMetier;

import java.util.List;

import DAO.GestionProduit;
import DAO.GestionUser;
import DAO.SingletonConnection;
import model.Produit;
import model.User;

public class test {
public static void main(String []args) {
	SingletonConnection s=new SingletonConnection();
	//System.out.print(s.getConnection());
	System.out.print("sdfds\n");
	GestionUser u=new GestionUser();
	System.out.print(u.getUser("chedi").toString());
	
}
}
