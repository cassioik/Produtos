package up.servlets.dao;

import up.servlets.model.Produto;

public class ProdutoDAO extends GenericDAO<Integer, Produto>{

	public ProdutoDAO() {
		super(Produto.class);
	}

}