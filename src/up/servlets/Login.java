package up.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import up.servlets.dao.GenericDAO;
import up.servlets.dao.UsuarioDAO;
import up.servlets.model.Usuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		try {
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");

			UsuarioDAO usuarioDAO = new UsuarioDAO();
			Usuario usuario = new Usuario();
			usuarioDAO.beginTransaction();
			usuario = usuarioDAO.find(userid);
			System.out.println(usuario.getLogin());
			System.out.println(usuario.getSenha());

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
		} finally {
			GenericDAO.fecharEntityManagerFactory();
		}
	}

}
