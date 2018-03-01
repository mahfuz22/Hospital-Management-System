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

import bean.Test;

/**
 * Servlet implementation class UpdateTest
 */
@WebServlet("/UpdateTest")
public class UpdateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String testType=request.getParameter("type");
		double testFee=Double.parseDouble(request.getParameter("rate"));
		String bDescription=request.getParameter("description");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update test_type set type=?, test_fee=?, description=? where id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, testType);
			pStatement.setDouble(2, testFee);
			pStatement.setString(3, bDescription);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Test type Updated");
				request.getRequestDispatcher("labrotorist/diagnosisTest.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Test type not Updated");
				request.getRequestDispatcher("labrotorist/diagnosisTest.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
