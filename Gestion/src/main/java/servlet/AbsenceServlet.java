package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.AbsenceDAO;
import model.Absence;

@WebServlet("/absence")
public class AbsenceServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

/* ADD */
protected void doPost(HttpServletRequest r, HttpServletResponse p)
throws IOException {

try{

String matricule = r.getParameter("matricule");
String date = r.getParameter("date_absence");
String motif = r.getParameter("motif");

Absence a = new Absence();
a.setMatricule(matricule);
a.setDateAbsence(date);
a.setMotif(motif);

new AbsenceDAO().insert(a);

p.sendRedirect("Absences.jsp");

}catch(Exception e){
e.printStackTrace();
}
}

/* DELETE */
protected void doGet(HttpServletRequest r, HttpServletResponse p)
throws IOException {

try{

int id = Integer.parseInt(r.getParameter("id"));

new AbsenceDAO().delete(id);

p.sendRedirect("Absences.jsp");

}catch(Exception e){
e.printStackTrace();
}
}
}