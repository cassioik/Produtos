package up.servlets;

import up.servlets.dao.GenericDAO;
import up.servlets.dao.ProdutoDAO;
import up.servlets.model.Produto;

public class Teste {
	public static void main(String[] args) {
		ProdutoDAO produtoDAO = new ProdutoDAO();
		try{
			Produto produto = new Produto();
			produtoDAO.beginTransaction();
			produto = produtoDAO.find(2);
//			produto.setNome("Lápis");
//			produto.setDescricao("Lápis de cor azul");
//			produto.setEstoque(30);
//			produtoDAO.save(produto);
			produtoDAO.commitAndCloseTransaction();
			
			System.out.println(produto.getNome());
			
		}catch(Exception e){
			produtoDAO.rollbackAndCloseTransaction();
			e.printStackTrace();
		}finally{
			GenericDAO.fecharEntityManagerFactory();
		}
	}
}
