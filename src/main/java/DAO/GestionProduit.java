package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Produit;
import model.User;

public class GestionProduit implements IProduitDao{
	
	public Produit save(Produit p) {
		java.sql.Connection conn=SingletonConnection.getConnection();
		try {

		java.sql.PreparedStatement ps= conn.prepareStatement("INSERT INTO PRODUIT VALUES(?,?,?,?,?,?)");

		ps.setInt(1, p.getId());
		ps.setString(2, p.getNom_P());
		ps.setDouble(3, p.getPrix());
		ps.setString(4, p.getFournisseur());
		ps.setString(5,p.getPhoto());
		ps.setString(6, p.getDescrep());
		ps.executeUpdate();
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return p;
		}
	public List<Produit> produitsParMC(String mc){
		java.sql.Connection conn=SingletonConnection.getConnection();
		System.out.print(conn);
		List<Produit> list=new ArrayList<>();
		try {

		java.sql.PreparedStatement ps= conn.prepareStatement("select * from produit where nom_p like ? or id like ? or fournisseur like ? or prix like ?");
		ps.setString(1,"%"+mc+"%");
		ps.setString(2,"%"+mc+"%");
		ps.setString(3,"%"+mc+"%");
		ps.setString(4,"%"+mc+"%");
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			list.add(new Produit(rs.getInt("id"),rs.getString("nom_p"),rs.getFloat("prix"),rs.getString("fournisseur"),rs.getString("pic"),rs.getString("descrep")));
		}
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return list;
		}
	public Produit getProduit(int ref) {
		java.sql.Connection conn=SingletonConnection.getConnection();
		Produit p =new Produit();
		try {

		java.sql.PreparedStatement ps= conn.prepareStatement("select * from produit where id=?");
		ps.setInt(1,ref);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			//list.add(new Produit(rs.getInt("id"),rs.getString("nom_p"),rs.getFloat("prix"),rs.getString("fournisseur")));
			p.setId(rs.getInt("id"));
		p.setNom_P(rs.getString("nom_p"));
		p.setPrix(rs.getFloat("prix"));
		p.setFournisseur(rs.getString("fournisseur"));
		p.setDescrep(rs.getString("descrep"));
		}
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return p;
	}
	
	
	public List<Produit> getProduits() {
		java.sql.Connection conn=SingletonConnection.getConnection();
		List<Produit> p =new ArrayList();
		try {

		java.sql.PreparedStatement ps= conn.prepareStatement("select * from produit");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			p.add(new Produit(rs.getInt("id"),rs.getString("nom_p"),rs.getFloat("prix"),rs.getString("fournisseur"),rs.getString("pic"),rs.getString("descrep")));
			
			/*p.setId(rs.getInt("id"));
		p.setNom_P(rs.getString("nom_p"));
		p.setPrix(rs.getFloat("prix"));
		p.setFournisseur(rs.getString("fournisseur"));
		*/}
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return p;
	}
	public int updateProduit(Produit p) {
		java.sql.Connection conn=SingletonConnection.getConnection();
		int i=-1;
		try {
		java.sql.PreparedStatement ps= conn.prepareStatement("UPDATE Produit SET nom_p=?,prix=?,fournisseur=?,pic=?,descrep=? WHERE id=?;");
		ps.setString(1, p.getNom_P());
		ps.setFloat(2, p.getPrix());
		ps.setString(3, p.getFournisseur());
		ps.setString(4,p.getPhoto());
		ps.setString(5,p.getDescrep());
		ps.setInt(6, p.getId());
	     i=ps.executeUpdate();
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return i;
	}
	@Override
	public void deleteProduit(int ref) {
		java.sql.Connection conn=SingletonConnection.getConnection();
		try {
		java.sql.PreparedStatement ps= conn.prepareStatement("Delete from produit where id=?");
		ps.setInt(1,ref);
	    int i=ps.executeUpdate();
	    System.out.print(i);
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		
	}
	}

