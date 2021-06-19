<!DOCTYPE html>

<%@page import="notepad.entities.Note"%>
<%@page import="notepad.daos.NoteDao"%>
<%@page import="java.util.List"%>

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
	crossorigin="anonymous" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container" style="width: 40vw; margin: auto">
		<div class="row">
			<%
				NoteDao dao = new NoteDao();
			//	out.print("<h1>" + dao.getNotes().size() + "</h1>");
			
			if(dao.getNotes().size() !=0){
				for (Note n : dao.getNotes()) {
			%>

			<div class="col-lg-4">
				<div class="card m-3" >
					<div class="card-body">
						<h5 class="card-title"><%=n.getTitle()%></h5>
						<p class="card-text"><%=n.getContent()%></p>
					</div>
					<div class="m-3 bg-white d-flex justify-content-between">
						<a href="edit_note.jsp?id=<%=n.getId()%>" class="btn btn-primary "><i class="fas fa-edit"></i></a>
						<a href="delete?id=<%=n.getId()%>" class="btn btn-primary"><i class="fas fa-trash-alt"></i></a>
					</div>
				</div>
			</div>

			<%
				}
			}else{%>
				<div class="container mt-3">
					<img alt="GIF" src="Images/tenor.gif">
					<h2>Notes Not Available .. Add Notes <a href="add_notes.jsp">click to add</a></h2>
				</div>	
			<%}
			%>

		</div>
	</div>

	<footer class="text-center">
		Developed By Jahid Momin &copy; ,2021
	</footer>
</body>
</html>


