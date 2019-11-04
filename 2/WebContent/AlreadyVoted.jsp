<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<link rel="stylesheet" href="tables.css" type = "text/css">
</head>
<body>
<div id="background">

<form action="searchpolls.jsp" id = "form">
Search for a poll 
<input type="text" name="searchresult">
<input type="submit" value="Submit" />

</form>

<form action="searchpollsbyusername.jsp" id = "form">
Search by username
<input type="text" name="searchresult">
<input type="submit" value="Submit" />
</form>
<div id="scrolltable">
<table class="greenTable">
<thead>
<tr>
<th>Most popular polls</th>
<th>You have already voted for that poll!</th>
</tr>
<tr>
<th>Username</th>
<th>Pollname</th>
<th>Side 1</th>
<th>Side 2</th>
<th>Side 1 votes</th>
<th>Side 2 votes</th>
</tr>
</thead>
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

<tbody>
<tr>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("pollname") %></td>
<td>
<form action="PlusOneToPoll" method="post">
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
</tbody>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<tfoot>
</tfoot>
</table>
</div>
<form action="loginsuccess.html">

Go Back: 
<input type="submit" value="Back to home" /> 

</form>

</div>
</body>
</html>
