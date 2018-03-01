package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Bed;
import dao.BedDao;

/**
 * Servlet implementation class AddTest
 */
@WebServlet("/AddTest")
public class AddTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String testType=request.getParameter("type");
		double testFee=Double.parseDouble(request.getParameter("rate"));
		String bDescription=request.getParameter("description");
		
		//storing information into database table(department),
		Connection con=null;
		Statement statement=null;
		con=dbConnector.DbConnector.getConnection();
		
		try {
			statement=con.createStatement();
			String sql="insert into test_type(type, test_fee, description)"
					+ " values('"+testType+"','"+testFee+"','"+bDescription+"')";
			int i=statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "New test Type added !!");
				request.getRequestDispatcher("labrotorist/diagnosisTest.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "New test Type is not added !!");
				request.getRequestDispatcher("labrotorist/diagnosisTest.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
