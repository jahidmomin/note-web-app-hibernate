package notepad.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import notepad.entities.Note;

public class NoteDao {
	public static SessionFactory sf;
	
	public static SessionFactory getFactory() {
		if (sf==null) {
			sf=new Configuration().configure().buildSessionFactory();
		}
		return sf;
	}
	
	public boolean saveNote(Note note) {
		Session s=getFactory().openSession();
		Transaction tr=s.beginTransaction();
		s.save(note);
		tr.commit();
		s.close();
		return true;
	}
	
	public boolean deleteNote(int id) {
		Session s=getFactory().openSession();
		Transaction tr=s.beginTransaction();
		Note note=s.get(Note.class, id);
		s.delete(note);
		tr.commit();
		s.close();
		return true;
	}
	
	public List<Note> getNotes(){
		Session s=getFactory().openSession();
		 Query<Note> q =s.createQuery("from Note");
		return q.getResultList();
	}
	
	public Note getNote(int id){
		Session s=getFactory().openSession();
		Transaction tr=s.beginTransaction();
		Note note=s.get(Note.class, id);
		tr.commit();
		s.close();
		return note;
	}

	public boolean updateNote(Note n) {
		// TODO Auto-generated method stub
		Session s=getFactory().openSession();
		Transaction tr=s.beginTransaction();
		Note note=s.get(Note.class,n.getId());
		note.setId(n.getId());
		note.setTitle(n.getTitle());
		note.setContent(n.getContent());
		tr.commit();
		s.close();
		return true;
	}
}
