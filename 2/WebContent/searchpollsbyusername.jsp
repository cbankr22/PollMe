<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	String search = request.getParameter("searchresult");
	
	
  	Connection conn =
	   	        DriverManager.getConnection("jdbc:mysql://localhost/test1?" +
	   	                                    "user=root&password=colin2003");
PreparedStatement statement = conn.prepareStatement("SELECT * FROM polls WHERE username LIKE ? ORDER BY totalvotes DESC");
String searchWizard = "%" + search + "%";
statement.setString(1, searchWizard);

ResultSet resultSet = statement.executeQuery();
if(resultSet.next() == false){
%>
<tbody>
<tr>
	<td> No polls found. </td>
</tr>
</tbody>
	
	
<% 
} else {
do {
%>

<tbody>
<tr>
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
</tbody>

<% 
} while(resultSet.next());
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

<form action="ShowAllPolls.jsp">

View all: 
<input type="submit" value="View all" /> 

</form>

</div>
</body>
</html>