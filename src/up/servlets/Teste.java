package up.servlets;

import up.servlets.dao.GenericDAO;
import up.servlets.dao.UsuarioDAO;
import up.servlets.model.Usuario;

public class Teste {
	public static void main(String[] args) {
//		ProdutoDAO produtoDAO = new ProdutoDAO();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		try{
//			Produto produto = new Produto();
//			produtoDAO.beginTransaction();
//			produto = produtoDAO.find(2);
//			produto.setNome("Lápis");
//			produto.setDescricao("Lápis de cor azul");
//			produto.setEstoque(30);
//			produtoDAO.save(produto);
//			produtoDAO.commitAndCloseTransaction();
//			
//			System.out.println(produto.getNome());
			
			
			Usuario usuario = new Usuario();
			usuarioDAO.beginTransaction();
			usuario = usuarioDAO.find("admin");
			System.out.println(usuario.getLogin());
			System.out.println(usuario.getSenha());
			
		}catch(Exception e){
			//produtoDAO.rollbackAndCloseTransaction();
			usuarioDAO.rollbackAndCloseTransaction();
			e.printStackTrace();
		}finally{
			GenericDAO.fecharEntityManagerFactory();
		}
	}
}
