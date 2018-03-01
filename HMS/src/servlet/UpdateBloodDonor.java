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
 * Servlet implementation class UpdateBloodDonor
 */
@WebServlet("/UpdateBloodDonor")
public class UpdateBloodDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBloodDonor() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		int phone=Integer.parseInt(request.getParameter("phone"));
		String sex=request.getParameter("sex");
		int age=Integer.parseInt(request.getParameter("age"));
		String bloodGroup=request.getParameter("bloodgroup");
		String lastDonation=request.getParameter("lastDonate");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update blood_donor set name=?, email=?, address=?, phone=?, sex=?, age=?,"
					+ " blood_group=?, last_donation=? where id='"+id+"'";
			PreparedStatement psPreparedStatement=connection.prepareStatement(sql);
			psPreparedStatement.setString(1, name);
			psPreparedStatement.setString(2, email);
			psPreparedStatement.setString(3, address);
			psPreparedStatement.setInt(4, phone);
			psPreparedStatement.setString(5, sex);
			psPreparedStatement.setInt(6, age);
			psPreparedStatement.setString(7, bloodGroup);
			psPreparedStatement.setString(8, lastDonation);
			int i=psPreparedStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Blood donor Updated !!!");
				request.getRequestDispatcher("nurse/manageBloodDonor.jsp?page=1").forward(request, response);
			}
			else {
				request.setAttribute("message", "Blood donor not Updated !!!");
				request.getRequestDispatcher("nurse/manageBloodDonor.jsp?page=1").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
