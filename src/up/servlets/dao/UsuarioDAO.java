package up.servlets.dao;

import up.servlets.model.Usuario;

public class UsuarioDAO extends GenericDAO<Integer, Usuario>{

	public UsuarioDAO() {
		super(Usuario.class);
	}

}
