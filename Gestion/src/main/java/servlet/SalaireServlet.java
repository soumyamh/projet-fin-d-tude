package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.SalaireDAO;
import model.Salaire;

@WebServlet("/salaire")
public class SalaireServlet extends HttpServlet {

protected void doPost(HttpServletRequest r, HttpServletResponse p)
throws IOException {

    Salaire s = new Salaire();

    s.setMatricule(r.getParameter("matricule"));
    s.setMois(Integer.parseInt(r.getParameter("mois")));
    s.setAnnee(Integer.parseInt(r.getParameter("annee")));
    s.setSalaireBase(Double.parseDouble(r.getParameter("salaire_base")));
    s.setPrimes(Double.parseDouble(r.getParameter("primes")));
    s.setDeductions(Double.parseDouble(r.getParameter("deductions")));

    new SalaireDAO().insert(s);

    p.sendRedirect("salaires.jsp");
}

protected void doGet(HttpServletRequest r, HttpServletResponse p)
throws IOException {

    int id = Integer.parseInt(r.getParameter("id"));

    new SalaireDAO().delete(id);

    p.sendRedirect("salaires.jsp");
}
}