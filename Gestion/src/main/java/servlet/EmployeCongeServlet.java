package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CongeDAO;
import model.Conge;

/**
 * Servlet implementation class EmployeCongeServlet
 */
@WebServlet("/employeConge")
public class EmployeCongeServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res)
throws IOException {

    HttpSession session = req.getSession();

    String matricule = (String) session.getAttribute("matricule");

    String debut = req.getParameter("date_debut");
    String fin = req.getParameter("date_fin");

    Conge c = new Conge();
    c.setMatricule(matricule);
    c.setDateDebut(debut);
    c.setDateFin(fin);

    new CongeDAO().insert(c);

    res.sendRedirect("mesConges.jsp");
}
}