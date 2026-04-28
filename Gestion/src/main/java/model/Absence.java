package model;

public class Absence {

private int id;
private String matricule;
private String dateAbsence;
private String motif;

/* display */
private String nomEmploye;

/* GETTERS */

public int getId(){return id;}
public void setId(int id){this.id=id;}

public String getMatricule(){return matricule;}
public void setMatricule(String m){this.matricule=m;}

public String getDateAbsence(){return dateAbsence;}
public void setDateAbsence(String d){this.dateAbsence=d;}

public String getMotif(){return motif;}
public void setMotif(String m){this.motif=m;}

public String getNomEmploye(){return nomEmploye;}
public void setNomEmploye(String n){this.nomEmploye=n;}
}