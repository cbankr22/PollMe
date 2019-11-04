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


<div id="scrolltable">
<table class="greenTable">
<thead>
<tr>

<th>Pollname</th>
<th>Side 1</th>
<th>Side 2</th>
<th>Side 1 votes</th>
<th>Side 2 votes</th>
</tr>
</thead>
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
<tbody>
<tr>
<td><%=resultSet.getString("pollname") %></td>
<td><%=resultSet.getString("side1") %></td>
<td><%=resultSet.getString("side2") %></td>
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

</table>
</div>
<form action="loginsuccess.html">

Go Back: 
<input type="submit" value="Back to home" /> 

</form>
</div>
</body>
</html>