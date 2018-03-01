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
 * Servlet implementation class AddDonationByLab
 */
@WebServlet("/AddDonationByLab")
public class AddDonationByLab extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDonationByLab() {
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
		String bloodgroup=request.getParameter("bloodgroup");
		//System.out.println(bloodgroup);
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			//insert above data into donation table
			String sql="insert into donation(donor_name, blood_group) values(?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, name);
			pStatement.setString(2, bloodgroup);
			int i=pStatement.executeUpdate();
			
			//select status for update blood_bank table
			String sql2="select status from blood_bank where blood_group='"+bloodgroup+"'";
			PreparedStatement statement=connection.prepareStatement(sql2);
			ResultSet rSet=statement.executeQuery();
			int status=0;
			while(rSet.next()) {
				status=rSet.getInt("status");
			}
			
			//update status of blood_bank.
			status=status+1;
			String sql3="update blood_bank set status='"+status+"' where blood_group='"+bloodgroup+"'";
			Statement statement2=connection.createStatement();
			statement2.executeUpdate(sql3);
			if (i>0) {
				request.setAttribute("message", "Thank you for donation");
				request.getRequestDispatcher("labrotorist/manageBloodBank.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "Bed allotment failed");
				request.getRequestDispatcher("labrotorist/manageBloodBank.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
