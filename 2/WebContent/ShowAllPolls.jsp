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
	
	
	
	
  	Connection conn =
	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
	   	                                    "user=root&password=colin2003");
Statement statement = conn.createStatement();
String sql ="SELECT * FROM polls ORDER BY totalvotes DESC";

ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">


<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("pollname") %></td>
<td
><form action="PlusOneToPoll" method="post">
<input type="hidden"  name="pollid" value=<%=resultSet.getString("id") %>>
<input type="hidden"  name="username" value=<%=resultSet.getString("username") %>>
<input type="hidden"  name="pollname" value=<%=resultSet.getString("pollname") %>>
<input type="hidden"  name="side1" value=<%=resultSet.getString("side1") %>>
<input type="hidden"  name="side2" value=<%=resultSet.getString("side2") %>>
<input type="hidden"  name="side1votes" value=<%=resultSet.getString("side1votes") %>>
<input type="hidden"  name="side2votes" value=<%=resultSet.getString("side2votes") %>>
<input type="hidden"  name="sidepicked" value=<%=resultSet.getString("side1") %>>
<button type="submit">
Vote for <%=resultSet.getString("side1") %> 		
</button>
</form>
</td>
<td><form action="PlusOneToPoll" method="post">
<input type="hidden"  name="pollid" value=<%=resultSet.getString("id") %>>
<input type="hidden"  name="username" value=<%=resultSet.getString("username") %>>
<input type="hidden"  name="pollname" value=<%=resultSet.getString("pollname") %>>
<input type="hidden"  name="side1" value=<%=resultSet.getString("side1") %>>
<input type="hidden"  name="side2" value=<%=resultSet.getString("side2") %>>
<input type="hidden"  name="side1votes" value=<%=resultSet.getString("side1votes") %>>
<input type="hidden"  name="side2votes" value=<%=resultSet.getString("side2votes") %>>
<input type="hidden"  name="sidepicked" value=<%=resultSet.getString("side2") %>>
<button type="submit">
Vote for <%=resultSet.getString("side2") %> 		
</button>
</form></td>
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