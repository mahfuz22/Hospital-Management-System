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
@WebServlet("/AddPatientTest")
public class AddPatientTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatientTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int presid=Integer.parseInt(request.getParameter("id"));
		String patientName=request.getParameter("pateintname");
		String testType=request.getParameter("type");
		String date=request.getParameter("date");
		double labFee=dao.TestDao.getPriceByType(testType);
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into test (pres_id, patient_name, test_type, lab_fee, date) values(?,?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, presid);
			pStatement.setString(2, patientName);
			pStatement.setString(3, testType);
			pStatement.setDouble(4, labFee);
			pStatement.setString(5, date);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Test Info Added");
				request.getRequestDispatcher("labrotorist/diagnosis.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Test Info not Added");
				request.getRequestDispatcher("labrotorist/diagnosis.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
