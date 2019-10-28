package hit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/CheckUsername")
public class CheckUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
        	
    	    
        	
 	        Class.forName("com.mysql.jdbc.Driver").newInstance();
 	       
	        
        	Connection conn = null;
        	conn =
    	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
    	   	                                    "user=root&password=colin2003");
          
         
            
    	    PreparedStatement ps;
    	    ResultSet rs;
    	   
    	    String username = request.getParameter("username");
    	    String password = request.getParameter("password");
            String query = "SELECT * FROM `vibe` WHERE `username` =? AND `password` =?";
            
    	    
            try {
                ps = conn.prepareStatement(query);
                
                ps.setString(1, username);
                ps.setString(2, password);
                
                rs = ps.executeQuery();
                
                if(rs.next())
                {
                	HttpSession session = request.getSession();
                	session.setAttribute("name", username);
                	
                	response.sendRedirect("loginsuccess.html");
                	
                }
                else{
                	response.sendRedirect("loginfailed.jsp");
                    }
            } catch (SQLException ex) {
                
            }
            
            // Get a writer pointer  
            // to display the successful result 
           
            
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
	}

}
