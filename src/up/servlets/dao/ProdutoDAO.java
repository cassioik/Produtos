package up.servlets.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import up.servlets.model.Produto;

public class ProdutoDAO extends GenericDAO<Integer, Produto>{

	public ProdutoDAO() {
		super(Produto.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listar(){
		List<Produto> produtos;
		String sql = "SELECT p FROM Produto p";
		Query query = super.getEntityManager().createQuery(sql);
		
		try{
			produtos = query.getResultList();
			return produtos;
		}catch(NoResultException e){
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> Pesquisar(String pesquisar){
		List<Produto> produtos;
		String sql = "SELECT p FROM Produto p WHERE p.nome LIKE :pesquisar";
		Query query = super.getEntityManager().createQuery(sql);
		query.setParameter("pesquisar", "%"+pesquisar+"%");
		
		try{
			produtos = query.getResultList();
			return produtos;
		}catch(NoResultException e){
			return null;
		}
	}

}