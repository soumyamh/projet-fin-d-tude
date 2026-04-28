package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import dao.EmployeDAO;
import model.Employe;

@WebServlet("/updateEmploye")
@MultipartConfig
public class UpdateEmployeServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

request.setCharacterEncoding("UTF-8");

try{

Employe e = new Employe();

e.setId(Integer.parseInt(request.getParameter("id")));

e.setMatricule(request.getParameter("matricule"));
e.setNom(request.getParameter("nom"));
e.setPrenom(request.getParameter("prenom"));
e.setDateNaissance(request.getParameter("date_naissance"));
e.setDateEmbauche(request.getParameter("date_embauche"));
e.setTelephone(request.getParameter("telephone"));
e.setEmail(request.getParameter("email"));
e.setPoste(request.getParameter("poste"));
e.setService(request.getParameter("service"));

/* PHOTO */
Part filePart = request.getPart("photo");

String fileName = null;

if(filePart != null && filePart.getSize() > 0){

String original = getFileName(filePart);

fileName = System.currentTimeMillis() + "_" + original;

String path = getServletContext().getRealPath("") + File.separator + "uploads";

File dir = new File(path);
if(!dir.exists()) dir.mkdir();

filePart.write(path + File.separator + fileName);

}else{
fileName = request.getParameter("old_photo");
}

e.setPhoto(fileName);

/* UPDATE */
new EmployeDAO().update(e);

response.sendRedirect("employes.jsp");

}catch(Exception ex){
ex.printStackTrace();
response.getWriter().println("ERROR: " + ex.getMessage());
}
}

/* TOMCAT 7 FIX */
private String getFileName(Part part) {

String contentDisp = part.getHeader("content-disposition");

for (String content : contentDisp.split(";")) {
if (content.trim().startsWith("filename")) {
return content.substring(content.indexOf("=") + 2, content.length() - 1);
}
}
return null;
}
}