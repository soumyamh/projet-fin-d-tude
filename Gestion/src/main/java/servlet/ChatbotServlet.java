package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        String msg = request.getParameter("message").toLowerCase();

        String reply = "Je n'ai pas compris 🤔";

        /* ===== SALUTATION ===== */
        if(msg.contains("bonjour") || msg.contains("salut")){
            reply = "Bonjour 👋 Comment puis-je vous aider ?";
        }

        /* ===== EMPLOYE ===== */
        else if(msg.contains("mes infos") || msg.contains("profil")){
            reply = "Vous pouvez consulter vos informations dans la page 'Mes Infos' 👤";
        }

        else if(msg.contains("mes conges") || msg.contains("demande conge")){
            reply = "Vous pouvez voir ou demander vos congés dans 'Mes Congés' ✔";
        }

        else if(msg.contains("mes absences")){
            reply = "Vos absences sont disponibles dans la page 'Mes Absences' 📋";
        }

        else if(msg.contains("mes documents")){
            reply = "Vous pouvez consulter vos documents dans 'Mes Documents' 📁";
        }

        else if(msg.contains("mon salaire") || msg.contains("mes salaires")){
            reply = "Vous pouvez consulter vos salaires dans la page 'Mes Salaires' 💰";
        }

        /* ===== RH ===== */
        else if(msg.contains("employe")|| msg.contains("employes")){
            reply = "Vous pouvez gérer les employés dans la page 'Employés' 👥";
        }

        else if(msg.contains("conge") || msg.contains("congé")){
            reply = "Vous pouvez gérer les congés dans la page 'Congés' ✔";
        }

        else if(msg.contains("absence")){
            reply = "Les absences sont disponibles dans la page 'Absences' 📋";
        }

        else if(msg.contains("document")){
            reply = "Pour ajouter un document : allez à 'Documents' → Upload ✔";
        }

        else if(msg.contains("salaire")){
            reply = "Les salaires sont disponibles dans la page 'Salaires' 💰";
        }

        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write(reply);
    }
}