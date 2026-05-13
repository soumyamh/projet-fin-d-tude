package servlet;

import java.io.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

import dao.DocumentDAO;
import model.Document;

@WebServlet("/document")
public class DocumentServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws IOException {

try{

/* CHECK MULTIPART */
if(!ServletFileUpload.isMultipartContent(request)){
response.getWriter().println("Form must be multipart!");
return;
}

/* UPLOAD CONFIG */
DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);

/* GET DATA */
List<FileItem> items = upload.parseRequest(request);

String matricule = null;
String type = null;
String fileName = null;

/* PATH */
String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
File dir = new File(uploadPath);
if(!dir.exists()) dir.mkdir();

/* LOOP */
for(FileItem item : items){

if(item.isFormField()){

if(item.getFieldName().equals("matricule")){
matricule = item.getString();
}

if(item.getFieldName().equals("type")){
type = item.getString();
}

}else{

if(item.getSize() > 0){

fileName = System.currentTimeMillis() + "_" + item.getName();

File file = new File(uploadPath + File.separator + fileName);
item.write(file);

}

}
}

/* SAVE DB */
Document d = new Document();
d.setMatricule(matricule);
d.setType(type);
d.setFileName(fileName);

new DocumentDAO().insert(d);

response.sendRedirect("Documents.jsp");

}catch(Exception e){
e.printStackTrace();
response.getWriter().println("ERROR: " + e.getMessage());
}
}
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");
    DocumentDAO dao = new DocumentDAO();

    if ("delete".equals(action)) {

        int id = Integer.parseInt(request.getParameter("id"));

        // جلب document
        Document d = dao.getById(id);

        if (d != null) {

            String path = getServletContext().getRealPath("")
                    + File.separator + "uploads"
                    + File.separator + d.getFileName();

            File file = new File(path);

            if (file.exists()) {
                file.delete();
            }
        }

        // حذف من DB
        dao.delete(id);
    }

    response.sendRedirect("Documents.jsp");
}

}
