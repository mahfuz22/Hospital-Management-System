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

/**
 * Servlet implementation class UpdateNotice
 */
@WebServlet("/UpdateNotice")
public class UpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		String subject=request.getParameter("subject");
		String description=request.getParameter("description");
		String date=request.getParameter("date");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update notice set subject=?, description=?, date=? where id='"+id+"'";
			PreparedStatement psPreparedStatement=connection.prepareStatement(sql);
			psPreparedStatement.setString(1, subject);
			psPreparedStatement.setString(2, description);
			psPreparedStatement.setString(3, date);
			int i=psPreparedStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Notice Updated !!!");
				request.getRequestDispatcher("admin/manageNotice.jsp?page=1").forward(request, response);
			}
			else {
				request.setAttribute("message", "Blood donor not Updated !!!");
				request.getRequestDispatcher("admin/manageNotice.jsp?page=1").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
