package up.servlets.facade;

import up.servlets.dao.UsuarioDAO;
import up.servlets.model.Usuario;

public class UsuarioFacade {
	private UsuarioDAO dao = new UsuarioDAO();
	
	public void save(Usuario usuario) throws Exception {
		try {
			dao.beginTransaction();
			dao.save(usuario);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}

	public void update(Usuario usuario) throws Exception {
		try {
			dao.beginTransaction();
			dao.update(usuario);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw new Exception(e);
		}
	}

	public Usuario find(String id) throws Exception {
		try {
			dao.beginTransaction();
			Usuario usuario = dao.find(id);
			dao.commitAndCloseTransaction();
			return usuario;
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}

	public void delete(String id) throws Exception {
		try {
			dao.beginTransaction();
			Usuario usuario = dao.findReferenceOnly(id);
			dao.delete(usuario);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}
}
