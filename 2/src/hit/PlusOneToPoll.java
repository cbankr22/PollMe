package hit;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet("/PlusOneToPoll")
public class PlusOneToPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
try { 
        	
    	    
        	
 	        Class.forName("com.mysql.jdbc.Driver").newInstance();
 	       
	        
        	Connection conn = null;
        	conn =
    	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
    	   	                                    "user=root&password=colin2003");
          
         
        
    	    
    	  
    	    String side2 = request.getParameter("side2");
    	    String side1 = String.valueOf(request.getParameter("side1"));
    	    String Sside1votes = request.getParameter("side1votes");
    	    String Sside2votes = request.getParameter("side2votes");
    		String idstring = request.getParameter("pollid");
    		String sidepicked = String.valueOf(request.getParameter("sidepicked"));
    		
    		
    		
    		int id = Integer.parseInt(idstring);
    		int side1votes = Integer.parseInt(Sside1votes);
    		int side2votes = Integer.parseInt(Sside2votes);
    		
    
    		
    		if(sidepicked.equals(side1)) {
    			side1votes++;
    		}
    		if(sidepicked.equals(side2)) {
    			side2votes++;
    		}
    		
            final String SQL_INSERT = "UPDATE polls SET side1votes = " + side1votes + ", side2votes = " + side2votes + " WHERE id = " + id + " ";
      	    PreparedStatement st = conn.prepareStatement(SQL_INSERT); 
           
     
       
            st.executeUpdate(); 
          
           
          
            
            
            st.close(); 
            conn.close(); 
            
            response.sendRedirect("loginsuccess.html");
      
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
	}

}
