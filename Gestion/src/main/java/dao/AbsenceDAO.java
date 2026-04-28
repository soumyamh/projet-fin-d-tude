package dao;

import java.sql.*;
import java.util.*;
import model.Absence;
import model.Employe;
import util.DBConnection;

public class AbsenceDAO {

public List<Employe> getAllEmployes(){

List<Employe> list = new ArrayList<>();

try{
Connection c = DBConnection.getConnection();

ResultSet rs = c.createStatement().executeQuery("SELECT * FROM employe");

while(rs.next()){
Employe e = new Employe();

e.setMatricule(rs.getString("matricule"));
e.setNom(rs.getString("nom"));

list.add(e);
}

}catch(Exception e){
e.printStackTrace();
}

return list;
}

/* INSERT */
public void insert(Absence a){

try{
Connection c = DBConnection.getConnection();

PreparedStatement ps = c.prepareStatement(
"INSERT INTO absence(matricule,date_absence,motif) VALUES(?,?,?)"
);

ps.setString(1, a.getMatricule());
ps.setString(2, a.getDateAbsence());
ps.setString(3, a.getMotif());

ps.executeUpdate();

System.out.println("✅ Absence ajoutée");

}catch(Exception e){
e.printStackTrace();
}
}

/* DELETE */
public void delete(int id){
try{
Connection c = DBConnection.getConnection();

PreparedStatement ps = c.prepareStatement(
"DELETE FROM absence WHERE id=?"
);

ps.setInt(1, id);
ps.executeUpdate();

}catch(Exception e){
e.printStackTrace();
}
}

/* LIST WITH JOIN */
public List<Absence> getAllWithEmploye(){

List<Absence> list = new ArrayList<>();

try{
Connection c = DBConnection.getConnection();

String sql =
"SELECT a.id, a.date_absence, a.motif, " +
"e.nom, e.matricule " +
"FROM absence a " +
"JOIN employe e ON a.matricule = e.matricule " +
"ORDER BY a.id DESC";

PreparedStatement ps = c.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){
Absence a = new Absence();

a.setId(rs.getInt("id"));
a.setDateAbsence(rs.getString("date_absence"));
a.setMotif(rs.getString("motif"));
a.setNomEmploye(rs.getString("nom"));
a.setMatricule(rs.getString("matricule"));

list.add(a);
}

}catch(Exception e){
e.printStackTrace();
}

return list;
}
public List<Absence> getByMatricule(String matricule){

    List<Absence> list = new ArrayList<>();

    try{
        Connection c = DBConnection.getConnection();

        PreparedStatement ps = c.prepareStatement(
            "SELECT * FROM absence WHERE matricule=?"
        );

        ps.setString(1, matricule);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Absence a = new Absence();

            a.setDateAbsence(rs.getString("date_absence"));
            a.setMotif(rs.getString("motif"));

            list.add(a);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return list;
}
}