<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList" language="java" %>


<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">

<td><b>Username</b></td>
<td><b>Pollname</b></td>
<td><b>Side 1</b></td>
<td><b>Side 2</b></td>
<td><b>Side 1 votes</b></td>
<td><b>Side 2 votes</b></td>
</tr>
<%
try{ 
	
	int id = (int) request.getAttribute("userid");
	int pollid;
	
  	Connection conn =
	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
	   	                                    "user=root&password=colin2003");
Statement statement = conn.createStatement();
Statement statement2 = conn.createStatement();

String sql ="SELECT * FROM pollsvoted WHERE usernameid = '" + id + "'";
String sql2;



ResultSet resultSet = statement.executeQuery(sql);
ResultSet resultSet2;

while(resultSet.next()){
	pollid = resultSet.getInt("pollid");
	sql2 = "SELECT * FROM polls WHERE id = '" + pollid + "'";
	resultSet2 = statement2.executeQuery(sql2);
	while(resultSet2.next()) {
		%>
		<tr bgcolor="#DEB887">


		<td><%=resultSet2.getString("username") %></td>
		<td><%=resultSet2.getString("pollname") %></td>
		<td><%=resultSet2.getString("side1") %></td>
		<td><%=resultSet2.getString("side2") %></td>
		<td><%=resultSet2.getString("side1votes") %></td>
		<td><%=resultSet2.getString("side2votes") %></td>

		<% 

		
		
	}

}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="loginsuccess.html">

Go Back: 
<input type="submit" value="Back to home" /> 

</form>