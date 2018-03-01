package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//taking user info from index.jsp->userLogin.jsp
		String userType=request.getParameter("usertype");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		//out.println("<h1>hello "+userType+"</h1>");
		HttpSession session=request.getSession();
		Connection connection=null;
		Statement statement=null;
		ResultSet rSet=null;
		connection=dbConnector.DbConnector.getConnection();
		try {
			statement=connection.createStatement();
			String userName="";
			rSet=statement.executeQuery("select * from "+userType+" where email='"+email+"' and password='"+pass+"'");
			if (rSet.next()) {
				session.setAttribute("userMail", email);
				request.setAttribute("user", userType);
				//System.out.println("user is correct");
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}else{
				request.setAttribute("error", "Login failed !! tri again.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
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
