package hit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertData")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try { 
        	
      	  // Initialize the database 
      	
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
	       
	        
      	Connection conn = null;
      	conn =
  	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
  	   	                                    "user=root&password=colin2003");
        

          // Create a SQL query to insert data into demo table 
          // demo table consists of two columns, so two '?' is used 
      	
          final String SQL_INSERT = "INSERT INTO vibe (username, password) VALUES (?,?)";
  	    PreparedStatement st = conn.prepareStatement(SQL_INSERT); 
          // For the first parameter, 
          // get the data using request object 
          // sets the data to st pointer 
  	   
  	    String username = request.getParameter("username");
  	    String password = request.getParameter("password");
          

          // Same for second parameter 
          st.setString(1, username); 
          
          st.setString(2, password);
          // Execute the insert command using executeUpdate() 
          // to make changes in database 
          st.executeUpdate(); 
          //find last id
         
        
          
          // Close all the connections 
          st.close(); 
          conn.close(); 
          
          
          
          // Get a writer pointer  
          // to display the successful result 
          PrintWriter out = response.getWriter(); 
          out.println("<html><body><b>Successfully Signed up! <br/><br/> "  + "<br/><br/> Username: " + username + "<br/><br/> Password: " + password
                      + "  <br/><br/><form action=\"ss.html\"><input type=\"submit\" value=\"Go Back\" /></form></b></body></html>"); 
      } 
      catch (Exception e) { 
          e.printStackTrace(); 
      } 
	}

}
