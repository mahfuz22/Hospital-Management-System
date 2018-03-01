package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddDepartInfo
 */
@WebServlet("/AddDepartInfo")
public class AddDepartInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDepartInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String depName=request.getParameter("depname");
		String description=request.getParameter("description");
		
		//storing information into database table(department),
		Connection con=null;
		Statement statement=null;
		con=dbConnector.DbConnector.getConnection();
		try {
			statement=con.createStatement();
			String sql="insert into department(dep_name, description) values('"+depName+"','"+description+"')";
			int i=statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "Department info added !!");
				request.getRequestDispatcher("department/department.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "Department info is not added !!");
				request.getRequestDispatcher("department/department.jsp").forward(request, response);
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
