package servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.CongeDAO;

@WebServlet("/conge")
public class CongeServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws IOException {

try{

String action = request.getParameter("action");
int id = Integer.parseInt(request.getParameter("id"));

CongeDAO dao = new CongeDAO();

if("valider".equals(action)){
dao.updateStatut(id, "VALIDE");
}

if("refuser".equals(action)){
dao.updateStatut(id, "REFUSE");
}

response.sendRedirect("conges.jsp");

}catch(Exception e){
e.printStackTrace();
}
}
}