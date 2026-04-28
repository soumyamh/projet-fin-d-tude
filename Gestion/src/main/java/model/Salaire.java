package model;

public class Salaire {

    private int id;
    private String matricule;
    private int mois;
    private int annee;
    private double salaireBase;
    private double primes;
    private double deductions;
    private double salaireNet;

    private String nomEmploye;

    public int getId(){ return id; }
    public void setId(int id){ this.id = id; }

    public String getMatricule(){ return matricule; }
    public void setMatricule(String m){ this.matricule = m; }

    public int getMois(){ return mois; }
    public void setMois(int m){ this.mois = m; }

    public int getAnnee(){ return annee; }
    public void setAnnee(int a){ this.annee = a; }

    public double getSalaireBase(){ return salaireBase; }
    public void setSalaireBase(double s){ this.salaireBase = s; }

    public double getPrimes(){ return primes; }
    public void setPrimes(double p){ this.primes = p; }

    public double getDeductions(){ return deductions; }
    public void setDeductions(double d){ this.deductions = d; }

    public double getSalaireNet(){ return salaireNet; }
    public void setSalaireNet(double s){ this.salaireNet = s; }

    public String getNomEmploye(){ return nomEmploye; }
    public void setNomEmploye(String n){ this.nomEmploye = n; }
}