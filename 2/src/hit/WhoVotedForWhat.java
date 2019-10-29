package hit;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WhoVotedForWhat {
	public void test(int pollid, int userid) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	       
        
      	Connection conn = null;
      	conn =
  	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
  	   	                                    "user=root&password=colin2003");
        

          // Create a SQL query to insert data into demo table 
          // demo table consists of two columns, so two '?' is used 
      	
          final String SQL_INSERT = "INSERT INTO pollsvoted (pollid, usernameid) VALUES (?,?)";
  	    PreparedStatement st = conn.prepareStatement(SQL_INSERT); 
		
		
		
  	  st.setInt(1, pollid); 
      
      st.setInt(2, userid);
      // Execute the insert command using executeUpdate() 
      // to make changes in database 
      st.executeUpdate(); 
      //find last id
		
	}
	
	}
