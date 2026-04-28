package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.PosteDAO;

@WebServlet("/poste")
public class PosteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest r, HttpServletResponse p)
            throws IOException {

        String nom = r.getParameter("nom");
        int serviceId = Integer.parseInt(r.getParameter("service_id"));

        if(nom != null && !nom.isEmpty()){
            new PosteDAO().insert(nom, serviceId);
        }

        p.sendRedirect("services.jsp");
    }

    protected void doGet(HttpServletRequest r, HttpServletResponse p)
            throws IOException {

        int id = Integer.parseInt(r.getParameter("id"));

        new PosteDAO().delete(id);

        p.sendRedirect("services.jsp");
    }
}