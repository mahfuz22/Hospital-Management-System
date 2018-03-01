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
 * Servlet implementation class AddBloodDonorByLab
 */
@WebServlet("/AddBloodDonorByLab")
public class AddBloodDonorByLab extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBloodDonorByLab() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		int phone=Integer.parseInt(request.getParameter("phone"));
		String sex=request.getParameter("sex");
		int age=Integer.parseInt(request.getParameter("age"));
		String bloodGroup=request.getParameter("bloodgroup");
		String lastDonation=request.getParameter("lastDonate");
		
		//storing information into database table blood_donor
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into blood_donor(name, email, address, phone, sex, age, blood_group, last_donation)"
					+ " values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, name);
			pStatement.setString(2, email);
			pStatement.setString(3, address);
			pStatement.setInt(4, phone);
			pStatement.setString(5, sex);
			pStatement.setInt(6, age);
			pStatement.setString(7, bloodGroup);
			pStatement.setString(8, lastDonation);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Blood donor is added !!!");
				request.getRequestDispatcher("labrotorist/manageBloodDonor.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Blood donor is not added !!!");
				request.getRequestDispatcher("labrotorist/manageBloodDonor.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
