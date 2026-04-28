package dao;

import java.sql.*;
import java.util.*;

public class DashboardDAO {

    Connection con;

    public DashboardDAO() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");

    		Connection con = DriverManager.getConnection(
    		"jdbc:mysql://localhost:3308/gestion_rh",
    		"root",
    		""
    		);

    		

    		} catch(Exception e) {
    		e.printStackTrace();
    		}
    }

    
    //  TOTAL EMPLOYEES
    
    public int countEmployees() {
        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM employe";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

  
    //  TOTAL SERVICES
    
    public int countServices() {
        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM service";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

   
    //  CONGÉS EN ATTENTE
    
    public int countCongesEnAttente() {
        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM conge WHERE statut = 'EN_ATTENTE'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    
    //  ABSENCES AUJOURD'HUI
    
    public int countAbsencesToday() {
        int count = 0;

        try {
            String sql = "SELECT COUNT(*) FROM absence WHERE date_absence = CURDATE()";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

   
    //  RÉPARTITION PAR SERVICE
    
    public List<Object[]> getEmployeesByService() {

        List<Object[]> list = new ArrayList<>();

        try {
            String sql =
                "SELECT s.nom, COUNT(e.id) " +
                "FROM service s " +
                "LEFT JOIN employe e ON s.id = e.service_id " +
                "GROUP BY s.nom";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] row = new Object[2];
                row[0] = rs.getString(1); // service name
                row[1] = rs.getInt(2);    // count employees

                list.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}