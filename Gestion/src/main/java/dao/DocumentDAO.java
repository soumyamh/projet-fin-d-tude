package dao;

import java.sql.*;
import java.util.*;
import model.Document;
import util.DBConnection;

public class DocumentDAO {

public void insert(Document d){

try{
Connection c = DBConnection.getConnection();

PreparedStatement ps = c.prepareStatement(
"INSERT INTO document(matricule,type,file_name) VALUES(?,?,?)"
);

ps.setString(1, d.getMatricule());
ps.setString(2, d.getType());
ps.setString(3, d.getFileName());

ps.executeUpdate();

}catch(Exception e){
e.printStackTrace();
}
}

public List<Document> getAllWithEmploye(){

List<Document> list = new ArrayList<>();

try{
Connection c = DBConnection.getConnection();

String sql =
"SELECT d.*, e.nom " +
"FROM document d " +
"JOIN employe e ON d.matricule = e.matricule";

PreparedStatement ps = c.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){

Document d = new Document();

d.setId(rs.getInt("id"));
d.setMatricule(rs.getString("matricule"));
d.setType(rs.getString("type"));
d.setFileName(rs.getString("file_name"));

d.setNomEmploye(rs.getString("nom"));

list.add(d);
}

}catch(Exception e){
e.printStackTrace();
}

return list;
}
public List<Document> getByMatricule(String matricule){

    List<Document> list = new ArrayList<>();

    try{
        Connection c = DBConnection.getConnection();

        String sql =
        "SELECT d.* FROM document d " +
        "JOIN employe e ON d.matricule = e.matricule " +
        "WHERE e.matricule=?";

        PreparedStatement ps = c.prepareStatement(sql);
        ps.setString(1, matricule);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            Document d = new Document();

            d.setId(rs.getInt("id"));
            d.setMatricule(rs.getString("matricule"));
            d.setType(rs.getString("type"));
            d.setFileName(rs.getString("file_name"));

            list.add(d);
        }

    }catch(Exception e){ e.printStackTrace(); }

    return list;
}
public void delete(int id){
    try{
        Connection c =DBConnection.getConnection();
        PreparedStatement ps = c.prepareStatement("DELETE FROM document WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
    }catch(Exception e){
        e.printStackTrace();
    }
}
public Document getById(int id){

    Document d = null;

    try{
        Connection c = DBConnection.getConnection();

        PreparedStatement ps = c.prepareStatement(
            "SELECT * FROM document WHERE id=?"
        );

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            d = new Document();

            d.setId(rs.getInt("id"));
            d.setMatricule(rs.getString("matricule"));
            d.setType(rs.getString("type"));
            d.setFileName(rs.getString("file_name"));
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return d;
}
}