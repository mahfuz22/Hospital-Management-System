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
 * Servlet implementation class UpdatePatientTest
 */
@WebServlet("/UpdatePatientTest")
public class UpdatePatientTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientTest() {
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
		String patientName=request.getParameter("patientname");
		String testType=request.getParameter("type");
		double labfee=Double.parseDouble(request.getParameter("labfee"));
		String date=request.getParameter("date");
		
			Connection connection=dbConnector.DbConnector.getConnection();
			try {
				String sql="update test set patient_name='"+patientName+"', test_type='"+testType+"',"
						+ " lab_fee='"+labfee+"', date='"+date+"' where id='"+id+"'";
				PreparedStatement pStatement=connection.prepareStatement(sql);
				int i=pStatement.executeUpdate();
				if(i>0) {
					request.setAttribute("message", "Patient test updated !!");
					request.getRequestDispatcher("labrotorist/diagnosis.jsp?page=1").forward(request, response);
				}
				else {
					request.setAttribute("message", "Patient test not updated !!");
					request.getRequestDispatcher("labrotorist/diagnosis.jsp?page=1").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
