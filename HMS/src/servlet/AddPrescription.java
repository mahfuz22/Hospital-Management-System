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

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class AddPrescription
 */
@WebServlet("/AddPrescription")
public class AddPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPrescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//getting information from addPrescription.jsp
		String doctorName=request.getParameter("doctorName");
		String patientName=request.getParameter("patientName");
		String caseHistory=request.getParameter("caseHistory");
		String medication=request.getParameter("medication");
		String mediPherma=request.getParameter("mediPherma");
		String description=request.getParameter("description");
		String date=request.getParameter("date");
		
		//storing above information into the database
		Connection connection=dbConnector.DbConnector.getConnection();
		Statement statement=null;
		try {
			statement=connection.createStatement();
			String sql="insert into prescription(doctor_name, patient_name, case_history, medication, medi_phermacist, description, date)"
					+ " values('"+doctorName+"', '"+patientName+"', '"+caseHistory+"', '"+medication+"', '"+mediPherma+"', '"+description+"', '"+date+"') ";
			int i=statement.executeUpdate(sql);
			if(i>0){
				request.setAttribute("message", "Prescription added");
				request.getRequestDispatcher("doctor/docPrescription.jsp?page=1").forward(request, response);
			}
			else{
				request.setAttribute("message", "Prescription not added");
				request.getRequestDispatcher("doctor/docPrescription.jsp?page=1").forward(request, response);
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
