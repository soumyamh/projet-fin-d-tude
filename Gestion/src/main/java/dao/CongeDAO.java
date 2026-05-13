package dao;

import java.sql.*;
import java.util.*;
import model.Conge;
import util.DBConnection;

public class CongeDAO {

public List<Conge> getAll(){

List<Conge> list = new ArrayList<>();

try{
Connection c = DBConnection.getConnection();

String sql =
"SELECT c.*, e.nom " +
"FROM conge c " +
"JOIN employe e ON c.matricule = e.matricule " +
"ORDER BY c.id DESC";

PreparedStatement ps = c.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){

Conge c1 = new Conge();

c1.setId(rs.getInt("id"));
c1.setMatricule(rs.getString("matricule"));
c1.setDateDebut(rs.getString("date_debut"));
c1.setDateFin(rs.getString("date_fin"));
c1.setStatut(rs.getString("statut"));

c1.setNomEmploye(rs.getString("nom"));

list.add(c1);
}

}catch(Exception e){
e.printStackTrace();
}

return list;
}

/* UPDATE STATUT */
public void updateStatut(int id, String statut){

try{
Connection c = DBConnection.getConnection();

PreparedStatement ps = c.prepareStatement(
"UPDATE conge SET statut=? WHERE id=?"
);

ps.setString(1, statut);
ps.setInt(2, id);

ps.executeUpdate();

}catch(Exception e){
e.printStackTrace();
}
}
public List<Conge> getByMatricule(String matricule){
    List<Conge> list = new ArrayList<>();

    try{
        Connection c = DBConnection.getConnection();

        String sql =
        "SELECT c.*, e.nom FROM conge c " +
        "JOIN employe e ON c.matricule = e.matricule " +
        "WHERE c.matricule=? ORDER BY c.id DESC";

        PreparedStatement ps = c.prepareStatement(sql);
        ps.setString(1, matricule);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Conge c1 = new Conge();
            c1.setId(rs.getInt("id"));
            c1.setMatricule(rs.getString("matricule"));
            c1.setNomEmploye(rs.getString("nom"));
            c1.setDateDebut(rs.getString("date_debut"));
            c1.setDateFin(rs.getString("date_fin"));
            c1.setStatut(rs.getString("statut"));
            list.add(c1);
        }

    }catch(Exception e){ e.printStackTrace(); }

    return list;
}
public void insert(Conge c){

    try{
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO conge(matricule,date_debut,date_fin,statut) VALUES(?,?,?,'EN_ATTENTE')"
        );

        ps.setString(1, c.getMatricule());
        ps.setString(2, c.getDateDebut());
        ps.setString(3, c.getDateFin());

        ps.executeUpdate();

    }catch(Exception e){ e.printStackTrace(); }
}
public int countByStatut(String mat, String statut){
int count = 0;
try{
Connection c = DBConnection.getConnection();
PreparedStatement ps = c.prepareStatement(
"SELECT COUNT(*) FROM conge WHERE matricule=? AND statut=?"
);
ps.setString(1, mat);
ps.setString(2, statut);
ResultSet rs = ps.executeQuery();
if(rs.next()) count = rs.getInt(1);
}catch(Exception e){e.printStackTrace();}
return count;
}
public Map<String,Integer> congeParMois(){

Map<String,Integer> map = new LinkedHashMap<>();

try{
Connection con = DBConnection.getConnection();

String sql = "SELECT MONTH(date_debut) AS mois, COUNT(*) AS total "
           + "FROM conge GROUP BY mois ORDER BY mois";

PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){
String mois = "M" + rs.getInt("mois");
int total = rs.getInt("total");

map.put(mois, total);
}

}catch(Exception e){
e.printStackTrace();
}

return map;
}
}