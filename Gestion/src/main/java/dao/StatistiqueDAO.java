package dao;

import java.sql.*;
import util.DBConnection;

public class StatistiqueDAO {

    public int totalEmployes(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM employe");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }

    public int totalConges(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM conge");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }

    public int congesValides(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM conge WHERE statut='VALIDE'");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }

    public int congesRefuses(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM conge WHERE statut='REFUSE'");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }

    public int totalAbsences(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM absence");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }

    public int totalDocuments(){
        int total = 0;
        try{
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT COUNT(*) FROM document");
            ResultSet rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        }catch(Exception e){ e.printStackTrace(); }
        return total;
    }
}