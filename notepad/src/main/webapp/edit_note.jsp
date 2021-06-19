<!DOCTYPE html>
<%@page import="notepad.entities.Note"%>
<%@page import="notepad.daos.NoteDao"%>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
		int id=Integer.parseInt(request.getParameter("id").trim());
		//out.println(id);
		NoteDao dao=new NoteDao();
		Note n=dao.getNote(id);
	%>
	<div class="container">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container" style="width:40vw;margin:auto">
		<form action="edit" method="post" class="card-body">
		<input type="hidden" name="id" value="<%=n.getId()%>">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Enter An Note Title : </label> <input type="text" class="form-control"
					name="title" aria-describedby="title" value="<%=n.getTitle() %>" required>
				<div id="emailHelp" class="form-text">*Note of passwords ,  social media useranames any things ..</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Enter Description About Note :</label>
				<textarea  name="desc" class="form-control" required> <%=n.getContent() %></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Edit Note</button>
		</form>
	</div>


</body>
</html>


