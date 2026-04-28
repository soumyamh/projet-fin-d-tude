package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import dao.EmployeDAO;
import model.Employe;

@WebServlet("/employe")
@MultipartConfig
public class EmployeServlet extends HttpServlet {

    // Méthode pour extraire le nom du fichier image
    private String getFileName(Part part) {
        String content = part.getHeader("content-disposition");
        for (String s : content.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        EmployeDAO dao = new EmployeDAO();

        // On gère ADD et UPDATE ici
        if ("add".equals(action) || "update".equals(action)) {
            Employe e = new Employe();

            // Si c'est une modification, on récupère l'ID caché
            if ("update".equals(action)) {
                e.setId(Integer.parseInt(request.getParameter("id")));
            }

            // Récupération de TOUS les champs (Dates en String)
            e.setMatricule(request.getParameter("matricule"));
            e.setNom(request.getParameter("nom"));
            e.setPrenom(request.getParameter("prenom"));
            e.setDateNaissance(request.getParameter("date_naissance"));
            e.setDateEmbauche(request.getParameter("date_embauche"));
            e.setSexe(request.getParameter("sexe"));
            e.setNationalite(request.getParameter("nationalite"));
            e.setSituationFamiliale(request.getParameter("situation_familiale"));
            e.setAdresse(request.getParameter("adresse"));
            e.setTelephone(request.getParameter("telephone"));
            e.setEmail(request.getParameter("email"));
            e.setPoste(request.getParameter("poste"));
            e.setDepartement(request.getParameter("departement"));
            e.setService(request.getParameter("service"));
            e.setTypeContrat(request.getParameter("type_contrat"));
            e.setStatut(request.getParameter("statut"));

            // Gestion de la photo
            Part filePart = request.getPart("photo");
            String fileName = request.getParameter("current_photo"); // On garde l'ancienne par défaut
            System.out.println("FILE PART = " + filePart);
            if (filePart != null && filePart.getSize() > 0) {
                // Si l'utilisateur a uploadé une nouvelle image
                fileName = System.currentTimeMillis() + "_" + getFileName(filePart);
                String path = getServletContext().getRealPath("") + File.separator + "uploads";
                
                File dir = new File(path);
                if (!dir.exists()) dir.mkdir();
                
                filePart.write(path + File.separator + fileName);
            }
            e.setPhoto(fileName);

            // Exécution de l'action en base de données
            if ("add".equals(action)) {
                dao.insert(e);
            } else {
                dao.update(e);
            }
        }

        response.sendRedirect("employes.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        EmployeDAO dao = new EmployeDAO();

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect("employes.jsp");
        } 
        else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Employe e = dao.getById(id);
            request.setAttribute("emp", e);
            request.getRequestDispatcher("edit-employe.jsp").forward(request, response);
        }
    }
}