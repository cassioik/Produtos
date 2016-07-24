package up.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import up.servlets.facade.ProdutoFacade;
import up.servlets.facade.UsuarioFacade;
import up.servlets.model.Produto;
import up.servlets.model.Usuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Produtos")
public class Produtos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Produtos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("Entrar")) {
			try {
				String userid = request.getParameter("userid");
				String password = request.getParameter("password");
	
				UsuarioFacade facade = new UsuarioFacade();
				Usuario usuario = new Usuario();
				usuario = facade.find(userid);
	
				if (userid.equals(usuario.getLogin()) && password.equals(usuario.getSenha())) {
					// Setando o userid na sessão
	
					HttpSession session = request.getSession(true);
	
					session.setAttribute("userid", userid);
	
					RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
	
					rd.forward(request, response);
	
					return;
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	
					rd.forward(request, response);
	
					return;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action.equals("Adicionar")) {
			try {
				String nome = request.getParameter("nome");
				String descricao = request.getParameter("descricao");
				String estoque = request.getParameter("estoque");
				Integer estoqueInt = Integer.valueOf(estoque);
				
				Produto produto = new Produto();
				produto.setNome(nome);
				produto.setDescricao(descricao);
				produto.setEstoque(estoqueInt);
				
				ProdutoFacade facade = new ProdutoFacade();
				facade.save(produto);
				
				RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
				
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (action.equals("Alterar")) {
			try {
				String codigo = request.getParameter("codigo");
				String nome = request.getParameter("nome");
				String descricao = request.getParameter("descricao");
				String estoque = request.getParameter("estoque");
				Integer codigoInt = Integer.valueOf(codigo);
				Integer estoqueInt = Integer.valueOf(estoque);
				
				Produto produto = new Produto();
				produto.setId(codigoInt);
				produto.setNome(nome);
				produto.setDescricao(descricao);
				produto.setEstoque(estoqueInt);
				
				ProdutoFacade facade = new ProdutoFacade();
				facade.update(produto);
				
				RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
				
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
