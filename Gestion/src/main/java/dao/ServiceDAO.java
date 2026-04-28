package dao;

import java.sql.*;
import java.util.*;
import model.Service;
import util.DBConnection;

public class ServiceDAO {

   

    public void insert(String name) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("INSERT INTO service(name) VALUES(?)");
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("DELETE FROM service WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Service> getAll(){

    	List<Service> list = new ArrayList<>();

    	try{
    	Connection c = DBConnection.getConnection();

    	PreparedStatement ps = c.prepareStatement("SELECT * FROM service");

    	ResultSet rs = ps.executeQuery();

    	while(rs.next()){

    	Service s = new Service();

    	s.setId(rs.getInt("id"));
    	s.setNom(rs.getString("name"));

    	list.add(s);
    	}

    	}catch(Exception e){
    	e.printStackTrace();
    	}

    	return list;
    	}
}