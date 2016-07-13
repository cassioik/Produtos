package up.servlets.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import up.servlets.model.Usuario;

public class UsuarioDAO extends GenericDAO<String, Usuario>{

	public UsuarioDAO() {
		super(Usuario.class);
	}
	
	public Boolean validarLogin(Usuario usuario){
		String sql = "SELECT u FROM Usuario u WHERE u.login = :login AND u.senha = :senha";
		Query query = super.getEntityManager().createQuery(sql);
		query.setParameter("login", usuario.getLogin());
		query.setParameter("senha", usuario.getSenha());
		
		try{
			query.getSingleResult();
			return true;
		}catch(NoResultException e){
			return false;
		}
	}

}
