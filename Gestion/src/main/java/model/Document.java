package model;

public class Document {

private int id;
private String matricule;
private String type;
private String fileName;

private String nomEmploye;

public int getId() { return id; }
public void setId(int id) { this.id = id; }

public String getMatricule() { return matricule; }
public void setMatricule(String matricule) { this.matricule = matricule; }

public String getType() { return type; }
public void setType(String type) { this.type = type; }

public String getFileName() { return fileName; }
public void setFileName(String fileName) { this.fileName = fileName; }

public String getNomEmploye() { return nomEmploye; }
public void setNomEmploye(String nomEmploye) { this.nomEmploye = nomEmploye; }
}