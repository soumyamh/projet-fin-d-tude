package model;

public class Employe {

private int id;
private String matricule;
private String nom;
private String prenom;
private String dateNaissance;
private String dateEmbauche;
private String sexe;
private String nationalite;
private String situationFamiliale;
private String adresse;
private String telephone;
private String email;
private String poste;
private String departement;
private String service;
private String typeContrat;
private String statut;
private String photo;

public int getId(){return id;}
public void setId(int id){this.id=id;}

public String getMatricule(){return matricule;}
public void setMatricule(String m){this.matricule=m;}

public String getNom(){return nom;}
public void setNom(String n){this.nom=n;}

public String getPrenom(){return prenom;}
public void setPrenom(String p){this.prenom=p;}

public String getDateNaissance(){return dateNaissance;}
public void setDateNaissance(String d){this.dateNaissance=d;}

public String getDateEmbauche(){return dateEmbauche;}
public void setDateEmbauche(String d){this.dateEmbauche=d;}

public String getSexe(){return sexe;}
public void setSexe(String s){this.sexe=s;}

public String getNationalite(){return nationalite;}
public void setNationalite(String n){this.nationalite=n;}

public String getSituationFamiliale(){return situationFamiliale;}
public void setSituationFamiliale(String s){this.situationFamiliale=s;}

public String getAdresse(){return adresse;}
public void setAdresse(String a){this.adresse=a;}

public String getTelephone(){return telephone;}
public void setTelephone(String t){this.telephone=t;}

public String getEmail(){return email;}
public void setEmail(String e){this.email=e;}

public String getPoste(){return poste;}
public void setPoste(String p){this.poste=p;}

public String getDepartement(){return departement;}
public void setDepartement(String d){this.departement=d;}

public String getService(){return service;}
public void setService(String s){this.service=s;}

public String getTypeContrat(){return typeContrat;}
public void setTypeContrat(String t){this.typeContrat=t;}

public String getStatut(){return statut;}
public void setStatut(String s){this.statut=s;}

public String getPhoto(){return photo;}
public void setPhoto(String p){this.photo=p;}
}