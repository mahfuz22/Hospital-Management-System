package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddNurseInfo
 */
@WebServlet("/AddNurseInfo")
public class AddNurseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNurseInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String nurseName=request.getParameter("nurseName");
		String nurseMail=request.getParameter("nurseMail");
		String gender=request.getParameter("gender");
		String pass=request.getParameter("pass");
		String addr=request.getParameter("addr");
		String phone=request.getParameter("phone");
		//out.println("<h1>"+gender+"</h1");
		
		//storing nurse info in database in table(nurse).
		Connection connection = null;
		Statement statement = null;
		connection = dbConnector.DbConnector.getConnection();
		
		try {
			statement = connection.createStatement();
			String sql="insert into nurse(n_name, email, gender, password, address, phone)"
					+ " values('"+nurseName+"', '"+nurseMail+"', '"+gender+"', '"+pass+"', '"+addr+"', '"+phone+"') ";
			int i = statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "Insertion success");
				request.getRequestDispatcher("nurse/addNurse.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "Insertion failed");
				request.getRequestDispatcher("nurse/addNurse.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
