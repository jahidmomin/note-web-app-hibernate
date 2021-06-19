package notepad.servlets;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notepad.daos.NoteDao;
import notepad.entities.Note;

/**
 * Servlet implementation class SaveNote
 */
@WebServlet(urlPatterns = "/save")
public class SaveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Note n=new Note();
		n.setId(new Random().nextInt());
		n.setTitle(request.getParameter("title"));
		n.setContent(request.getParameter("desc"));
		
		NoteDao dao=new NoteDao();
		boolean t=dao.saveNote(n);
		response.sendRedirect("index.jsp");
	}

}
