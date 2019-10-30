package hit;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewPollsVotedOn
 */
@WebServlet("/ViewPollsVotedOn")
public class ViewPollsVotedOn extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession(true);
				int id = (int) session.getAttribute("userid");
				request.setAttribute("userid", id);
			    request.getRequestDispatcher("ViewPollsVotedOn.jsp").forward(request, response);
			    
			    
			    
			    
			    
			    
			    
			    
	}

}
