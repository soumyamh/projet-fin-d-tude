package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ServiceDAO;

@WebServlet("/service")
public class ServiceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest r, HttpServletResponse p)
            throws IOException {

        String nom = r.getParameter("nom");

        if(nom != null && !nom.isEmpty()){
            new ServiceDAO().insert(nom);
        }

        p.sendRedirect("services.jsp");
    }

    protected void doGet(HttpServletRequest r, HttpServletResponse p)
            throws IOException {

        int id = Integer.parseInt(r.getParameter("id"));

        new ServiceDAO().delete(id);

        p.sendRedirect("services.jsp");
    }
}