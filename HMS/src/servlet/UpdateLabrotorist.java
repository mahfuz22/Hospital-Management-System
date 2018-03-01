package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.java2d.cmm.Profile;

/**
 * Servlet implementation class UpdateLabrotorist
 */
@WebServlet("/UpdateLabrotorist")
public class UpdateLabrotorist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLabrotorist() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String userEmail=request.getParameter("userEmail");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String addr=request.getParameter("address");
		String phone=request.getParameter("phone");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update labrotorist set name=?, email=?, address=?, phone=? where email='"+userEmail+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, name);
			pStatement.setString(2, email);
			pStatement.setString(3, addr);
			pStatement.setString(4, phone);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Updated labrotorist Profile !!!");
				request.getRequestDispatcher("labrotorist/profile.jsp").forward(request, response);
			}
			else {
				request.setAttribute("message", "labrotorist Profile not Updated !!!");
				request.getRequestDispatcher("labrotorist/profile.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
