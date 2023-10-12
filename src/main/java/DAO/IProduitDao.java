package DAO;

import java.util.List;

import model.Produit;

public interface IProduitDao {
	public Produit save(Produit p);
	public List<Produit> produitsParMC(String mc);
	public Produit getProduit(int Ref); 
	public int updateProduit(Produit p); 
	public void deleteProduit(int Ref);
}
