package up.servlets.facade;

import java.util.List;

import up.servlets.dao.ProdutoDAO;
import up.servlets.model.Produto;


public class ProdutoFacade {
	private ProdutoDAO dao = new ProdutoDAO();
	
	public void save(Produto produto) throws Exception {
		try {
			dao.beginTransaction();
			dao.save(produto);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}

	public void update(Produto produto) throws Exception {
		try {
			dao.beginTransaction();
			dao.update(produto);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw new Exception(e);
		}
	}

	public Produto find(Integer id) throws Exception {
		try {
			dao.beginTransaction();
			Produto produto = dao.find(id);
			dao.commitAndCloseTransaction();
			return produto;
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}

	public void delete(Integer id) throws Exception {
		try {
			dao.beginTransaction();
			Produto produto = dao.findReferenceOnly(id);
			dao.delete(produto);
			dao.commitAndCloseTransaction();
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}
	
	public List<Produto> listar() throws Exception {
		try {
			dao.beginTransaction();
			List<Produto> produtos = dao.listar();
			dao.commitAndCloseTransaction();
			return produtos;
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}
	
	public List<Produto> pesquisar(String pesquisar) throws Exception {
		try {
			dao.beginTransaction();
			List<Produto> produtos = dao.Pesquisar(pesquisar);
			dao.commitAndCloseTransaction();
			return produtos;
		} catch (Exception e) {
			dao.rollbackAndCloseTransaction();
			throw e;
		}
	}
}
