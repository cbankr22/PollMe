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

import com.mysql.cj.xdevapi.Statement;


@WebServlet("/CreateAPoll")
public class CreateAPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Initialize the database 
		try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
       
        
  	Connection conn = null;
  	conn =
	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
	   	                                "user=root&password=colin2003");
  	
  	String username = null;
	HttpSession session=request.getSession(false);  
    if(session != null){  
    //do shit with session data
    username = (String) session.getAttribute("name");
    
    }
    
      // Create a SQL query to insert data into demo table 
      // demo table consists of two columns, so two '?' is used 
  	
      final String SQL_INSERT = "INSERT INTO polls ( username, pollname, side1, side2) VALUES (?,?,?,?)";
	    PreparedStatement st = conn.prepareStatement(SQL_INSERT); 
      // For the first parameter, 
      // get the data using request object 
      // sets the data to st pointer 
	    
	    String pollname = request.getParameter("pollname");
	    String side1 = request.getParameter("side1");
	    String side2 = request.getParameter("side2");


	    request.setAttribute("pollname", pollname);
	    request.getRequestDispatcher("ShowCreatedPoll.jsp").forward(request, response);

      // Same for second parameter 
	 
      st.setString(1, username); 
      
      st.setString(2, pollname);
      st.setString(3, side1);
      st.setString(4, side2);
      // Execute the insert command using executeUpdate() 
      // to make changes in database 
      st.executeUpdate(); 
      //find last id
     
    
      
      // Close all the connections 
      st.close(); 
      conn.close(); 
      
      
      
  } 
	catch (Exception e) { 
        e.printStackTrace(); 
    } 

}
}
