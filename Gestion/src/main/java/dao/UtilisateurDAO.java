package dao;

import java.sql.*;
import model.Utilisateur;
import util.DBConnection;

public class UtilisateurDAO {

    public Utilisateur login(String username, String password){

        Utilisateur u = null;

        try{
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
            "SELECT * FROM utilisateurs WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                u = new Utilisateur();

                u.setId(rs.getInt("id"));
                u.setMatricule(rs.getString("matricule"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return u;
    }
}