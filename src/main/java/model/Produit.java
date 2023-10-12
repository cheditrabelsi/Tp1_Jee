package model;

public class Produit {
private int id;
private String nom_P;
private float Prix;
private String fournisseur;
private String photo;
private String descrep;
public Produit() {
	super();
	// TODO Auto-generated constructor stub
}
public Produit(int id, String nom_P, float prix, String fournisseur,String pic,String descrep) {
	super();
	this.id = id;
	this.nom_P = nom_P;
	this.Prix = prix;
	this.fournisseur = fournisseur;
	this.photo=pic;
	this.descrep=descrep;
}
public int getId() {
	return id;
}

public String getDescrep() {
	return descrep;
}
public void setDescrep(String descrep) {
	this.descrep = descrep;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public void setId(int id) {
	this.id = id;
}
public String getNom_P() {
	return nom_P;
}
public void setNom_P(String nom_P) {
	this.nom_P = nom_P;
}
public float getPrix() {
	return Prix;
}
public void setPrix(float prix) {
	Prix = prix;
}
public String getFournisseur() {
	return fournisseur;
}
public void setFournisseur(String fournisseur) {
	this.fournisseur = fournisseur;
}
@Override
public String toString() {
	return "Produit [id=" + id + ", nom_P=" + nom_P + ", Prix=" + Prix + ", fournisseur=" + fournisseur + ", photo="
			+ photo + ", descrep=" + descrep + "]";
}



}
