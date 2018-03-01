package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNotice
 */
@WebServlet("/AddNotice")
public class AddNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String subject=request.getParameter("subject");
		String description=request.getParameter("description");
		String date=request.getParameter("date");
		System.out.println(subject);
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			//insert above data into donation table
			String sql="insert into notice(subject, description, date) values(?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, subject);
			pStatement.setString(2, description);
			pStatement.setString(3, date);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Notice info added !!");
				request.getRequestDispatcher("admin/manageNotice.jsp?page=1").forward(request, response);
			}
			else{
				request.setAttribute("message", "Notice info not added ");
				request.getRequestDispatcher("admin/manageNotice.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
