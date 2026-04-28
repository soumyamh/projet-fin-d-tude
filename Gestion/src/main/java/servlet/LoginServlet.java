package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UtilisateurDAO;
import model.Utilisateur;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest r, HttpServletResponse p)
    throws IOException {

        String username = r.getParameter("username");
        String password = r.getParameter("password");

        UtilisateurDAO dao = new UtilisateurDAO();
        Utilisateur user = dao.login(username, password);

        if(user != null){

           
        	HttpSession session = r.getSession();
        	session.setAttribute("matricule", user.getMatricule());
            session.setAttribute("role", user.getRole());

           
            if(user.getRole().equals("admin")){
                p.sendRedirect("dashboard-rh.jsp");
            }else{
                p.sendRedirect("dashboard-employe.jsp");
            }

        }else{
            p.sendRedirect("login.jsp?error=1");
        }
    }
}