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
		

		<tbody>
		<tr>
		<td><%=resultSet2.getString("username") %></td>
		<td><%=resultSet2.getString("pollname") %></td>
		<td><%=resultSet2.getString("side1") %></td>
		<td><%=resultSet2.getString("side2") %></td>
		<td><%=resultSet2.getString("side1votes") %></td>
		<td><%=resultSet2.getString("side2votes") %></td>
		</tr>
		</tbody>
		
		<% 

		
		
	}

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