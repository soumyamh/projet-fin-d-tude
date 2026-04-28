package dao;

import java.sql.*;
import java.util.*;
import model.Employe;
import util.DBConnection;

public class EmployeDAO {

	public void insert(Employe e) {
	    try {
	        Connection c = DBConnection.getConnection();
	     
	        String sql = "INSERT INTO employe (matricule, nom, prenom, date_naissance, date_embauche, sexe, nationalite, situation_familiale, adresse, telephone, email, poste, departement, service, type_contrat, statut, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement ps = c.prepareStatement(sql);
	        ps.setString(1, e.getMatricule());
	        ps.setString(2, e.getNom());
	        ps.setString(3, e.getPrenom());
	        ps.setString(4, e.getDateNaissance());
	        ps.setString(5, e.getDateEmbauche());
	        ps.setString(6, e.getSexe());
	        ps.setString(7, e.getNationalite());
	        ps.setString(8, e.getSituationFamiliale());
	        ps.setString(9, e.getAdresse());
	        ps.setString(10, e.getTelephone());
	        ps.setString(11, e.getEmail());
	        ps.setString(12, e.getPoste());
	        ps.setString(13, e.getDepartement());
	        ps.setString(14, e.getService());
	        ps.setString(15, e.getTypeContrat());
	        ps.setString(16, e.getStatut());
	        ps.setString(17, e.getPhoto());

	        int resultat = ps.executeUpdate(); 
	        System.out.println("Lignes ajoutées : " + resultat); // Si ça affiche 1, c'est bon !

	    } catch (Exception ex) {
	        ex.printStackTrace(); 
	    }
	}
    public List<Employe> getAll() {
        List<Employe> list = new ArrayList<>();
        try {
            Connection c = DBConnection.getConnection();
            ResultSet rs = c.createStatement().executeQuery("SELECT * FROM employe");
            while (rs.next()) {
                list.add(mapResultSetToEmploye(rs));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Employe getById(int id) {
        Employe e = null;
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT * FROM employe WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = mapResultSetToEmploye(rs);
            }
        } catch (Exception ex) { ex.printStackTrace(); }
        return e;
    }

    public void update(Employe e){

    	try{

    	Connection c = DBConnection.getConnection();

    	PreparedStatement ps = c.prepareStatement(
    	"UPDATE employe SET matricule=?, nom=?, prenom=?, date_naissance=?, date_embauche=?, telephone=?, email=?, poste=?, service=?, photo=? WHERE id=?"
    	);

    	ps.setString(1, e.getMatricule());
    	ps.setString(2, e.getNom());
    	ps.setString(3, e.getPrenom());
    	ps.setString(4, e.getDateNaissance());
    	ps.setString(5, e.getDateEmbauche());
    	ps.setString(6, e.getTelephone());
    	ps.setString(7, e.getEmail());
    	ps.setString(8, e.getPoste());
    	ps.setString(9, e.getService());
    	ps.setString(10, e.getPhoto());

    	ps.setInt(11, e.getId());

    	ps.executeUpdate();

    	System.out.println("UPDATE OK");

    	}catch(Exception e1){
    	e1.printStackTrace();
    	}
    	}
    	

    public void delete(int id) {
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("DELETE FROM employe WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Employe> search(String m) {
        List<Employe> list = new ArrayList<>();
        try {
            Connection c = DBConnection.getConnection();
            PreparedStatement ps = c.prepareStatement("SELECT * FROM employe WHERE matricule LIKE ? OR nom LIKE ?");
            ps.setString(1, "%" + m + "%");
            ps.setString(2, "%" + m + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToEmploye(rs));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }


    private Employe mapResultSetToEmploye(ResultSet rs) throws SQLException {
        Employe e = new Employe();
        e.setId(rs.getInt("id"));
        e.setMatricule(rs.getString("matricule"));
        e.setNom(rs.getString("nom"));
        e.setPrenom(rs.getString("prenom"));
        e.setDateNaissance(rs.getString("date_naissance"));
        e.setDateEmbauche(rs.getString("date_embauche"));
        e.setSexe(rs.getString("sexe"));
        e.setNationalite(rs.getString("nationalite"));
        e.setSituationFamiliale(rs.getString("situation_familiale"));
        e.setAdresse(rs.getString("adresse"));
        e.setTelephone(rs.getString("telephone"));
        e.setEmail(rs.getString("email"));
        e.setPoste(rs.getString("poste"));
        e.setDepartement(rs.getString("departement"));
        e.setService(rs.getString("service"));
        e.setTypeContrat(rs.getString("type_contrat"));
        e.setStatut(rs.getString("statut"));
        e.setPhoto(rs.getString("photo"));
        return e;
    }
    public Employe getByMatricule(String matricule){

        Employe e = null;

        try{
            Connection c = DBConnection.getConnection();

            PreparedStatement ps = c.prepareStatement(
            "SELECT * FROM employe WHERE matricule=?"
            );

            ps.setString(1, matricule);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                e = new Employe();

                e.setId(rs.getInt("id"));
                e.setMatricule(rs.getString("matricule"));
                e.setNom(rs.getString("nom"));
                e.setPrenom(rs.getString("prenom"));
                e.setDateNaissance(rs.getString("date_naissance"));
                e.setDateEmbauche(rs.getString("date_embauche"));
                e.setSexe(rs.getString("sexe"));
                e.setNationalite(rs.getString("nationalite"));
                e.setSituationFamiliale(rs.getString("situation_familiale"));
                e.setAdresse(rs.getString("adresse"));
                e.setTelephone(rs.getString("telephone"));
                e.setEmail(rs.getString("email"));
                e.setPoste(rs.getString("poste"));
                e.setDepartement(rs.getString("departement"));
                e.setService(rs.getString("service"));
                e.setTypeContrat(rs.getString("type_contrat"));
                e.setStatut(rs.getString("statut"));
                e.setPhoto(rs.getString("photo"));
            }

        }catch(Exception ex){ ex.printStackTrace(); }

        return e;
    }
}