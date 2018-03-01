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
 * Servlet implementation class AddMedicine
 */
@WebServlet("/AddMedicine")
public class AddMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMedicine() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String description=request.getParameter("description");
		double price=Double.parseDouble(request.getParameter("price"));
		String company=request.getParameter("company");
		double status=Double.parseDouble(request.getParameter("status"));
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into medicine(medicine_name, category, description, price, company, status) values(?,?,?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, name);
			pStatement.setString(2, category);
			pStatement.setString(3, description);
			pStatement.setDouble(4, price);
			pStatement.setString(5, company);
			pStatement.setDouble(6, status);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Medicine Added !!");
				request.getRequestDispatcher("stuff/manageMedicine.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Medicine not Added !!");
				request.getRequestDispatcher("stuff/manageMedicine.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
