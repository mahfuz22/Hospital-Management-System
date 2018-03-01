package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
//		out.println("<h1> my name is khan "+email+"</h1>");
//		out.println("<h1> my name is khan "+pass+"</h1>");
		HttpSession session=request.getSession();
		Connection connection=null;
		Statement statement=null;
		ResultSet rSet=null;
		connection=dbConnector.DbConnector.getConnection();
		try {
			statement=connection.createStatement();
			rSet=statement.executeQuery("select * from admin where admin_email='"+email+"' and admin_password='"+pass+"'");
			if(rSet.next()) {
				session.setAttribute("userEmail", email);
				//System.out.println("user correct");
				RequestDispatcher rDispatcher=request.getRequestDispatcher("welcome.jsp");
				rDispatcher.forward(request, response);
			}
			else{
				request.setAttribute("error", "Login failed !! try again");
				request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				statement.close();
				rSet.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

}
