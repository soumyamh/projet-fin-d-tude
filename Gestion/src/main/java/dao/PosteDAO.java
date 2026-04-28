package dao;

import java.sql.*;
import java.util.*;
import model.Poste;
import util.DBConnection;

public class PosteDAO {

    public List<Poste> getByService(int serviceId) {

        List<Poste> list = new ArrayList<>();

        try {
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
                "SELECT * FROM poste WHERE service_id=?"
            );

            ps.setInt(1, serviceId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Poste p = new Poste();

                p.setId(rs.getInt("id"));
                p.setNom(rs.getString("name"));
                p.setServiceId(rs.getInt("service_id"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void insert(String name, int serviceId) {
        try {
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
                "INSERT INTO poste(name, service_id) VALUES(?, ?)"
            );

            ps.setString(1, name);
            ps.setInt(2, serviceId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try {
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
                "DELETE FROM poste WHERE id=?"
            );

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Poste> getAll(){

    	List<Poste> list = new ArrayList<>();

    	try{
    	Connection c = DBConnection.getConnection();

    	PreparedStatement ps = c.prepareStatement("SELECT * FROM poste");

    	ResultSet rs = ps.executeQuery();

    	while(rs.next()){
    	Poste p = new Poste();

    	p.setId(rs.getInt("id"));
    	p.setNom(rs.getString("name"));
    	p.setServiceId(rs.getInt("service_id"));

    	list.add(p);
    	}

    	}catch(Exception e){
    	e.printStackTrace();
    	}

    	return list;
    	}
}