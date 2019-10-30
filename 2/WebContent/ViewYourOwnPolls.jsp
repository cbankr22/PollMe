<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


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
	
	
  	Connection conn =
	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
	   	                                    "user=root&password=colin2003");
Statement statement = conn.createStatement();
String sql ="SELECT * FROM polls WHERE userid = '" + id + "'";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">


<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("pollname") %></td>
<td><%=resultSet.getString("side1") %></td>
<td><%=resultSet.getString("side2") %></td>
<td><%=resultSet.getString("side1votes") %></td>
<td><%=resultSet.getString("side2votes") %></td>

</tr>
<% 
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