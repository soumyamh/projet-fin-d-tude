package dao;

import java.sql.*;
import java.util.*;
import model.Salaire;
import util.DBConnection;

public class SalaireDAO {

    public void insert(Salaire s){
        try{
            Connection c = DBConnection.getConnection();

            String sql = "INSERT INTO salaire(matricule,mois,annee,salaire_base,primes,deductions,salaire_net) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = c.prepareStatement(sql);

            ps.setString(1, s.getMatricule());
            ps.setInt(2, s.getMois());
            ps.setInt(3, s.getAnnee());
            ps.setDouble(4, s.getSalaireBase());
            ps.setDouble(5, s.getPrimes());
            ps.setDouble(6, s.getDeductions());

            double net = s.getSalaireBase() + s.getPrimes() - s.getDeductions();
            ps.setDouble(7, net);

            ps.executeUpdate();

        }catch(Exception e){ e.printStackTrace(); }
    }

    public List<Salaire> getAll(){
        List<Salaire> list = new ArrayList<>();

        try{
            Connection c = DBConnection.getConnection();

            String sql = "SELECT s.*, e.nom FROM salaire s JOIN employe e ON s.matricule=e.matricule";

            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Salaire s = new Salaire();

                s.setId(rs.getInt("id"));
                s.setMatricule(rs.getString("matricule"));
                s.setMois(rs.getInt("mois"));
                s.setAnnee(rs.getInt("annee"));
                s.setSalaireBase(rs.getDouble("salaire_base"));
                s.setPrimes(rs.getDouble("primes"));
                s.setDeductions(rs.getDouble("deductions"));
                s.setSalaireNet(rs.getDouble("salaire_net"));
                s.setNomEmploye(rs.getString("nom"));

                list.add(s);
            }

        }catch(Exception e){ e.printStackTrace(); }

        return list;
    }

    public List<Salaire> getByMatricule(String mat){
        List<Salaire> list = new ArrayList<>();

        try{
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
                "SELECT * FROM salaire WHERE matricule=?"
            );
            ps.setString(1, mat);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Salaire s = new Salaire();

                s.setId(rs.getInt("id"));
                s.setMois(rs.getInt("mois"));
                s.setAnnee(rs.getInt("annee"));
                s.setSalaireBase(rs.getDouble("salaire_base"));
                s.setPrimes(rs.getDouble("primes"));
                s.setDeductions(rs.getDouble("deductions"));
                s.setSalaireNet(rs.getDouble("salaire_net"));

                list.add(s);
            }

        }catch(Exception e){ e.printStackTrace(); }

        return list;
    }

    public void delete(int id){
        try{
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
                "DELETE FROM salaire WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

        }catch(Exception e){ e.printStackTrace(); }
    }
    public Map<String,Double> salaireParMois(){

    	Map<String,Double> map = new LinkedHashMap<>();

    	try{
    	Connection con = DBConnection.getConnection();

    	String sql = "SELECT mois, SUM(salaire_net) AS total "
    	           + "FROM salaire GROUP BY mois ORDER BY mois";

    	PreparedStatement ps = con.prepareStatement(sql);
    	ResultSet rs = ps.executeQuery();

    	while(rs.next()){
    	String mois = "M" + rs.getInt("mois");
    	double total = rs.getDouble("total");

    	map.put(mois, total);
    	}

    	}catch(Exception e){
    	e.printStackTrace();
    	}

    	return map;
    	}
}