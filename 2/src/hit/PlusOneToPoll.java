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
        	
        	Boolean voted = null;
        	WhoVotedForWhat doit = new WhoVotedForWhat();
    	    String side2 = request.getParameter("side2");
    	    String side1 = String.valueOf(request.getParameter("side1"));
    	    String Sside1votes = request.getParameter("side1votes");
    	    String Sside2votes = request.getParameter("side2votes");
    		String idstring = request.getParameter("pollid");
    		String sidepicked = String.valueOf(request.getParameter("sidepicked"));
    		String username = null;
    		
    		PreparedStatement ps, ps2;
    		ResultSet rs, rs2;
    		
    		int id = Integer.parseInt(idstring);
    		int side1votes = Integer.parseInt(Sside1votes);
    		int side2votes = Integer.parseInt(Sside2votes);
    		int userid = 0;
    		
    		
    		int i = 1;
    		
    		HttpSession session=request.getSession(false);  
    		
            username = (String) session.getAttribute("name");
            
            String query = "SELECT * FROM vibe WHERE username = '" + username + "';";
           
            
            
            
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                
                
                if(rs.next()) {
                	userid = rs.getInt(1);
                	
                	
                }
                
                String query2 = "SELECT * FROM pollsvoted WHERE pollid = '" + id + "' AND usernameid = '" + userid + "';";
                
                ps2 = conn.prepareStatement(query2);
                rs2 = ps2.executeQuery();
                
                if(rs2.next()) {
                	voted = true;
                	
                } else {
                	
                	voted = false;
                }
    	
    		if(sidepicked.equals(side1)) {
    			side1votes++;
    		}
    		if(sidepicked.equals(side2)) {
    			side2votes++;
    		}
    		int totalvotes = side1votes + side2votes;
    		
            final String SQL_INSERT = "UPDATE polls SET side1votes = " + side1votes + ", side2votes = " + side2votes + ", totalvotes = "+ totalvotes + " WHERE id = " + id + " ";
      	    PreparedStatement st = conn.prepareStatement(SQL_INSERT); 
           
      	    
      	    
      	    if(voted == false) {
      	    
      	    doit.test(id, userid);
            st.executeUpdate(); 
            
            st.close(); 
            conn.close(); 
            
            response.sendRedirect("ShowAllPolls.jsp");
      	    } else {
      	    	response.sendRedirect("AlreadyVoted.jsp");
      	    }
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
	}

}
