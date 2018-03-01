package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBedAllotment
 */
@WebServlet("/AddBedAllotment")
public class AddBedAllotment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBedAllotment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String bedType=request.getParameter("bedtype");
		int bedNumber=Integer.parseInt(request.getParameter("bednumber"));
		String patientName=request.getParameter("patientname");
		String allotmentDate=request.getParameter("allotmentdate");
		String dischargeDate=request.getParameter("dischargedate");
		
		
		//storing above data into table(bed_allotment)
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into bed_allotment(bed_number, bed_type, patient_name, allotment_date, discharge_date) values(?,?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, bedNumber);
			pStatement.setString(2, bedType);
			pStatement.setString(3, patientName);
			pStatement.setString(4, allotmentDate);
			pStatement.setString(5, dischargeDate);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Bed allotment success");
				request.getRequestDispatcher("nurse/bedAllotment.jsp?page=1").forward(request, response);
			}
			else{
				request.setAttribute("message", "Bed allotment failed");
				request.getRequestDispatcher("nurse/bedAllotment.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
